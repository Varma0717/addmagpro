@extends('layouts.admin')
@section('title', 'Dashboard')

@section('content')
<div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4 mb-8">
    @php
    $cards = [
    ['label' => 'Total Users', 'value' => $stats['total_users'], 'color' => 'blue'],
    ['label' => 'Active Users', 'value' => $stats['active_users'], 'color' => 'green'],
    ['label' => 'Total Orders', 'value' => $stats['total_orders'], 'color' => 'purple'],
    ['label' => 'Revenue (₹)', 'value' => number_format($stats['revenue'],2), 'color' => 'orange'],
    ['label' => 'Referrals', 'value' => $stats['total_referrals'], 'color' => 'pink'],
    ['label' => 'Wallet Issued (₹)', 'value' => number_format($stats['wallet_issued'],2), 'color' => 'yellow'],
    ];
    $colors = [
    'blue' => 'bg-blue-50 border-blue-200 text-blue-700',
    'green' => 'bg-green-50 border-green-200 text-green-700',
    'purple' => 'bg-purple-50 border-purple-200 text-purple-700',
    'orange' => 'bg-orange-50 border-orange-200 text-orange-700',
    'pink' => 'bg-pink-50 border-pink-200 text-pink-700',
    'yellow' => 'bg-yellow-50 border-yellow-200 text-yellow-700',
    ];
    @endphp

    @foreach($cards as $card)
    <div class="border rounded-xl p-4 {{ $colors[$card['color']] }}">
        <p class="text-xs font-medium uppercase tracking-wide opacity-70">{{ $card['label'] }}</p>
        <p class="text-2xl font-bold mt-1">{{ $card['value'] }}</p>
    </div>
    @endforeach
</div>

<div class="grid md:grid-cols-2 gap-6">
    <!-- Recent Orders -->
    <div class="bg-white rounded-xl shadow-sm border overflow-hidden">
        <div class="px-5 py-4 border-b font-semibold text-gray-700">Recent Orders</div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                    <tr>
                        <th class="px-4 py-3 text-left">ID</th>
                        <th class="px-4 py-3 text-left">User</th>
                        <th class="px-4 py-3 text-left">Total</th>
                        <th class="px-4 py-3 text-left">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @forelse($recentOrders as $order)
                    <tr class="hover:bg-gray-50 transition-colors">
                        <td class="px-4 py-3">
                            <a href="{{ route('admin.orders.show', $order) }}" class="text-orange-600 hover:underline">#{{ $order->id }}</a>
                        </td>
                        <td class="px-4 py-3 text-gray-700">{{ $order->user->name ?? '—' }}</td>
                        <td class="px-4 py-3 font-medium">₹{{ number_format($order->total_amount, 2) }}</td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-1 rounded-full text-xs font-medium
                                    {{ match($order->status) {
                                        'pending'   => 'bg-yellow-100 text-yellow-700',
                                        'confirmed' => 'bg-blue-100 text-blue-700',
                                        'shipped'   => 'bg-purple-100 text-purple-700',
                                        'delivered' => 'bg-green-100 text-green-700',
                                        'cancelled' => 'bg-red-100 text-red-700',
                                        default     => 'bg-gray-100 text-gray-700',
                                    } }}">
                                {{ ucfirst($order->status) }}
                            </span>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="px-4 py-6 text-center text-gray-400">No orders yet.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <!-- Recent Users -->
    <div class="bg-white rounded-xl shadow-sm border overflow-hidden">
        <div class="px-5 py-4 border-b font-semibold text-gray-700">Recent Users</div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                    <tr>
                        <th class="px-4 py-3 text-left">Name</th>
                        <th class="px-4 py-3 text-left">Email</th>
                        <th class="px-4 py-3 text-left">Joined</th>
                        <th class="px-4 py-3 text-left">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @forelse($recentUsers as $user)
                    <tr class="hover:bg-gray-50 transition-colors">
                        <td class="px-4 py-3">
                            <a href="{{ route('admin.users.show', $user) }}" class="text-orange-600 hover:underline">{{ $user->name }}</a>
                        </td>
                        <td class="px-4 py-3 text-gray-500 truncate max-w-[160px]">{{ $user->email }}</td>
                        <td class="px-4 py-3 text-gray-400">{{ $user->created_at->format('d M') }}</td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-1 rounded-full text-xs {{ $user->is_active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                                {{ $user->is_active ? 'Active' : 'Inactive' }}
                            </span>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="px-4 py-6 text-center text-gray-400">No users yet.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection