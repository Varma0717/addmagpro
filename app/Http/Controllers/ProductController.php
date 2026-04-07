<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Review;
use App\Models\Wishlist;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function show(Product $product)
    {
        $product->load('category', 'images', 'reviews.user');
        $wishlisted = auth()->check()
            ? Wishlist::where('user_id', auth()->id())->where('product_id', $product->id)->exists()
            : false;

        $relatedProducts = Product::active()->inStock()
            ->where('category_id', $product->category_id)
            ->where('id', '!=', $product->id)
            ->with('images')
            ->take(4)->get();

        return view('products.show', compact('product', 'wishlisted', 'relatedProducts'));
    }

    public function review(Request $request, Product $product)
    {
        $request->validate([
            'rating'  => 'required|integer|between:1,5',
            'comment' => 'nullable|string|max:1000',
        ]);

        $product->reviews()->updateOrCreate(
            ['user_id' => auth()->id()],
            ['rating' => $request->rating, 'comment' => $request->comment, 'is_approved' => false]
        );

        return back()->with('success', 'Review submitted — pending approval.');
    }
}
