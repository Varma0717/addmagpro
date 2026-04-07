<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ServiceListing;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function index(Request $request)
    {
        $q = $request->get('q', '');

        $products = collect();
        $listings  = collect();

        if (mb_strlen($q) >= 2) {
            $products = Product::active()->inStock()
                ->where(
                    fn($query) => $query
                        ->where('name', 'like', "%{$q}%")
                        ->orWhere('short_description', 'like', "%{$q}%")
                )
                ->with('primaryImage', 'category')
                ->take(20)
                ->get();

            $listings = ServiceListing::approved()
                ->where(
                    fn($query) => $query
                        ->where('business_name', 'like', "%{$q}%")
                        ->orWhere('description', 'like', "%{$q}%")
                        ->orWhere('city', 'like', "%{$q}%")
                )
                ->with('category', 'images')
                ->take(20)
                ->get();
        }

        return view('search.index', compact('q', 'products', 'listings'));
    }
}
