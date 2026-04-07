@extends('layouts.account')
@section('page_title', 'My Orders')
@section('title', 'My Orders')

@section('account_content')
<h2 class="text-xl font-bold text-gray-800 mb-4">My Orders</h2>

@if($orders->isEmpty())
<div class="bg-white rounded-xl border py-16 text-center">
    <p class="text-5xl mb-3">📦</p>
    <p class="text-gray-500">You haven't placed any orders yet.</p>
    <a href="{{ route('categories.index') }}" class="mt-4 inline-block px-5 py-2 bg-orange-500 text-white rounded-xl text-sm">Start Shopping</a>
</div>
@else
<div class="space-y-3">
    @foreach($orders as $order)
    <a href="{{ route('account.orders.show', $order) }}"
        class="block bg-white rounded-xl border p-4 hover:shadow-md transition-all">
        <div class="flex justify-between items-start">
            <div>
                <p class="font-semibold text-gray-800">Order #{{ $order->id }}</p>
                <p class="text-sm text-gray-500 mt-1">{{ $order->items->count() }} item(s) &bull; {{ $order->created_at->format('d M Y') }}</p>
            </div>
            <div class="text-right">
                <p class="font-bold text-orange-600">₹{{ number_format($order->total_amount, 2) }}</p>
                <span class="text-xs px-2 py-1 rounded-full mt-1 inline-block
                            {{ match($order->status) {
                                'pending'   => 'bg-yellow-100 text-yellow-700',
                                'confirmed' => 'bg-blue-100 text-blue-700',
                                'shipped'   => 'bg-purple-100 text-purple-700',
                                'delivered' => 'bg-green-100 text-green-700',
                                'cancelled' => 'bg-red-100 text-red-700',
                                default     => 'bg-gray-100 text-gray-600',
                            } }}">
                    {{ ucfirst($order->status) }}
                </span>
            </div>
        </div>
    </a>
    @endforeach
</div>
<div class="mt-4">{{ $orders->links() }}</div>
@endif
@endsection