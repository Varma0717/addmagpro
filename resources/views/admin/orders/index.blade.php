@extends('layouts.admin')
@section('title', 'Orders')

@section('content')
<div class="flex items-center justify-between mb-6">
    <h2 class="text-lg font-semibold text-gray-700">All Orders</h2>
    <div class="flex gap-2">
        @foreach(['all','pending','confirmed','shipped','delivered','cancelled'] as $s)
        <a href="{{ request()->fullUrlWithQuery(['status' => $s]) }}"
            class="px-3 py-1.5 rounded-lg text-xs capitalize border
               {{ request('status', 'all') === $s ? 'bg-orange-500 text-white border-orange-500' : 'border-gray-300 hover:bg-gray-50' }}">
            {{ $s }}
        </a>
        @endforeach
    </div>
</div>

<div class="bg-white rounded-xl shadow-sm border overflow-hidden">
    <table class="w-full text-sm">
        <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
            <tr>
                <th class="px-4 py-3 text-left">ID</th>
                <th class="px-4 py-3 text-left">Customer</th>
                <th class="px-4 py-3 text-left">Total</th>
                <th class="px-4 py-3 text-left">Payment</th>
                <th class="px-4 py-3 text-left">Status</th>
                <th class="px-4 py-3 text-left">Date</th>
                <th class="px-4 py-3 text-left">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y">
            @forelse($orders as $order)
            <tr class="hover:bg-gray-50">
                <td class="px-4 py-3 text-gray-400">#{{ $order->id }}</td>
                <td class="px-4 py-3 font-medium">{{ $order->user->name ?? '—' }}</td>
                <td class="px-4 py-3 font-medium">₹{{ number_format($order->total_amount, 2) }}</td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs
                            {{ $order->payment_status === 'paid' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700' }}">
                        {{ ucfirst($order->payment_status) }}
                    </span>
                </td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs
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
                </td>
                <td class="px-4 py-3 text-gray-400">{{ $order->created_at->format('d M Y') }}</td>
                <td class="px-4 py-3">
                    <a href="{{ route('admin.orders.show', $order) }}" class="text-orange-600 text-xs hover:underline">View</a>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="7" class="px-4 py-8 text-center text-gray-400">No orders found.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
    <div class="px-5 py-4 border-t">{{ $orders->withQueryString()->links() }}</div>
</div>
@endsection