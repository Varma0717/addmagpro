@extends('layouts.account')
@section('page_title', 'My Orders')
@section('title', 'My Orders')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-5 flex items-center gap-2">
    <svg class="w-6 h-6 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
    </svg>
    My Orders
</h2>

@if($orders->isEmpty())
<div class="card text-center py-16">
    <svg class="w-14 h-14 text-surface-300 mx-auto mb-3" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5m8.25 3v6.75m0 0-3-3m3 3 3-3M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
    </svg>
    <p class="text-surface-500">You haven't placed any orders yet.</p>
    <a href="{{ route('categories.index') }}" class="btn-primary mt-4 inline-flex">Start Shopping</a>
</div>
@else
<div class="space-y-3">
    @foreach($orders as $order)
    <a href="{{ route('account.orders.show', $order) }}"
        class="card-hover block p-5">
        <div class="flex justify-between items-start">
            <div>
                <p class="font-semibold text-surface-800">Order #{{ $order->id }}</p>
                <p class="text-sm text-surface-500 mt-1">{{ $order->items->count() }} item(s) &bull; {{ $order->created_at->format('d M Y') }}</p>
            </div>
            <div class="text-right">
                <p class="font-bold text-brand-600">₹{{ number_format($order->total_amount, 2) }}</p>
                <span class="text-xs px-2.5 py-1 rounded-full mt-1 inline-block font-medium
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
        </div>
    </a>
    @endforeach
</div>
<div class="mt-6">{{ $orders->links() }}</div>
@endif
@endsection