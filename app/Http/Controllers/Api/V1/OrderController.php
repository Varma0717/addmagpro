<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use App\Support\ApiResponse;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    use ApiResponse;

    public function index(Request $request)
    {
        $perPage = min((int) $request->integer('per_page', 15), 50);

        $orders = Order::query()
            ->where('user_id', $request->user()->id)
            ->withCount('items')
            ->latest()
            ->paginate($perPage)
            ->withQueryString();

        return $this->success(
            $orders->getCollection()->map(function (Order $order): array {
                return [
                    'id' => $order->id,
                    'order_number' => $order->order_number,
                    'status' => $order->status,
                    'payment_method' => $order->payment_method,
                    'payment_status' => $order->payment_status,
                    'items_count' => $order->items_count,
                    'total' => round((float) $order->total, 2),
                    'created_at' => $order->created_at,
                ];
            })->values(),
            'Orders fetched',
            200,
            [
                'pagination' => [
                    'current_page' => $orders->currentPage(),
                    'last_page' => $orders->lastPage(),
                    'per_page' => $orders->perPage(),
                    'total' => $orders->total(),
                ],
            ]
        );
    }

    public function show(Request $request, Order $order)
    {
        if ($order->user_id !== $request->user()->id) {
            return $this->error('You are not allowed to view this order.', 403);
        }

        $order->load(['coupon', 'items.product.images']);

        return $this->success([
            'id' => $order->id,
            'order_number' => $order->order_number,
            'status' => $order->status,
            'subtotal' => round((float) $order->subtotal, 2),
            'discount_amount' => round((float) $order->discount_amount, 2),
            'wallet_amount_used' => round((float) $order->wallet_amount_used, 2),
            'total' => round((float) $order->total, 2),
            'payment_method' => $order->payment_method,
            'payment_status' => $order->payment_status,
            'shipping_address' => $order->shipping_address,
            'coupon' => $order->coupon ? [
                'id' => $order->coupon->id,
                'code' => $order->coupon->code,
            ] : null,
            'items' => $order->items->map(function (OrderItem $item): array {
                return [
                    'id' => $item->id,
                    'product_id' => $item->product_id,
                    'product_name' => $item->product_name,
                    'quantity' => $item->quantity,
                    'unit_price' => round((float) $item->unit_price, 2),
                    'discount_price' => $item->discount_price !== null ? round((float) $item->discount_price, 2) : null,
                    'effective_price' => round((float) $item->effective_price, 2),
                    'line_subtotal' => round((float) $item->line_subtotal, 2),
                    'product' => [
                        'id' => $item->product?->id,
                        'name' => $item->product?->name,
                        'slug' => $item->product?->slug,
                        'primary_image_url' => $item->product?->images?->first()?->image_path
                            ? imageUrl($item->product->images->first()->image_path)
                            : null,
                    ],
                ];
            })->values(),
            'created_at' => $order->created_at,
        ], 'Order fetched');
    }
}
