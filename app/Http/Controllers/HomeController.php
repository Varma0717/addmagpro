<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\District;
use App\Models\Product;
use App\Models\ServiceListing;
use App\Models\State;
use App\Models\User;
use Illuminate\Http\Request;

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

        // Recommended Offers — products with active discounts
        $recommendedOffers = Product::active()->inStock()
            ->whereNotNull('discount_price')
            ->where('discount_price', '>', 0)
            ->with('images', 'category')
            ->latest()
            ->take(8)
            ->get();

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
            'recommendedOffers',
            'groceryProducts',
            'groceriesCategory',
            'popularVendors',
            'totalUsers'
        ));
    }

    public function setLocation(Request $request)
    {
        $stateId = $request->input('state_id');
        $districtId = $request->input('district_id');

        if ($stateId) {
            $state = State::find($stateId);
            $district = $districtId ? District::find($districtId) : null;
            $label = $district ? $district->district_name : ($state ? $state->state_name : 'All India');

            session([
                'location_state_id' => $stateId,
                'location_district_id' => $districtId ?: null,
                'location_label' => $label,
            ]);
        } else {
            session()->forget(['location_state_id', 'location_district_id', 'location_label']);
        }

        return response()->json(['ok' => true]);
    }
}
