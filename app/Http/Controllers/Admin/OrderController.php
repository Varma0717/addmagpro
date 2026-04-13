<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Services\PushNotificationService;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function __construct(private readonly PushNotificationService $pushNotifications) {}
    public function index(Request $request)
    {
        $orders = Order::with('user')
            ->when($request->status, fn($q) => $q->where('status', $request->status))
            ->when($request->search, fn($q) => $q->where('order_number', 'like', "%{$request->search}%"))
            ->latest()
            ->paginate(20);

        return view('admin.orders.index', compact('orders'));
    }

    public function show(Order $order)
    {
        $order->load('user', 'items.product', 'coupon');
        return view('admin.orders.show', compact('order'));
    }

    public function updateStatus(Request $request, Order $order)
    {
        $request->validate([
            'status' => 'required|in:pending,confirmed,processing,shipped,delivered,cancelled',
        ]);

        $order->update(['status' => $request->status]);

        $this->pushNotifications->notifyUser(
            $order->user,
            'Order status updated',
            "Your order {$order->order_number} is now {$request->status}.",
            'order',
            ['event' => 'order_status', 'order_id' => (string) $order->id, 'status' => $request->status],
        );

        // Trigger purchase reward on delivery
        if ($request->status === 'delivered' && $order->payment_status === 'paid') {
            app(\App\Services\ReferralService::class)->handleFirstPurchase($order->user);
        }

        return back()->with('success', 'Order status updated.');
    }
}
