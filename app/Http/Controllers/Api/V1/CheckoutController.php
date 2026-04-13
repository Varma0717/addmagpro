<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\CartItem;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderItem;
use App\Services\RazorpayService;
use App\Services\WalletService;
use App\Support\ApiResponse;
use App\Services\PushNotificationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CheckoutController extends Controller
{
    use ApiResponse;

    public function __construct(
        private readonly RazorpayService $razorpay,
        private readonly WalletService $wallet,
        private readonly PushNotificationService $pushNotifications,
    ) {}

    public function createRazorpayOrder(Request $request)
    {
        $validated = $request->validate([
            'amount' => 'required|integer|min:100',
        ]);

        $order = $this->razorpay->createOrder((int) $validated['amount'], 'INR', [
            'user_id' => $request->user()->id,
        ]);

        return $this->success([
            'order_id' => $order['id'],
            'amount' => $order['amount'],
            'currency' => $order['currency'],
            'key_id' => $this->razorpay->getKeyId(),
        ], 'Razorpay order created');
    }

    public function placeOrder(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'address' => 'required|string|max:500',
            'city' => 'required|string|max:100',
            'state' => 'required|string|max:100',
            'pincode' => 'required|string|max:10',
            'payment_method' => 'required|in:razorpay,wallet,cod',
            'coupon_id' => 'nullable|exists:coupons,id',
            'use_wallet' => 'boolean',
            'razorpay_order_id' => 'nullable|string',
            'razorpay_payment_id' => 'nullable|string',
            'razorpay_signature' => 'nullable|string',
        ]);

        $user = $request->user();
        $items = CartItem::query()
            ->where('user_id', $user->id)
            ->with('product')
            ->get();

        if ($items->isEmpty()) {
            return $this->error('Your cart is empty', 422, [
                'cart' => ['Your cart is empty.'],
            ]);
        }

        if ($data['payment_method'] === 'razorpay') {
            $required = [
                'razorpay_order_id',
                'razorpay_payment_id',
                'razorpay_signature',
            ];
            foreach ($required as $field) {
                if (empty($data[$field])) {
                    return $this->error('Razorpay verification fields are required', 422, [
                        $field => ['This field is required for Razorpay checkout.'],
                    ]);
                }
            }

            $valid = $this->razorpay->verifyPaymentSignature(
                $data['razorpay_order_id'],
                $data['razorpay_payment_id'],
                $data['razorpay_signature'],
            );

            if (!$valid) {
                return $this->error('Payment verification failed', 422, [
                    'payment' => ['Razorpay signature verification failed.'],
                ]);
            }
        }

        $subtotal = (float) $items->sum(fn(CartItem $item) => $item->product->effective_price * $item->quantity);
        $discountAmount = 0.0;
        $coupon = null;

        if (!empty($data['coupon_id'])) {
            $coupon = Coupon::query()->find((int) $data['coupon_id']);
            if ($coupon && $coupon->isValid()) {
                $discountAmount = (float) $coupon->computeDiscount($subtotal);
            }
        }

        $walletUsed = 0.0;
        if (!empty($data['use_wallet']) && $user->wallet_balance > 0) {
            $walletUsed = min((float) $user->wallet_balance, max(0, $subtotal - $discountAmount));
        }

        $total = max(0, $subtotal - $discountAmount - $walletUsed);

        try {
            $order = DB::transaction(function () use ($data, $user, $items, $subtotal, $discountAmount, $coupon, $walletUsed, $total) {
                $order = Order::create([
                    'user_id' => $user->id,
                    'order_number' => 'ORD' . strtoupper(Str::random(10)),
                    'status' => 'pending',
                    'subtotal' => $subtotal,
                    'discount_amount' => $discountAmount,
                    'coupon_id' => $coupon?->id,
                    'wallet_amount_used' => $walletUsed,
                    'total' => $total,
                    'shipping_address' => [
                        'name' => $data['name'],
                        'phone' => $data['phone'],
                        'address' => $data['address'],
                        'city' => $data['city'],
                        'state' => $data['state'],
                        'pincode' => $data['pincode'],
                    ],
                    'payment_method' => $data['payment_method'],
                    'payment_status' => $data['payment_method'] === 'razorpay' ? 'paid' : 'pending',
                    'razorpay_order_id' => $data['razorpay_order_id'] ?? null,
                    'razorpay_payment_id' => $data['razorpay_payment_id'] ?? null,
                ]);

                foreach ($items as $item) {
                    OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $item->product_id,
                        'product_name' => $item->product->name,
                        'quantity' => $item->quantity,
                        'unit_price' => $item->product->price,
                        'discount_price' => $item->product->discount_price,
                    ]);
                }

                if ($walletUsed > 0) {
                    $this->wallet->debit($user, $walletUsed, 'Order payment', 'orders', $order->id);
                }

                if ($coupon) {
                    $coupon->increment('used_count');
                    $user->coupons()->syncWithoutDetaching([$coupon->id => ['used_at' => now()]]);
                }

                CartItem::query()->where('user_id', $user->id)->delete();

                return $order;
            });
            $this->pushNotifications->notifyUser(
                $user,
                'Order placed successfully',
                "Your order {$order->order_number} has been placed.",
                'order',
                ['event' => 'order_created', 'order_id' => (string) $order->id],
            );
        } catch (\RuntimeException $error) {
            return $this->error('Wallet payment failed', 422, [
                'wallet' => [$error->getMessage()],
            ]);
        }

        return $this->success([
            'order' => [
                'id' => $order->id,
                'order_number' => $order->order_number,
                'status' => $order->status,
                'subtotal' => (float) $order->subtotal,
                'discount_amount' => (float) $order->discount_amount,
                'wallet_amount_used' => (float) $order->wallet_amount_used,
                'total' => (float) $order->total,
                'payment_method' => $order->payment_method,
                'payment_status' => $order->payment_status,
            ],
        ], 'Order placed successfully');
    }
}
