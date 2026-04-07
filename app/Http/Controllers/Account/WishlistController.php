<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\Wishlist;

class WishlistController extends Controller
{
    public function index()
    {
        $items = Wishlist::where('user_id', auth()->id())
            ->with('product.images', 'product.category')
            ->latest()
            ->paginate(20);

        return view('account.wishlist', compact('items'));
    }

    public function toggle(\Illuminate\Http\Request $request)
    {
        $request->validate(['product_id' => 'required|exists:products,id']);

        $item = Wishlist::firstOrNew([
            'user_id'    => auth()->id(),
            'product_id' => $request->product_id,
        ]);

        if ($item->exists) {
            $item->delete();
            $added = false;
        } else {
            $item->save();
            $added = true;
        }

        return response()->json(['added' => $added]);
    }
}
