@extends('layouts.admin')
@section('title', 'Orders')

@section('content')
<div class="flex items-center justify-between mb-6">
    <div class="flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
        </svg>
        <h2 class="text-lg font-display font-semibold text-surface-700">All Orders</h2>
    </div>
    <div class="flex gap-2">
        @foreach(['all','pending','confirmed','shipped','delivered','cancelled'] as $s)
        <a href="{{ request()->fullUrlWithQuery(['status' => $s]) }}"
            class="px-3 py-1.5 rounded-lg text-xs capitalize font-medium ring-1 transition-colors
               {{ request('status', 'all') === $s ? 'bg-brand-500 text-white ring-brand-500 shadow-soft' : 'ring-surface-200 text-surface-600 hover:bg-surface-50' }}">
            {{ $s }}
        </a>
        @endforeach
    </div>
</div>

<div class="card overflow-hidden">
    <table class="w-full text-sm">
        <thead>
            <tr>
                <th class="table-header">ID</th>
                <th class="table-header">Customer</th>
                <th class="table-header">Total</th>
                <th class="table-header">Payment</th>
                <th class="table-header">Status</th>
                <th class="table-header">Date</th>
                <th class="table-header">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y divide-surface-100">
            @forelse($orders as $order)
            <tr class="hover:bg-surface-50 transition-colors">
                <td class="table-cell text-surface-400">#{{ $order->id }}</td>
                <td class="table-cell font-medium">{{ $order->user->name ?? '—' }}</td>
                <td class="table-cell font-semibold">₹{{ number_format($order->total_amount, 2) }}</td>
                <td class="table-cell">
                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1
                            {{ $order->payment_status === 'paid' ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-amber-50 text-amber-700 ring-amber-200' }}">
                        {{ ucfirst($order->payment_status) }}
                    </span>
                </td>
                <td class="table-cell">
                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1
                            {{ match($order->status) {
                                'pending'   => 'bg-amber-50 text-amber-700 ring-amber-200',
                                'confirmed' => 'bg-blue-50 text-blue-700 ring-blue-200',
                                'shipped'   => 'bg-violet-50 text-violet-700 ring-violet-200',
                                'delivered' => 'bg-emerald-50 text-emerald-700 ring-emerald-200',
                                'cancelled' => 'bg-red-50 text-red-700 ring-red-200',
                                default     => 'bg-surface-50 text-surface-600 ring-surface-200',
                            } }}">
                        {{ ucfirst($order->status) }}
                    </span>
                </td>
                <td class="table-cell text-surface-400">{{ $order->created_at->format('d M Y') }}</td>
                <td class="table-cell">
                    <a href="{{ route('admin.orders.show', $order) }}" class="btn-ghost btn-sm">
                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        </svg>
                        View
                    </a>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="7" class="table-cell text-center text-surface-400 py-8">No orders found.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
    <div class="px-5 py-4 border-t border-surface-100">{{ $orders->withQueryString()->links() }}</div>
</div>
@endsection