<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ScrapeOldSiteImages extends Command
{
    protected $signature = 'app:scrape-old-images
                            {--url=https://addmagpro.com : Base URL of the old site}
                            {--dry-run : Preview without downloading}';

    protected $description = 'Scrape and download all images from the old addmagpro.com homepage';

    public function handle(): int
    {
        $baseUrl = rtrim($this->option('url'), '/');
        $dryRun = $this->option('dry-run');

        $this->info('Fetching homepage HTML from ' . $baseUrl . ($dryRun ? ' [DRY RUN]' : ''));

        try {
            $response = Http::timeout(30)->get($baseUrl);
            if (!$response->successful()) {
                $this->error("Failed to fetch homepage: HTTP {$response->status()}");
                return self::FAILURE;
            }
        } catch (\Exception $e) {
            $this->error("Failed to fetch homepage: " . $e->getMessage());
            return self::FAILURE;
        }

        $html = $response->body();

        // Extract all image URLs from <img src="..."> and style="background-image: url(...)"
        $imageUrls = [];

        // <img src="..." />
        preg_match_all('/<img[^>]+src=["\']([^"\']+)["\']/', $html, $imgMatches);
        foreach ($imgMatches[1] as $src) {
            $imageUrls[] = $src;
        }

        // background-image: url(...)
        preg_match_all('/background-image:\s*url\(["\']?([^"\')\s]+)["\']?\)/', $html, $bgMatches);
        foreach ($bgMatches[1] as $src) {
            $imageUrls[] = $src;
        }

        // Also check data-src for lazy-loaded images
        preg_match_all('/<img[^>]+data-src=["\']([^"\']+)["\']/', $html, $lazyMatches);
        foreach ($lazyMatches[1] as $src) {
            $imageUrls[] = $src;
        }

        // Normalize and deduplicate
        $imageUrls = collect($imageUrls)
            ->map(function (string $url) use ($baseUrl) {
                $url = trim($url);
                if (Str::startsWith($url, '//')) {
                    return 'https:' . $url;
                }
                if (Str::startsWith($url, '/')) {
                    return $baseUrl . $url;
                }
                if (!Str::startsWith($url, 'http')) {
                    return $baseUrl . '/' . $url;
                }
                return $url;
            })
            ->filter(function (string $url) use ($baseUrl) {
                // Only download images from the old site domain
                $host = parse_url($baseUrl, PHP_URL_HOST);
                return Str::contains($url, $host);
            })
            ->unique()
            ->values();

        $this->info("Found {$imageUrls->count()} unique images from old site");

        if ($imageUrls->isEmpty()) {
            $this->warn('No images found.');
            return self::SUCCESS;
        }

        // Categorize images
        $categories = [
            'banners' => [],
            'products' => [],
            'vendors' => [],
            'categories' => [],
            'other' => [],
        ];

        foreach ($imageUrls as $url) {
            $lower = strtolower($url);
            if (Str::contains($lower, ['banner', 'slider', 'carousel', 'slide'])) {
                $categories['banners'][] = $url;
            } elseif (Str::contains($lower, ['product', 'item', 'grocery'])) {
                $categories['products'][] = $url;
            } elseif (Str::contains($lower, ['vendor', 'store', 'shop'])) {
                $categories['vendors'][] = $url;
            } elseif (Str::contains($lower, ['category', 'categ'])) {
                $categories['categories'][] = $url;
            } else {
                $categories['other'][] = $url;
            }
        }

        $this->newLine();
        foreach ($categories as $cat => $urls) {
            $this->line("  {$cat}: " . count($urls) . ' images');
        }
        $this->newLine();

        // List all image URLs
        $this->table(['#', 'Category', 'URL'], $imageUrls->map(function ($url, $i) use ($categories) {
            $cat = 'other';
            foreach ($categories as $c => $urls) {
                if (in_array($url, $urls)) {
                    $cat = $c;
                    break;
                }
            }
            return [$i + 1, $cat, Str::limit($url, 80)];
        })->toArray());

        if ($dryRun) {
            $this->info('Dry run complete. No files downloaded.');
            return self::SUCCESS;
        }

        // Download all images
        $stats = ['downloaded' => 0, 'skipped' => 0, 'failed' => 0];
        $bar = $this->output->createProgressBar($imageUrls->count());

        foreach ($imageUrls as $url) {
            $cat = 'other';
            foreach ($categories as $c => $urls) {
                if (in_array($url, $urls)) {
                    $cat = $c;
                    break;
                }
            }

            $filename = basename(parse_url($url, PHP_URL_PATH));
            if (empty($filename) || $filename === '/') {
                $filename = md5($url) . '.jpg';
            }

            $storagePath = "scraped/{$cat}/{$filename}";

            if (Storage::disk('public')->exists($storagePath)) {
                $stats['skipped']++;
                $bar->advance();
                continue;
            }

            try {
                $imgResponse = Http::timeout(30)->get($url);
                if ($imgResponse->successful()) {
                    $contentType = $imgResponse->header('Content-Type');
                    if ($contentType && Str::startsWith($contentType, 'image/')) {
                        Storage::disk('public')->put($storagePath, $imgResponse->body());
                        $stats['downloaded']++;
                    } else {
                        $stats['failed']++;
                    }
                } else {
                    $stats['failed']++;
                }
            } catch (\Exception $e) {
                $stats['failed']++;
            }

            $bar->advance();
        }

        $bar->finish();
        $this->newLine(2);

        $this->info('Download summary:');
        $this->table(
            ['Metric', 'Count'],
            collect($stats)->map(fn($v, $k) => [ucfirst($k), $v])->values()->toArray()
        );

        $this->newLine();
        $this->info('Images saved to: storage/app/public/scraped/');
        $this->line('Access via: /storage/scraped/{category}/{filename}');

        // Now update banner records with any scraped banner images
        $bannerImages = Storage::disk('public')->files('scraped/banners');
        if (count($bannerImages) > 0) {
            $this->newLine();
            $this->info('Updating banner records with scraped images...');
            $banners = \App\Models\Banner::orderBy('sort_order')->get();
            foreach ($banners as $i => $banner) {
                if (isset($bannerImages[$i])) {
                    $banner->update(['image' => $bannerImages[$i]]);
                    $this->line("  Updated banner '{$banner->title}' → {$bannerImages[$i]}");
                }
            }
        }

        return self::SUCCESS;
    }
}
