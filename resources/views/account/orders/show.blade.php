@extends('layouts.account')
@section('page_title', 'Order #' . $order->id)
@section('title', 'Order #' . $order->id)

@section('account_content')
{{-- Breadcrumb --}}
<div class="flex items-center gap-2 mb-6 text-sm">
    <a href="{{ route('account.orders.index') }}" class="text-brand-600 hover:text-brand-700 font-medium transition">My Orders</a>
    <svg class="w-4 h-4 text-surface-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
    </svg>
    <span class="text-surface-500">Order #{{ $order->id }}</span>
</div>

<div class="space-y-5">
    {{-- Status + Summary --}}
    <div class="card p-6">
        <div class="flex items-center justify-between mb-5">
            <h2 class="font-bold font-display text-surface-800 text-lg">Order #{{ $order->id }}</h2>
            <span class="px-3 py-1.5 rounded-full text-sm font-semibold
                {{ match($order->status) {
                    'pending'   => 'bg-amber-50 text-amber-700 ring-1 ring-amber-200',
                    'confirmed' => 'bg-blue-50 text-blue-700 ring-1 ring-blue-200',
                    'shipped'   => 'bg-violet-50 text-violet-700 ring-1 ring-violet-200',
                    'delivered' => 'bg-emerald-50 text-emerald-700 ring-1 ring-emerald-200',
                    'cancelled' => 'bg-red-50 text-red-700 ring-1 ring-red-200',
                    default     => 'bg-surface-100 text-surface-600',
                } }}">
                {{ ucfirst($order->status) }}
            </span>
        </div>
        <div class="grid grid-cols-3 gap-4 text-sm">
            <div>
                <p class="text-surface-400 text-xs uppercase tracking-wide mb-1">Date</p>
                <p class="font-semibold text-surface-700">{{ $order->created_at->format('d M Y') }}</p>
            </div>
            <div>
                <p class="text-surface-400 text-xs uppercase tracking-wide mb-1">Total</p>
                <p class="font-bold text-brand-600 text-lg">₹{{ number_format($order->total_amount, 2) }}</p>
            </div>
            <div>
                <p class="text-surface-400 text-xs uppercase tracking-wide mb-1">Payment</p>
                <p class="font-semibold text-surface-700 capitalize">{{ $order->payment_method }}</p>
            </div>
        </div>
    </div>

    {{-- Items --}}
    <div class="card overflow-hidden">
        <div class="px-6 py-4 border-b border-surface-100 font-semibold text-surface-700 flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5m8.25 3v6.75m0 0-3-3m3 3 3-3M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
            </svg>
            Items
        </div>
        <div class="divide-y divide-surface-100">
            @foreach($order->items as $item)
            <div class="flex gap-4 p-5">
                @php $img = $item->product?->images->first(); @endphp
                @if($img)
                <img src="{{ imageUrl($img->image_path) }}" class="w-16 h-16 object-cover rounded-xl flex-shrink-0" alt="">
                @else
                <div class="w-16 h-16 bg-surface-100 rounded-xl flex items-center justify-center flex-shrink-0">
                    <svg class="w-7 h-7 text-surface-300" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5m8.25 3v6.75m0 0-3-3m3 3 3-3M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
                    </svg>
                </div>
                @endif
                <div class="flex-1">
                    <p class="font-semibold text-surface-800">{{ $item->product->name ?? 'Product' }}</p>
                    <p class="text-sm text-surface-500 mt-0.5">Qty: {{ $item->quantity }} × ₹{{ number_format($item->unit_price, 2) }}</p>
                </div>
                <p class="font-bold text-surface-800">₹{{ number_format($item->quantity * $item->unit_price, 2) }}</p>
            </div>
            @endforeach
        </div>
    </div>

    {{-- Shipping --}}
    <div class="card p-6 text-sm">
        <h3 class="font-semibold text-surface-700 mb-3 flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
            </svg>
            Shipping Address
        </h3>
        @php $addr = $order->shipping_address; @endphp
        <p class="text-surface-600 leading-relaxed">
            {{ $addr['name'] ?? '' }}, {{ $addr['phone'] ?? '' }}<br>
            {{ $addr['address'] ?? '' }}<br>
            {{ $addr['city'] ?? '' }}, {{ $addr['state'] ?? '' }} – {{ $addr['pincode'] ?? '' }}
        </p>
    </div>
</div>
@endsection