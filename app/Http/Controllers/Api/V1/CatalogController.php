<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\ServiceListing;
use App\Support\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CatalogController extends Controller
{
    use ApiResponse;

    public function categories()
    {
        $categories = Category::active()
            ->topLevel()
            ->orderBy('type')
            ->orderBy('sort_order')
            ->get()
            ->map(function (Category $category): array {
                return [
                    'id' => $category->id,
                    'name' => $category->name,
                    'slug' => $category->slug,
                    'type' => $category->type,
                    'icon' => $category->icon,
                    'image_url' => $category->image ? Storage::url($category->image) : null,
                ];
            })
            ->values();

        return $this->success($categories, 'Categories fetched');
    }

    public function products(Request $request)
    {
        $perPage = min((int) $request->integer('per_page', 20), 50);

        $query = Product::query()
            ->active()
            ->inStock()
            ->with(['primaryImage', 'category'])
            ->withAvg('reviews as rating_avg', 'rating');

        if ($request->filled('category_slug')) {
            $categoryId = Category::where('slug', $request->string('category_slug'))->value('id');
            if ($categoryId) {
                $query->where('category_id', $categoryId);
            }
        }

        if ($request->filled('min_price')) {
            $query->where('price', '>=', (float) $request->input('min_price'));
        }

        if ($request->filled('max_price')) {
            $query->where('price', '<=', (float) $request->input('max_price'));
        }

        $sort = (string) $request->input('sort', 'latest');
        match ($sort) {
            'price_asc' => $query->orderBy('price'),
            'price_desc' => $query->orderByDesc('price'),
            default => $query->latest(),
        };

        $products = $query->paginate($perPage)->withQueryString();

        $data = $products->through(function (Product $product): array {
            return [
                'id' => $product->id,
                'name' => $product->name,
                'slug' => $product->slug,
                'short_description' => $product->short_description,
                'price' => $product->price,
                'discount_price' => $product->discount_price,
                'effective_price' => $product->effective_price,
                'stock' => $product->stock,
                'rating_avg' => $product->rating_avg ? round((float) $product->rating_avg, 1) : null,
                'is_featured' => $product->is_featured,
                'category' => [
                    'id' => $product->category?->id,
                    'name' => $product->category?->name,
                    'slug' => $product->category?->slug,
                ],
                'primary_image_url' => $product->primaryImage?->image_path ? Storage::url($product->primaryImage->image_path) : null,
            ];
        });

        return $this->success($data->items(), 'Products fetched', 200, [
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
            ],
        ]);
    }

    public function productShow(string $slug)
    {
        $product = Product::active()
            ->inStock()
            ->where('slug', $slug)
            ->with(['category', 'images', 'reviews.user'])
            ->withAvg('reviews as rating_avg', 'rating')
            ->first();

        if (!$product) {
            return $this->error('Product not found', 404);
        }

        return $this->success([
            'id' => $product->id,
            'name' => $product->name,
            'slug' => $product->slug,
            'description' => $product->description,
            'short_description' => $product->short_description,
            'price' => $product->price,
            'discount_price' => $product->discount_price,
            'effective_price' => $product->effective_price,
            'stock' => $product->stock,
            'rating_avg' => $product->rating_avg ? round((float) $product->rating_avg, 1) : null,
            'category' => [
                'id' => $product->category?->id,
                'name' => $product->category?->name,
                'slug' => $product->category?->slug,
            ],
            'images' => $product->images->map(fn($image) => [
                'id' => $image->id,
                'image_url' => Storage::url($image->image_path),
                'is_primary' => (bool) $image->is_primary,
                'sort_order' => $image->sort_order,
            ])->values(),
            'reviews' => $product->reviews
                ->where('is_approved', true)
                ->values()
                ->map(fn($review) => [
                    'id' => $review->id,
                    'rating' => $review->rating,
                    'comment' => $review->comment,
                    'user' => [
                        'id' => $review->user?->id,
                        'name' => $review->user?->name,
                    ],
                    'created_at' => $review->created_at,
                ]),
        ], 'Product fetched');
    }

    public function listings(Request $request)
    {
        $perPage = min((int) $request->integer('per_page', 20), 50);

        $query = ServiceListing::query()
            ->approved()
            ->with(['images', 'category'])
            ->withAvg('reviews as rating_avg', 'rating');

        if ($request->filled('category_slug')) {
            $categoryId = Category::where('slug', $request->string('category_slug'))->value('id');
            if ($categoryId) {
                $query->where('category_id', $categoryId);
            }
        }

        if ($request->filled('city')) {
            $query->where('city', 'like', '%' . $request->input('city') . '%');
        }

        $sort = (string) $request->input('sort', 'latest');
        match ($sort) {
            'featured' => $query->orderByDesc('is_featured')->latest(),
            default => $query->latest(),
        };

        $listings = $query->paginate($perPage)->withQueryString();

        $data = $listings->through(function (ServiceListing $listing): array {
            return [
                'id' => $listing->id,
                'business_name' => $listing->business_name,
                'slug' => $listing->slug,
                'description' => $listing->description,
                'city' => $listing->city,
                'phone' => $listing->phone,
                'whatsapp' => $listing->whatsapp,
                'website_url' => $listing->website_url,
                'is_featured' => $listing->is_featured,
                'rating_avg' => $listing->rating_avg ? round((float) $listing->rating_avg, 1) : null,
                'category' => [
                    'id' => $listing->category?->id,
                    'name' => $listing->category?->name,
                    'slug' => $listing->category?->slug,
                ],
                'primary_image_url' => $listing->images->first()?->image_path ? Storage::url($listing->images->first()->image_path) : null,
            ];
        });

        return $this->success($data->items(), 'Service listings fetched', 200, [
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
            ],
        ]);
    }

    public function listingShow(string $slug)
    {
        $listing = ServiceListing::approved()
            ->where('slug', $slug)
            ->with(['category', 'images', 'reviews.user'])
            ->withAvg('reviews as rating_avg', 'rating')
            ->first();

        if (!$listing) {
            return $this->error('Listing not found', 404);
        }

        return $this->success([
            'id' => $listing->id,
            'business_name' => $listing->business_name,
            'slug' => $listing->slug,
            'description' => $listing->description,
            'address' => $listing->address,
            'city' => $listing->city,
            'phone' => $listing->phone,
            'whatsapp' => $listing->whatsapp,
            'website_url' => $listing->website_url,
            'latitude' => $listing->latitude,
            'longitude' => $listing->longitude,
            'is_featured' => $listing->is_featured,
            'rating_avg' => $listing->rating_avg ? round((float) $listing->rating_avg, 1) : null,
            'category' => [
                'id' => $listing->category?->id,
                'name' => $listing->category?->name,
                'slug' => $listing->category?->slug,
            ],
            'images' => $listing->images->map(fn($image) => [
                'id' => $image->id,
                'image_url' => Storage::url($image->image_path),
            ])->values(),
            'reviews' => $listing->reviews
                ->where('is_approved', true)
                ->values()
                ->map(fn($review) => [
                    'id' => $review->id,
                    'rating' => $review->rating,
                    'comment' => $review->comment,
                    'user' => [
                        'id' => $review->user?->id,
                        'name' => $review->user?->name,
                    ],
                    'created_at' => $review->created_at,
                ]),
        ], 'Service listing fetched');
    }

    public function search(Request $request)
    {
        $queryText = trim((string) $request->input('q', ''));
        if (mb_strlen($queryText) < 2) {
            return $this->error('Search query must be at least 2 characters', 422, [
                'q' => ['Minimum length is 2 characters.'],
            ]);
        }

        $products = Product::active()
            ->inStock()
            ->where(function ($query) use ($queryText): void {
                $query->where('name', 'like', "%{$queryText}%")
                    ->orWhere('short_description', 'like', "%{$queryText}%");
            })
            ->with(['primaryImage', 'category'])
            ->take(20)
            ->get()
            ->map(function (Product $product): array {
                return [
                    'id' => $product->id,
                    'name' => $product->name,
                    'slug' => $product->slug,
                    'price' => $product->price,
                    'discount_price' => $product->discount_price,
                    'effective_price' => $product->effective_price,
                    'category' => $product->category?->name,
                    'primary_image_url' => $product->primaryImage?->image_path ? Storage::url($product->primaryImage->image_path) : null,
                ];
            })
            ->values();

        $listings = ServiceListing::approved()
            ->where(function ($query) use ($queryText): void {
                $query->where('business_name', 'like', "%{$queryText}%")
                    ->orWhere('description', 'like', "%{$queryText}%")
                    ->orWhere('city', 'like', "%{$queryText}%");
            })
            ->with(['images', 'category'])
            ->take(20)
            ->get()
            ->map(function (ServiceListing $listing): array {
                return [
                    'id' => $listing->id,
                    'business_name' => $listing->business_name,
                    'slug' => $listing->slug,
                    'city' => $listing->city,
                    'category' => $listing->category?->name,
                    'primary_image_url' => $listing->images->first()?->image_path ? Storage::url($listing->images->first()->image_path) : null,
                ];
            })
            ->values();

        return $this->success([
            'query' => $queryText,
            'products' => $products,
            'listings' => $listings,
        ], 'Search results fetched');
    }
}
