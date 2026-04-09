@extends('layouts.admin')
@section('title', 'Order #' . $order->id)

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    {{-- Order Items --}}
    <div class="lg:col-span-2 space-y-4">
        <div class="card overflow-hidden">
            <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
                <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                </svg>
                <span class="font-semibold text-surface-700">Order #{{ $order->id }} Items</span>
            </div>
            <table class="w-full text-sm">
                <thead>
                    <tr>
                        <th class="table-header">Product</th>
                        <th class="table-header">Qty</th>
                        <th class="table-header">Price</th>
                        <th class="table-header">Subtotal</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-100">
                    @foreach($order->items as $item)
                    <tr class="hover:bg-surface-50 transition-colors">
                        <td class="table-cell font-medium">{{ $item->product->name ?? 'Deleted Product' }}</td>
                        <td class="table-cell">{{ $item->quantity }}</td>
                        <td class="table-cell">₹{{ number_format($item->unit_price, 2) }}</td>
                        <td class="table-cell font-semibold">₹{{ number_format($item->quantity * $item->unit_price, 2) }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    {{-- Summary + Status --}}
    <div class="space-y-4">
        <div class="card p-5 text-sm space-y-3">
            <h3 class="font-display font-semibold text-surface-700">Order Summary</h3>
            <div class="flex justify-between"><span class="text-surface-500">Subtotal</span><span>₹{{ number_format($order->subtotal, 2) }}</span></div>
            @if($order->discount_amount > 0)
            <div class="flex justify-between text-emerald-600"><span>Discount</span><span>−₹{{ number_format($order->discount_amount, 2) }}</span></div>
            @endif
            @if($order->wallet_used > 0)
            <div class="flex justify-between text-blue-600"><span>Wallet Used</span><span>−₹{{ number_format($order->wallet_used, 2) }}</span></div>
            @endif
            <div class="flex justify-between font-bold text-base border-t border-surface-100 pt-2"><span>Total</span><span>₹{{ number_format($order->total_amount, 2) }}</span></div>
            <div class="flex justify-between items-center"><span class="text-surface-500">Payment</span>
                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $order->payment_status === 'paid' ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-amber-50 text-amber-700 ring-amber-200' }}">
                    {{ ucfirst($order->payment_method) }} / {{ ucfirst($order->payment_status) }}
                </span>
            </div>
        </div>

        {{-- Shipping Address --}}
        <div class="card p-5 text-sm">
            <div class="flex items-center gap-2 mb-2">
                <svg class="w-4 h-4 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
                </svg>
                <h3 class="font-display font-semibold text-surface-700">Shipping Address</h3>
            </div>
            @php $addr = $order->shipping_address; @endphp
            <p class="text-surface-600 leading-relaxed">
                {{ $addr['name'] ?? '' }}<br>
                {{ $addr['address'] ?? '' }}<br>
                {{ $addr['city'] ?? '' }}, {{ $addr['state'] ?? '' }} {{ $addr['pincode'] ?? '' }}<br>
                {{ $addr['phone'] ?? '' }}
            </p>
        </div>

        {{-- Update Status --}}
        <div class="card p-5">
            <h3 class="font-display font-semibold text-surface-700 mb-3 text-sm">Update Status</h3>
            <form method="POST" action="{{ route('admin.orders.status', $order) }}" class="flex gap-2">
                @csrf
                <select name="status" class="input flex-1">
                    @foreach(['pending','confirmed','shipped','delivered','cancelled'] as $s)
                    <option value="{{ $s }}" {{ $order->status === $s ? 'selected' : '' }}>{{ ucfirst($s) }}</option>
                    @endforeach
                </select>
                <button type="submit" class="btn-primary btn-sm">Update</button>
            </form>
        </div>
    </div>
</div>
@endsection