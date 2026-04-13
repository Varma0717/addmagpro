<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Wishlist;
use Illuminate\Http\Request;

class WishlistController extends Controller
{
    public function index(Request $request)
    {
        $items = Wishlist::where('user_id', $request->user()->id)
            ->with(['product' => function ($q) {
                $q->with('images');
            }])
            ->latest()
            ->get()
            ->map(function ($item) {
                $product = $item->product;
                if (!$product) return null;

                $image = $product->images->first();

                return [
                    'id'                => $item->id,
                    'product_id'        => $product->id,
                    'name'              => $product->name,
                    'slug'              => $product->slug,
                    'effective_price'   => (float) $product->effective_price,
                    'primary_image_url' => $image ? asset('storage/' . $image->image_path) : null,
                    'added_at'          => $item->created_at->toIso8601String(),
                ];
            })
            ->filter()
            ->values();

        return response()->json(['data' => $items]);
    }

    public function toggle(Request $request)
    {
        $request->validate(['product_id' => 'required|integer|exists:products,id']);

        $userId    = $request->user()->id;
        $productId = $request->input('product_id');

        $item = Wishlist::where('user_id', $userId)->where('product_id', $productId)->first();

        if ($item) {
            $item->delete();
            return response()->json(['added' => false, 'message' => 'Removed from wishlist']);
        }

        Wishlist::create(['user_id' => $userId, 'product_id' => $productId]);

        return response()->json(['added' => true, 'message' => 'Added to wishlist']);
    }

    public function check(Request $request)
    {
        $request->validate(['product_id' => 'required|integer']);

        $exists = Wishlist::where('user_id', $request->user()->id)
            ->where('product_id', $request->input('product_id'))
            ->exists();

        return response()->json(['in_wishlist' => $exists]);
    }
}
