<?php

namespace App\Http\Controllers;

use App\Models\CartItem;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Services\RazorpayService;
use App\Services\ReferralService;
use App\Services\WalletService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CartController extends Controller
{
    public function index()
    {
        $items = CartItem::where('user_id', auth()->id())->with('product.primaryImage')->get();
        return view('cart.index', compact('items'));
    }

    public function add(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity'   => 'nullable|integer|min:1|max:20',
        ]);

        $product = Product::active()->inStock()->findOrFail($request->product_id);
        $quantity = $request->quantity ?? 1;

        $item = CartItem::firstOrNew([
            'user_id'    => auth()->id(),
            'product_id' => $product->id,
        ]);
        $item->quantity = min(($item->quantity ?? 0) + $quantity, 20);
        $item->save();

        return response()->json(['success' => true, 'cart_count' => $this->cartCount()]);
    }

    public function update(Request $request, CartItem $item)
    {
        abort_if($item->user_id !== auth()->id(), 403);
        $request->validate(['quantity' => 'required|integer|min:1|max:20']);
        $item->update(['quantity' => $request->quantity]);
        return response()->json(['success' => true]);
    }

    public function remove(CartItem $item)
    {
        abort_if($item->user_id !== auth()->id(), 403);
        $item->delete();
        return response()->json(['success' => true, 'cart_count' => $this->cartCount()]);
    }

    public function validateCoupon(Request $request)
    {
        $request->validate(['code' => 'required|string']);

        $coupon = Coupon::where('code', strtoupper($request->code))->first();

        if (!$coupon || !$coupon->isValid()) {
            return response()->json(['valid' => false, 'message' => 'Invalid or expired coupon.']);
        }

        $subtotal = CartItem::where('user_id', auth()->id())
            ->with('product')
            ->get()
            ->sum(fn($i) => $i->product->effective_price * $i->quantity);

        $discount = $coupon->computeDiscount($subtotal);
        if ($discount <= 0) {
            return response()->json(['valid' => false, 'message' => "Minimum order ₹{$coupon->min_order_amount} required."]);
        }

        return response()->json(['valid' => true, 'discount' => $discount, 'coupon_id' => $coupon->id]);
    }

    private function cartCount(): int
    {
        return CartItem::where('user_id', auth()->id())->sum('quantity');
    }
}
