<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Ad;
use App\Models\Banner;
use App\Support\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class AdsController extends Controller
{
    use ApiResponse;

    private const PLACEMENTS = ['home', 'category', 'product'];

    public function index(Request $request, string $placement)
    {
        if (!in_array($placement, self::PLACEMENTS, true)) {
            return $this->error('Invalid placement. Allowed values: home, category, product.', 422);
        }

        $ads = Ad::query()
            ->active()
            ->where('placement', $this->mapAdPlacement($placement))
            ->orderByDesc('id')
            ->get()
            ->map(function (Ad $ad): array {
                return [
                    'id' => $ad->id,
                    'source' => 'ad',
                    'image' => $ad->image ? imageUrl($ad->image) : null,
                    'title' => $ad->title,
                    'destination' => $ad->link_url,
                    'cta' => 'Learn more',
                    'active_window' => [
                        'starts_at' => $ad->start_date,
                        'ends_at' => $ad->end_date,
                    ],
                    'track_click_url' => route('api.v1.ads.click', ['ad' => $ad]),
                ];
            });

        $banners = Banner::query()
            ->active()
            ->when($placement === 'home', function ($query): void {
                $query->whereIn('placement', ['homepage_carousel', 'homepage_mid']);
            }, function ($query) use ($placement): void {
                $query->where('placement', $placement);
            })
            ->orderBy('sort_order')
            ->orderByDesc('id')
            ->get()
            ->map(function (Banner $banner): array {
                return [
                    'id' => $banner->id,
                    'source' => 'banner',
                    'image' => $banner->image ? imageUrl($banner->image) : null,
                    'title' => $banner->title,
                    'destination' => $this->normalizeBannerDestination($banner),
                    'cta' => $banner->subtitle ?: 'Learn more',
                    'active_window' => [
                        'starts_at' => $banner->start_date,
                        'ends_at' => $banner->end_date,
                    ],
                    'track_click_url' => null,
                ];
            });

        $payload = Collection::make()
            ->merge($ads)
            ->merge($banners)
            ->values();

        return $this->success($payload, 'Ads fetched');
    }

    public function click(Ad $ad)
    {
        if (!$ad->is_active) {
            return $this->error('Ad is not active.', 404);
        }

        $ad->increment('clicks');

        return $this->success([
            'id' => $ad->id,
            'placement' => $ad->placement,
            'clicks' => $ad->clicks,
        ], 'Ad click tracked');
    }

    private function mapAdPlacement(string $placement): string
    {
        return $placement === 'home' ? 'homepage' : $placement;
    }

    private function normalizeBannerDestination(Banner $banner): ?string
    {
        if (!$banner->link_value) {
            return null;
        }

        return match ($banner->link_type) {
            'url' => $banner->link_value,
            default => sprintf('%s:%s', $banner->link_type, $banner->link_value),
        };
    }
}
