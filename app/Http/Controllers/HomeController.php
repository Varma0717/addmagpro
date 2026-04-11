<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\Product;
use App\Models\ServiceListing;
use App\Models\User;

class HomeController extends Controller
{
    public function index()
    {
        $carouselBanners = Banner::active()->forPlacement('homepage_carousel')->orderBy('sort_order')->get();
        $midBanners      = Banner::active()->forPlacement('homepage_mid')->orderBy('sort_order')->get();
        $ecomCategories  = Category::active()->ecommerce()->topLevel()->orderBy('sort_order')->get();
        $serviceCategories = Category::active()->service()->topLevel()->orderBy('sort_order')->get();
        $featuredProducts  = Product::active()->featured()->inStock()->with('images', 'category')->take(8)->get();
        $newProducts       = Product::active()->inStock()->with('images', 'category')->latest()->take(8)->get();

        // Groceries highlight section
        $groceriesCategory = Category::active()->ecommerce()->where('slug', 'groceries')->first();
        $groceryProducts = $groceriesCategory
            ? Product::active()->inStock()->where('category_id', $groceriesCategory->id)->with('images', 'category')->take(4)->get()
            : collect();

        // Popular vendors (featured service listings)
        $popularVendors = ServiceListing::approved()->featured()
            ->with('images', 'category')
            ->take(8)->get();

        // Stats
        $totalUsers = User::count();

        return view('home', compact(
            'carouselBanners',
            'midBanners',
            'ecomCategories',
            'serviceCategories',
            'featuredProducts',
            'newProducts',
            'groceryProducts',
            'groceriesCategory',
            'popularVendors',
            'totalUsers'
        ));
    }
}
