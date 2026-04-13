<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\ServiceListing;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $ecomCategories    = Category::active()->ecommerce()->topLevel()->orderBy('sort_order')->get();
        $serviceCategories = Category::active()->service()->topLevel()->orderBy('sort_order')->get();

        return view('categories.index', compact('ecomCategories', 'serviceCategories'));
    }

    /**
     * Stores directory — image-card grid of all store subcategories.
     */
    public function stores(Request $request)
    {
        $parent = Category::where('slug', 'stores')->first();

        $query = Category::active()->orderBy('sort_order');
        if ($parent) {
            $query->where('parent_id', $parent->id);
        }

        $search = $request->get('q');
        if ($search) {
            $query->where('name', 'like', "%{$search}%");
        }

        $stores = $query->get();

        return view('categories.stores', compact('stores', 'search'));
    }

    /**
     * Services directory — image-card grid of all service subcategories.
     */
    public function servicesDirectory(Request $request)
    {
        $parent = Category::where('slug', 'services-directory')->first();

        $query = Category::active()->orderBy('sort_order');
        if ($parent) {
            $query->where('parent_id', $parent->id);
        }

        $search = $request->get('q');
        if ($search) {
            $query->where('name', 'like', "%{$search}%");
        }

        $services = $query->get();

        return view('categories.services', compact('services', 'search'));
    }

    public function show(Request $request, Category $category)
    {
        if ($category->type === 'ecommerce') {
            $query = Product::active()->inStock()
                ->where('category_id', $category->id)
                ->with('images', 'brand');

            if ($request->filled('min_price')) $query->where('price', '>=', $request->min_price);
            if ($request->filled('max_price')) $query->where('price', '<=', $request->max_price);
            if ($request->filled('brand_id')) $query->where('brand_id', $request->brand_id);
            if ($request->filled('min_rating')) {
                $query->whereHas('reviews', function ($q) use ($request) {
                    // nothing
                }, '>=', 1)->withAvg('reviews', 'rating')
                    ->having('reviews_avg_rating', '>=', $request->min_rating);
            }

            $sort = $request->get('sort', 'latest');
            match ($sort) {
                'price_asc'  => $query->orderBy('price'),
                'price_desc' => $query->orderByDesc('price'),
                'rating'     => $query->withAvg('reviews', 'rating')->orderByDesc('reviews_avg_rating'),
                default      => $query->latest(),
            };

            $items = $query->paginate(20)->withQueryString();

            // Get brands for this category to populate filter
            $brands = Brand::whereHas('products', function ($q) use ($category) {
                $q->where('category_id', $category->id)->where('is_active', true);
            })->orderBy('brand_name')->get();

            return view('categories.show', compact('category', 'items', 'brands'));
        }

        // Service category
        $items = ServiceListing::approved()
            ->where('category_id', $category->id)
            ->with('images')
            ->latest()
            ->paginate(20)
            ->withQueryString();

        $brands = collect();

        return view('categories.show', compact('category', 'items', 'brands'));
    }
}
