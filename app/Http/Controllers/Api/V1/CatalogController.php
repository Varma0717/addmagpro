<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Coupon;
use App\Models\Product;
use App\Models\ServiceListing;
use App\Support\ApiResponse;
use Illuminate\Http\Request;

class CatalogController extends Controller
{
    use ApiResponse;

    public function home(Request $request)
    {
        $limit = max(4, min((int) $request->integer('limit', 8), 20));
        $latitude = $request->filled('lat') ? (float) $request->input('lat') : null;
        $longitude = $request->filled('lng') ? (float) $request->input('lng') : null;
        $city = trim((string) $request->input('city', ''));

        $banners = Banner::active()
            ->forPlacement('home')
            ->orderBy('sort_order')
            ->take(5)
            ->get()
            ->map(fn(Banner $banner): array => [
                'id' => $banner->id,
                'title' => $banner->title,
                'subtitle' => $banner->subtitle,
                'image_url' => $banner->image ? imageUrl($banner->image) : null,
                'link_type' => $banner->link_type,
                'link_value' => $banner->link_value,
            ])
            ->values();

        if ($banners->isEmpty()) {
            $banners = Banner::active()
                ->orderBy('sort_order')
                ->take(5)
                ->get()
                ->map(fn(Banner $banner): array => [
                    'id' => $banner->id,
                    'title' => $banner->title,
                    'subtitle' => $banner->subtitle,
                    'image_url' => $banner->image ? imageUrl($banner->image) : null,
                    'link_type' => $banner->link_type,
                    'link_value' => $banner->link_value,
                ])
                ->values();
        }

        $categories = Category::active()
            ->topLevel()
            ->orderBy('sort_order')
            ->take(10)
            ->get()
            ->map(function (Category $category): array {
                return [
                    'id' => $category->id,
                    'name' => $category->name,
                    'slug' => $category->slug,
                    'type' => $category->type,
                    'image_url' => $category->image ? imageUrl($category->image) : null,
                ];
            })
            ->values();

        $featuredProducts = Product::active()
            ->inStock()
            ->featured()
            ->with(['primaryImage', 'category'])
            ->withAvg('reviews as rating_avg', 'rating')
            ->latest()
            ->take($limit)
            ->get()
            ->map(function (Product $product): array {
                return [
                    'id' => $product->id,
                    'name' => $product->name,
                    'slug' => $product->slug,
                    'effective_price' => $product->effective_price,
                    'price' => $product->price,
                    'discount_price' => $product->discount_price,
                    'rating_avg' => $product->rating_avg ? round((float) $product->rating_avg, 1) : null,
                    'category' => $product->category?->name,
                    'primary_image_url' => $product->primaryImage?->image_path ? imageUrl($product->primaryImage->image_path) : null,
                ];
            })
            ->values();

        $featuredListings = ServiceListing::approved()
            ->featured()
            ->with(['images', 'category'])
            ->withAvg('reviews as rating_avg', 'rating')
            ->latest()
            ->take($limit)
            ->get()
            ->map(function (ServiceListing $listing): array {
                return [
                    'id' => $listing->id,
                    'business_name' => $listing->business_name,
                    'slug' => $listing->slug,
                    'city' => $listing->city,
                    'category' => $listing->category?->name,
                    'phone' => $listing->phone,
                    'whatsapp' => $listing->whatsapp,
                    'rating_avg' => $listing->rating_avg ? round((float) $listing->rating_avg, 1) : null,
                    'primary_image_url' => $listing->images->first()?->image_path
                        ? imageUrl($listing->images->first()->image_path)
                        : null,
                ];
            })
            ->values();

        $nearbyQuery = ServiceListing::approved()
            ->with(['images', 'category'])
            ->withAvg('reviews as rating_avg', 'rating');

        if ($latitude !== null && $longitude !== null) {
            $nearbyQuery
                ->whereNotNull('latitude')
                ->whereNotNull('longitude')
                ->orderByRaw('POW(latitude - ?, 2) + POW(longitude - ?, 2)', [$latitude, $longitude]);
        } elseif ($city !== '') {
            $nearbyQuery
                ->where('city', 'like', '%' . $city . '%')
                ->latest();
        } else {
            $nearbyQuery->latest();
        }

        $nearbyListings = $nearbyQuery
            ->take($limit)
            ->get()
            ->map(function (ServiceListing $listing): array {
                return [
                    'id' => $listing->id,
                    'business_name' => $listing->business_name,
                    'slug' => $listing->slug,
                    'city' => $listing->city,
                    'category' => $listing->category?->name,
                    'phone' => $listing->phone,
                    'whatsapp' => $listing->whatsapp,
                    'rating_avg' => $listing->rating_avg ? round((float) $listing->rating_avg, 1) : null,
                    'primary_image_url' => $listing->images->first()?->image_path
                        ? imageUrl($listing->images->first()->image_path)
                        : null,
                ];
            })
            ->values();

        $offers = Coupon::query()
            ->where('is_active', true)
            ->where(function ($query): void {
                $query->whereNull('expires_at')->orWhere('expires_at', '>=', now());
            })
            ->orderByDesc('id')
            ->take(6)
            ->get()
            ->map(function (Coupon $coupon): array {
                return [
                    'id' => $coupon->id,
                    'code' => $coupon->code,
                    'name' => $coupon->name,
                    'type' => $coupon->type,
                    'value' => (float) $coupon->value,
                    'min_order_amount' => (float) ($coupon->min_order_amount ?? 0),
                    'max_discount_amount' => (float) ($coupon->max_discount_amount ?? 0),
                    'expires_at' => $coupon->expires_at,
                ];
            })
            ->values();

        $trendingProducts = Product::active()
            ->inStock()
            ->with(['primaryImage', 'category'])
            ->withCount('wishlists')
            ->withAvg('reviews as rating_avg', 'rating')
            ->orderByDesc('wishlists_count')
            ->orderByDesc('rating_avg')
            ->take($limit)
            ->get()
            ->map(function (Product $product): array {
                return [
                    'id' => $product->id,
                    'name' => $product->name,
                    'slug' => $product->slug,
                    'effective_price' => $product->effective_price,
                    'rating_avg' => $product->rating_avg ? round((float) $product->rating_avg, 1) : null,
                    'wishlists_count' => $product->wishlists_count,
                    'category' => $product->category?->name,
                    'primary_image_url' => $product->primaryImage?->image_path ? imageUrl($product->primaryImage->image_path) : null,
                ];
            })
            ->values();

        return $this->success([
            'banners' => $banners,
            'categories' => $categories,
            'featured_products' => $featuredProducts,
            'featured_listings' => $featuredListings,
            'nearby_listings' => $nearbyListings,
            'offers' => $offers,
            'trending_products' => $trendingProducts,
        ], 'Home feed fetched');
    }

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
                    'image_url' => $category->image ? imageUrl($category->image) : null,
                ];
            })
            ->values();

        return $this->success($categories, 'Categories fetched');
    }

    public function products(Request $request)
    {
        $perPage = min((int) $request->integer('per_page', 20), 50);
        $categoryId = null;

        $query = Product::query()
            ->active()
            ->inStock()
            ->with(['primaryImage', 'category', 'brand'])
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

        if ($request->filled('min_rating')) {
            $query->having('rating_avg', '>=', (float) $request->input('min_rating'));
        }

        if ($request->filled('brand_id')) {
            $query->where('brand_id', (int) $request->input('brand_id'));
        }

        $sort = (string) $request->input('sort', 'latest');
        match ($sort) {
            'price_asc' => $query->orderBy('price'),
            'price_desc' => $query->orderByDesc('price'),
            'rating' => $query->orderByDesc('rating_avg'),
            default => $query->latest(),
        };

        $products = $query->paginate($perPage)->withQueryString();
        $availableBrandsQuery = Brand::query()->orderBy('brand_name');
        if ($categoryId) {
            $availableBrandsQuery->whereHas('products', function ($brandProductsQuery) use ($categoryId) {
                $brandProductsQuery->active()->inStock()->where('category_id', $categoryId);
            });
        }
        $availableBrands = $availableBrandsQuery->get(['id', 'brand_name']);

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
                'brand' => [
                    'id' => $product->brand?->id,
                    'name' => $product->brand?->brand_name,
                ],
                'primary_image_url' => $product->primaryImage?->image_path ? imageUrl($product->primaryImage->image_path) : null,
            ];
        });

        return $this->success($data->items(), 'Products fetched', 200, [
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
            ],
            'filters' => [
                'available_brands' => $availableBrands->map(function (Brand $brand): array {
                    return [
                        'id' => $brand->id,
                        'name' => $brand->brand_name,
                    ];
                })->values(),
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
                'image_url' => imageUrl($image->image_path),
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
                'primary_image_url' => $listing->images->first()?->image_path ? imageUrl($listing->images->first()->image_path) : null,
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
                'image_url' => imageUrl($image->image_path),
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
                    'primary_image_url' => $product->primaryImage?->image_path ? imageUrl($product->primaryImage->image_path) : null,
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
                    'primary_image_url' => $listing->images->first()?->image_path ? imageUrl($listing->images->first()->image_path) : null,
                ];
            })
            ->values();

        return $this->success([
            'query' => $queryText,
            'products' => $products,
            'listings' => $listings,
        ], 'Search results fetched');
    }

    public function searchMixed(Request $request)
    {
        $queryText = trim((string) $request->input('q', ''));
        if (mb_strlen($queryText) < 2) {
            return $this->error('Search query must be at least 2 characters', 422, [
                'q' => ['Minimum length is 2 characters.'],
            ]);
        }

        $perPage = max(5, min((int) $request->integer('per_page', 20), 50));

        $productRows = Product::active()
            ->inStock()
            ->where(function ($query) use ($queryText): void {
                $query->where('name', 'like', "%{$queryText}%")
                    ->orWhere('short_description', 'like', "%{$queryText}%");
            })
            ->with(['primaryImage', 'category'])
            ->limit($perPage)
            ->get()
            ->map(function (Product $product): array {
                return [
                    'type' => 'product',
                    'id' => $product->id,
                    'title' => $product->name,
                    'slug' => $product->slug,
                    'subtitle' => $product->category?->name,
                    'price' => $product->effective_price,
                    'city' => null,
                    'primary_image_url' => $product->primaryImage?->image_path
                        ? imageUrl($product->primaryImage->image_path)
                        : null,
                    'payload' => [
                        'price' => $product->price,
                        'discount_price' => $product->discount_price,
                        'effective_price' => $product->effective_price,
                        'category' => $product->category?->name,
                    ],
                ];
            })
            ->values();

        $listingRows = ServiceListing::approved()
            ->where(function ($query) use ($queryText): void {
                $query->where('business_name', 'like', "%{$queryText}%")
                    ->orWhere('description', 'like', "%{$queryText}%")
                    ->orWhere('city', 'like', "%{$queryText}%");
            })
            ->with(['images', 'category'])
            ->limit($perPage)
            ->get()
            ->map(function (ServiceListing $listing): array {
                return [
                    'type' => 'listing',
                    'id' => $listing->id,
                    'title' => $listing->business_name,
                    'slug' => $listing->slug,
                    'subtitle' => $listing->category?->name,
                    'price' => null,
                    'city' => $listing->city,
                    'primary_image_url' => $listing->images->first()?->image_path
                        ? imageUrl($listing->images->first()->image_path)
                        : null,
                    'payload' => [
                        'phone' => $listing->phone,
                        'whatsapp' => $listing->whatsapp,
                        'city' => $listing->city,
                        'category' => $listing->category?->name,
                    ],
                ];
            })
            ->values();

        $mixed = collect()
            ->concat($productRows)
            ->concat($listingRows)
            ->sortBy('title', SORT_NATURAL | SORT_FLAG_CASE)
            ->values();

        return $this->success([
            'query' => $queryText,
            'mixed' => $mixed,
            'products' => $productRows,
            'listings' => $listingRows,
            'counts' => [
                'total' => $mixed->count(),
                'products' => $productRows->count(),
                'listings' => $listingRows->count(),
            ],
        ], 'Mixed search results fetched', 200, [
            'pagination' => [
                'current_page' => 1,
                'last_page' => 1,
                'per_page' => $perPage,
                'total' => $mixed->count(),
            ],
        ]);
    }
}
