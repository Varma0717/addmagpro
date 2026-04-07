<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\Product;

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

        return view('home', compact(
            'carouselBanners',
            'midBanners',
            'ecomCategories',
            'serviceCategories',
            'featuredProducts',
            'newProducts'
        ));
    }
}
