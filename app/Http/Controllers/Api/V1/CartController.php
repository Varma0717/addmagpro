<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\CartItem;
use App\Models\Coupon;
use App\Models\Product;
use App\Support\ApiResponse;
use Illuminate\Http\Request;

class CartController extends Controller
{
    use ApiResponse;

    public function index(Request $request)
    {
        $items = CartItem::query()
            ->where('user_id', $request->user()->id)
            ->with(['product.primaryImage', 'product.category'])
            ->get();

        $mapped = $items->map(function (CartItem $item): array {
            $product = $item->product;

            return [
                'id' => $item->id,
                'product_id' => $item->product_id,
                'quantity' => $item->quantity,
                'subtotal' => (float) $item->subtotal,
                'product' => [
                    'id' => $product?->id,
                    'name' => $product?->name,
                    'slug' => $product?->slug,
                    'price' => $product?->price,
                    'discount_price' => $product?->discount_price,
                    'effective_price' => $product?->effective_price,
                    'stock' => $product?->stock,
                    'category' => $product?->category?->name,
                    'primary_image_url' => $product?->primaryImage?->image_path
                        ? imageUrl($product->primaryImage->image_path)
                        : null,
                ],
            ];
        })->values();

        $total = (float) $items->sum(fn(CartItem $item) => $item->subtotal);

        return $this->success([
            'items' => $mapped,
            'summary' => [
                'item_count' => $items->count(),
                'quantity_count' => (int) $items->sum('quantity'),
                'subtotal' => $total,
                'total' => $total,
            ],
        ], 'Cart fetched');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'nullable|integer|min:1|max:20',
        ]);

        $product = Product::query()->active()->inStock()->findOrFail((int) $validated['product_id']);
        $quantity = (int) ($validated['quantity'] ?? 1);

        $item = CartItem::firstOrNew([
            'user_id' => $request->user()->id,
            'product_id' => $product->id,
        ]);

        $item->quantity = min(($item->quantity ?? 0) + $quantity, 20);
        $item->save();

        return $this->success([
            'item_id' => $item->id,
            'quantity' => $item->quantity,
        ], 'Item added to cart');
    }

    public function update(Request $request, CartItem $item)
    {
        if ($item->user_id !== $request->user()->id) {
            return $this->error('Forbidden', 403);
        }

        $validated = $request->validate([
            'quantity' => 'required|integer|min:1|max:20',
        ]);

        $item->update(['quantity' => (int) $validated['quantity']]);

        return $this->success([
            'id' => $item->id,
            'quantity' => $item->quantity,
            'subtotal' => (float) $item->fresh()->subtotal,
        ], 'Cart item updated');
    }

    public function destroy(Request $request, CartItem $item)
    {
        if ($item->user_id !== $request->user()->id) {
            return $this->error('Forbidden', 403);
        }

        $item->delete();

        return $this->success(null, 'Cart item removed');
    }

    public function validateCoupon(Request $request)
    {
        $validated = $request->validate([
            'code' => 'required|string|max:50',
        ]);

        $coupon = Coupon::query()->where('code', strtoupper($validated['code']))->first();
        if (!$coupon || !$coupon->isValid()) {
            return $this->error('Invalid or expired coupon', 422, [
                'code' => ['Invalid or expired coupon.'],
            ]);
        }

        $subtotal = (float) CartItem::query()
            ->where('user_id', $request->user()->id)
            ->with('product')
            ->get()
            ->sum(fn(CartItem $item) => $item->product->effective_price * $item->quantity);

        $discount = (float) $coupon->computeDiscount($subtotal);
        if ($discount <= 0) {
            return $this->error('Coupon is not applicable for this cart total', 422, [
                'code' => ["Minimum order amount is {$coupon->min_order_amount}."],
            ]);
        }

        return $this->success([
            'coupon_id' => $coupon->id,
            'code' => $coupon->code,
            'discount' => $discount,
            'subtotal' => $subtotal,
            'final_total' => max(0, $subtotal - $discount),
        ], 'Coupon applied');
    }
}
