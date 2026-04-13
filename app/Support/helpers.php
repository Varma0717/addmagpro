<?php

use Illuminate\Support\Facades\Storage;

if (!function_exists('imageUrl')) {
    /**
     * Generate a URL for an image path.
     * Legacy paths starting with 'assets/' are served from public/.
     * Other paths use Laravel's Storage::url().
     */
    function imageUrl(?string $path): string
    {
        if (!$path) {
            return asset('assets/images/logo.png');
        }

        if (str_starts_with($path, 'assets/')) {
            return asset($path);
        }

        return Storage::disk('public')->url($path);
    }
}
