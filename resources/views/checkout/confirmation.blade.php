@extends('layouts.app')
@section('title', 'Order Confirmed!')

@section('content')
<div class="max-w-lg mx-auto text-center py-16">
    <div class="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center text-4xl mx-auto mb-6">✓</div>
    <h1 class="text-2xl font-bold text-gray-900 mb-2">Order Placed Successfully!</h1>
    <p class="text-gray-500 mb-6">Thank you for your order. We'll notify you once it ships.</p>

    <div class="bg-white rounded-2xl border p-6 text-left mb-6 text-sm">
        <div class="flex justify-between mb-2">
            <span class="text-gray-500">Order ID</span>
            <span class="font-mono font-bold">#{{ $order->id }}</span>
        </div>
        <div class="flex justify-between mb-2">
            <span class="text-gray-500">Total Paid</span>
            <span class="font-bold text-orange-600">₹{{ number_format($order->total_amount, 2) }}</span>
        </div>
        <div class="flex justify-between mb-2">
            <span class="text-gray-500">Payment</span>
            <span class="capitalize">{{ $order->payment_method }} / {{ $order->payment_status }}</span>
        </div>
        <div class="flex justify-between">
            <span class="text-gray-500">Status</span>
            <span class="px-2 py-1 bg-yellow-100 text-yellow-700 rounded-full text-xs capitalize">{{ $order->status }}</span>
        </div>
    </div>

    <div class="flex gap-3 justify-center">
        <a href="{{ route('account.orders.show', $order) }}" class="px-5 py-2.5 bg-orange-500 text-white rounded-xl hover:bg-orange-600 font-medium">View Order</a>
        <a href="{{ route('home') }}" class="px-5 py-2.5 border border-gray-300 rounded-xl hover:bg-gray-50 font-medium text-gray-700">Continue Shopping</a>
    </div>
</div>
@endsection