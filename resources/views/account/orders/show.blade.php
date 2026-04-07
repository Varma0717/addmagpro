@extends('layouts.account')
@section('page_title', 'Order #' . $order->id)
@section('title', 'Order #' . $order->id)

@section('account_content')
<div class="flex items-center gap-2 mb-6">
    <a href="{{ route('account.orders.index') }}" class="text-sm text-orange-500 hover:underline">← My Orders</a>
</div>

<div class="space-y-4">
    <!-- Status + Summary -->
    <div class="bg-white rounded-xl border p-5">
        <div class="flex items-center justify-between mb-4">
            <h2 class="font-bold text-gray-800">Order #{{ $order->id }}</h2>
            <span class="px-3 py-1 rounded-full text-sm font-medium
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
        <div class="grid grid-cols-3 gap-4 text-sm">
            <div>
                <p class="text-gray-400">Date</p>
                <p class="font-medium">{{ $order->created_at->format('d M Y') }}</p>
            </div>
            <div>
                <p class="text-gray-400">Total</p>
                <p class="font-bold text-orange-600">₹{{ number_format($order->total_amount, 2) }}</p>
            </div>
            <div>
                <p class="text-gray-400">Payment</p>
                <p class="font-medium capitalize">{{ $order->payment_method }}</p>
            </div>
        </div>
    </div>

    <!-- Items -->
    <div class="bg-white rounded-xl border overflow-hidden">
        <div class="px-5 py-4 border-b font-semibold text-gray-700">Items</div>
        <div class="divide-y">
            @foreach($order->items as $item)
            <div class="flex gap-4 p-4">
                @php $img = $item->product?->images->first(); @endphp
                @if($img)
                <img src="{{ Storage::url($img->image_path) }}" class="w-16 h-16 object-cover rounded-lg flex-shrink-0">
                @else
                <div class="w-16 h-16 bg-gray-100 rounded-lg flex items-center justify-center text-2xl flex-shrink-0">📦</div>
                @endif
                <div class="flex-1">
                    <p class="font-medium text-gray-800">{{ $item->product->name ?? 'Product' }}</p>
                    <p class="text-sm text-gray-500">Qty: {{ $item->quantity }} × ₹{{ number_format($item->unit_price, 2) }}</p>
                </div>
                <p class="font-bold text-gray-800">₹{{ number_format($item->quantity * $item->unit_price, 2) }}</p>
            </div>
            @endforeach
        </div>
    </div>

    <!-- Shipping -->
    <div class="bg-white rounded-xl border p-5 text-sm">
        <h3 class="font-semibold text-gray-700 mb-2">Shipping Address</h3>
        @php $addr = $order->shipping_address; @endphp
        <p class="text-gray-600 leading-relaxed">
            {{ $addr['name'] ?? '' }}, {{ $addr['phone'] ?? '' }}<br>
            {{ $addr['address'] ?? '' }}<br>
            {{ $addr['city'] ?? '' }}, {{ $addr['state'] ?? '' }} – {{ $addr['pincode'] ?? '' }}
        </p>
    </div>
</div>
@endsection