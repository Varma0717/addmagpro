<?php

namespace App\Http\Controllers;

use App\Models\CartItem;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderItem;
use App\Services\RazorpayService;
use App\Services\ReferralService;
use App\Services\WalletService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CheckoutController extends Controller
{
    public function __construct(
        private readonly RazorpayService $razorpay,
        private readonly WalletService $wallet,
        private readonly ReferralService $referral,
    ) {}

    public function index()
    {
        $items = CartItem::where('user_id', auth()->id())->with('product.primaryImage')->get();
        if ($items->isEmpty()) return redirect()->route('cart.index')->with('error', 'Your cart is empty.');

        $user    = auth()->user();
        $subtotal = $items->sum(fn($i) => $i->product->effective_price * $i->quantity);

        return view('checkout.index', compact('items', 'user', 'subtotal'));
    }

    public function createRazorpayOrder(Request $request)
    {
        $request->validate(['amount' => 'required|integer|min:100']);

        $order = $this->razorpay->createOrder($request->amount, 'INR', ['user_id' => auth()->id()]);

        return response()->json([
            'order_id'  => $order['id'],
            'amount'    => $order['amount'],
            'currency'  => $order['currency'],
            'key_id'    => $this->razorpay->getKeyId(),
        ]);
    }

    public function placeOrder(Request $request)
    {
        $data = $request->validate([
            'name'               => 'required|string|max:255',
            'phone'              => 'required|string|max:20',
            'address'            => 'required|string|max:500',
            'city'               => 'required|string|max:100',
            'state'              => 'required|string|max:100',
            'pincode'            => 'required|string|max:10',
            'payment_method'     => 'required|in:razorpay,wallet,cod',
            'coupon_id'          => 'nullable|exists:coupons,id',
            'use_wallet'         => 'boolean',
            'razorpay_order_id'  => 'nullable|string',
            'razorpay_payment_id' => 'nullable|string',
            'razorpay_signature' => 'nullable|string',
        ]);

        $user  = auth()->user();
        $items = CartItem::where('user_id', $user->id)->with('product')->get();

        if ($items->isEmpty()) return back()->with('error', 'Your cart is empty.');

        // Verify Razorpay signature
        if ($data['payment_method'] === 'razorpay') {
            $valid = $this->razorpay->verifyPaymentSignature(
                $data['razorpay_order_id'],
                $data['razorpay_payment_id'],
                $data['razorpay_signature']
            );
            if (!$valid) return back()->with('error', 'Payment verification failed.');
        }

        $subtotal       = $items->sum(fn($i) => $i->product->effective_price * $i->quantity);
        $discountAmount = 0;
        $coupon         = null;

        if ($request->filled('coupon_id')) {
            $coupon = Coupon::find($request->coupon_id);
            if ($coupon && $coupon->isValid()) {
                $discountAmount = $coupon->computeDiscount($subtotal);
            }
        }

        $walletUsed = 0;
        if ($request->boolean('use_wallet') && $user->wallet_balance > 0) {
            $walletUsed = min($user->wallet_balance, $subtotal - $discountAmount);
        }

        $total = max(0, $subtotal - $discountAmount - $walletUsed);

        $order = DB::transaction(function () use ($data, $user, $items, $subtotal, $discountAmount, $coupon, $walletUsed, $total) {
            $order = Order::create([
                'user_id'            => $user->id,
                'order_number'       => 'ORD' . strtoupper(Str::random(10)),
                'status'             => 'pending',
                'subtotal'           => $subtotal,
                'discount_amount'    => $discountAmount,
                'coupon_id'          => $coupon?->id,
                'wallet_amount_used' => $walletUsed,
                'total'              => $total,
                'shipping_address'   => [
                    'name'    => $data['name'],
                    'phone'   => $data['phone'],
                    'address' => $data['address'],
                    'city'    => $data['city'],
                    'state'   => $data['state'],
                    'pincode' => $data['pincode'],
                ],
                'payment_method'      => $data['payment_method'],
                'payment_status'      => $data['payment_method'] === 'razorpay' ? 'paid' : 'pending',
                'razorpay_order_id'   => $data['razorpay_order_id'] ?? null,
                'razorpay_payment_id' => $data['razorpay_payment_id'] ?? null,
            ]);

            foreach ($items as $item) {
                OrderItem::create([
                    'order_id'       => $order->id,
                    'product_id'     => $item->product_id,
                    'product_name'   => $item->product->name,
                    'quantity'       => $item->quantity,
                    'unit_price'     => $item->product->price,
                    'discount_price' => $item->product->discount_price,
                ]);
            }

            // Debit wallet
            if ($walletUsed > 0) {
                $this->wallet->debit($user, $walletUsed, 'Order payment', 'orders', $order->id);
            }

            // Mark coupon used
            if ($coupon) {
                $coupon->increment('used_count');
                $user->coupons()->syncWithoutDetaching([$coupon->id => ['used_at' => now()]]);
            }

            // Clear cart
            CartItem::where('user_id', $user->id)->delete();

            return $order;
        });

        return redirect()->route('checkout.confirmation', $order)->with('success', 'Order placed successfully!');
    }

    public function confirmation(Order $order)
    {
        abort_if($order->user_id !== auth()->id(), 403);
        $order->load('items');
        return view('checkout.confirmation', compact('order'));
    }
}
