<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class MigrateOldImages extends Command
{
    protected $signature = 'app:migrate-old-images
                            {--source= : Absolute path to old site storage (e.g. /var/www/old-site/storage/app/public)}
                            {--download-from= : Base URL to download images from (e.g. https://addmagpro.com)}
                            {--dry-run : Preview what would be copied without writing}
                            {--tables=all : Comma-separated: products,listings,banners,ads}';

    protected $description = 'Migrate images from the old addmagpro.com site to the new storage';

    public function handle(): int
    {
        $source = $this->option('source');
        $downloadFrom = $this->option('download-from');
        $dryRun = $this->option('dry-run');
        $requestedTables = $this->option('tables') === 'all'
            ? ['products', 'listings', 'banners', 'ads']
            : explode(',', $this->option('tables'));

        if (!$source && !$downloadFrom) {
            $this->error('You must provide either --source (file path) or --download-from (URL).');
            $this->newLine();
            $this->line('Examples:');
            $this->line('  php artisan app:migrate-old-images --source=/var/www/old-site/storage/app/public');
            $this->line('  php artisan app:migrate-old-images --download-from=https://addmagpro.com');
            return self::FAILURE;
        }

        $mode = $source ? 'file' : 'http';
        $this->info("Image migration mode: {$mode}" . ($dryRun ? ' [DRY RUN]' : ''));

        // Ensure storage link exists
        $publicStorage = public_path('storage');
        if (!file_exists($publicStorage)) {
            $this->warn('Storage symlink does not exist. Create it manually:');
            $this->line('  ln -s ' . storage_path('app/public') . ' ' . $publicStorage);
            $this->warn('Continuing anyway — images will be saved to storage/app/public/');
        }

        $stats = ['found' => 0, 'copied' => 0, 'skipped' => 0, 'failed' => 0];

        foreach ($requestedTables as $table) {
            $table = trim($table);
            match ($table) {
                'products' => $this->migrateProductImages($mode, $source, $downloadFrom, $dryRun, $stats),
                'listings' => $this->migrateListingImages($mode, $source, $downloadFrom, $dryRun, $stats),
                'banners'  => $this->migrateBannerImages($mode, $source, $downloadFrom, $dryRun, $stats),
                'ads'      => $this->migrateAdImages($mode, $source, $downloadFrom, $dryRun, $stats),
                default    => $this->warn("Unknown table: {$table}"),
            };
        }

        $this->newLine();
        $this->info('Image migration summary:');
        $this->table(
            ['Metric', 'Count'],
            collect($stats)->map(fn ($v, $k) => [ucfirst($k), $v])->values()->toArray()
        );

        return self::SUCCESS;
    }

    private function migrateProductImages(string $mode, ?string $source, ?string $downloadFrom, bool $dryRun, array &$stats): void
    {
        $images = DB::table('product_images')->whereNotNull('image_path')->get();
        $this->info("▸ Product images: {$images->count()} records");

        $bar = $this->output->createProgressBar($images->count());
        foreach ($images as $image) {
            $result = $this->copyImage($image->image_path, $mode, $source, $downloadFrom, $dryRun);
            $stats[$result]++;
            $stats['found']++;
            $bar->advance();
        }
        $bar->finish();
        $this->newLine();
    }

    private function migrateListingImages(string $mode, ?string $source, ?string $downloadFrom, bool $dryRun, array &$stats): void
    {
        $images = DB::table('listing_images')->whereNotNull('image_path')->get();
        $this->info("▸ Listing images: {$images->count()} records");

        $bar = $this->output->createProgressBar($images->count());
        foreach ($images as $image) {
            $result = $this->copyImage($image->image_path, $mode, $source, $downloadFrom, $dryRun);
            $stats[$result]++;
            $stats['found']++;
            $bar->advance();
        }
        $bar->finish();
        $this->newLine();
    }

    private function migrateBannerImages(string $mode, ?string $source, ?string $downloadFrom, bool $dryRun, array &$stats): void
    {
        $banners = DB::table('banners')->whereNotNull('image')->get();
        $this->info("▸ Banner images: {$banners->count()} records");

        $bar = $this->output->createProgressBar($banners->count());
        foreach ($banners as $banner) {
            $result = $this->copyImage($banner->image, $mode, $source, $downloadFrom, $dryRun);
            $stats[$result]++;
            $stats['found']++;
            $bar->advance();
        }
        $bar->finish();
        $this->newLine();
    }

    private function migrateAdImages(string $mode, ?string $source, ?string $downloadFrom, bool $dryRun, array &$stats): void
    {
        $ads = DB::table('ads')->whereNotNull('image')->get();
        $this->info("▸ Ad images: {$ads->count()} records");

        $bar = $this->output->createProgressBar($ads->count());
        foreach ($ads as $ad) {
            $result = $this->copyImage($ad->image, $mode, $source, $downloadFrom, $dryRun);
            $stats[$result]++;
            $stats['found']++;
            $bar->advance();
        }
        $bar->finish();
        $this->newLine();
    }

    /**
     * Copy a single image file. Returns 'copied', 'skipped', or 'failed'.
     */
    private function copyImage(string $imagePath, string $mode, ?string $source, ?string $downloadFrom, bool $dryRun): string
    {
        // Normalize path - remove leading storage/ or /storage/ prefix
        $relativePath = preg_replace('#^/?storage/#', '', $imagePath);

        $destPath = storage_path('app/public/' . $relativePath);

        // Skip if already exists
        if (file_exists($destPath)) {
            return 'skipped';
        }

        if ($dryRun) {
            return 'copied';
        }

        // Ensure destination directory exists
        $destDir = dirname($destPath);
        if (!is_dir($destDir)) {
            mkdir($destDir, 0755, true);
        }

        if ($mode === 'file') {
            return $this->copyFromFile($source, $relativePath, $destPath);
        }

        return $this->downloadFromUrl($downloadFrom, $imagePath, $destPath);
    }

    private function copyFromFile(string $source, string $relativePath, string $destPath): string
    {
        $sourcePath = rtrim($source, '/') . '/' . $relativePath;

        if (!file_exists($sourcePath)) {
            return 'failed';
        }

        try {
            copy($sourcePath, $destPath);
            return 'copied';
        } catch (\Exception $e) {
            $this->warn("  Failed to copy: {$sourcePath} — " . $e->getMessage());
            return 'failed';
        }
    }

    private function downloadFromUrl(string $baseUrl, string $imagePath, string $destPath): string
    {
        // Try multiple URL patterns
        $urls = [
            rtrim($baseUrl, '/') . '/storage/' . ltrim($imagePath, '/'),
            rtrim($baseUrl, '/') . '/' . ltrim($imagePath, '/'),
        ];

        foreach ($urls as $url) {
            try {
                $response = Http::timeout(30)->get($url);
                if ($response->successful()) {
                    $contentType = $response->header('Content-Type');
                    // Verify it's an image
                    if ($contentType && str_starts_with($contentType, 'image/')) {
                        file_put_contents($destPath, $response->body());
                        return 'copied';
                    }
                }
            } catch (\Exception $e) {
                continue;
            }
        }

        return 'failed';
    }
}
