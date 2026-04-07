@extends('layouts.admin')
@section('title', 'Order #' . $order->id)

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    <!-- Order items -->
    <div class="lg:col-span-2 space-y-4">
        <div class="bg-white rounded-xl shadow-sm border overflow-hidden">
            <div class="px-5 py-4 border-b font-semibold text-gray-700">Order #{{ $order->id }} Items</div>
            <table class="w-full text-sm">
                <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                    <tr>
                        <th class="px-4 py-3 text-left">Product</th>
                        <th class="px-4 py-3 text-left">Qty</th>
                        <th class="px-4 py-3 text-left">Price</th>
                        <th class="px-4 py-3 text-left">Subtotal</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @foreach($order->items as $item)
                    <tr>
                        <td class="px-4 py-3">{{ $item->product->name ?? 'Deleted Product' }}</td>
                        <td class="px-4 py-3">{{ $item->quantity }}</td>
                        <td class="px-4 py-3">₹{{ number_format($item->unit_price, 2) }}</td>
                        <td class="px-4 py-3 font-medium">₹{{ number_format($item->quantity * $item->unit_price, 2) }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <!-- Summary + Status -->
    <div class="space-y-4">
        <div class="bg-white rounded-xl shadow-sm border p-5 text-sm space-y-3">
            <h3 class="font-semibold text-gray-700">Order Summary</h3>
            <div class="flex justify-between"><span class="text-gray-500">Subtotal</span><span>₹{{ number_format($order->subtotal, 2) }}</span></div>
            @if($order->discount_amount > 0)
            <div class="flex justify-between text-green-600"><span>Discount</span><span>−₹{{ number_format($order->discount_amount, 2) }}</span></div>
            @endif
            @if($order->wallet_used > 0)
            <div class="flex justify-between text-blue-600"><span>Wallet Used</span><span>−₹{{ number_format($order->wallet_used, 2) }}</span></div>
            @endif
            <div class="flex justify-between font-bold text-base border-t pt-2"><span>Total</span><span>₹{{ number_format($order->total_amount, 2) }}</span></div>
            <div class="flex justify-between"><span class="text-gray-500">Payment</span>
                <span class="px-2 py-1 rounded-full text-xs {{ $order->payment_status === 'paid' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700' }}">
                    {{ ucfirst($order->payment_method) }} / {{ ucfirst($order->payment_status) }}
                </span>
            </div>
        </div>

        <!-- Shipping address -->
        <div class="bg-white rounded-xl shadow-sm border p-5 text-sm">
            <h3 class="font-semibold text-gray-700 mb-2">Shipping Address</h3>
            @php $addr = $order->shipping_address; @endphp
            <p class="text-gray-600">
                {{ $addr['name'] ?? '' }}<br>
                {{ $addr['address'] ?? '' }}<br>
                {{ $addr['city'] ?? '' }}, {{ $addr['state'] ?? '' }} {{ $addr['pincode'] ?? '' }}<br>
                {{ $addr['phone'] ?? '' }}
            </p>
        </div>

        <!-- Update status -->
        <div class="bg-white rounded-xl shadow-sm border p-5">
            <h3 class="font-semibold text-gray-700 mb-3 text-sm">Update Status</h3>
            <form method="POST" action="{{ route('admin.orders.status', $order) }}" class="flex gap-2">
                @csrf
                <select name="status" class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    @foreach(['pending','confirmed','shipped','delivered','cancelled'] as $s)
                    <option value="{{ $s }}" {{ $order->status === $s ? 'selected' : '' }}>{{ ucfirst($s) }}</option>
                    @endforeach
                </select>
                <button type="submit" class="px-4 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">Update</button>
            </form>
        </div>
    </div>
</div>
@endsection