@extends('layouts.admin')
@section('title', 'Dashboard')

@section('content')
{{-- Stats Grid --}}
<div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4 mb-8">
    @php
    $cards = [
    ['label' => 'Total Users', 'value' => $stats['total_users'], 'icon' => 'M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z', 'ring' => 'ring-blue-200', 'bg' => 'bg-blue-50', 'text' => 'text-blue-700', 'iconBg' => 'bg-blue-100'],
    ['label' => 'Active Users', 'value' => $stats['active_users'], 'icon' => 'M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z', 'ring' => 'ring-emerald-200', 'bg' => 'bg-emerald-50', 'text' => 'text-emerald-700', 'iconBg' => 'bg-emerald-100'],
    ['label' => 'Total Orders', 'value' => $stats['total_orders'], 'icon' => 'M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z', 'ring' => 'ring-violet-200', 'bg' => 'bg-violet-50', 'text' => 'text-violet-700', 'iconBg' => 'bg-violet-100'],
    ['label' => 'Revenue (₹)', 'value' => number_format($stats['revenue'],2), 'icon' => 'M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 0 0-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 0 1-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 0 0 3 15h-.75M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm3 0h.008v.008H18V10.5Zm-12 0h.008v.008H6V10.5Z', 'ring' => 'ring-brand-200', 'bg' => 'bg-brand-50', 'text' => 'text-brand-700', 'iconBg' => 'bg-brand-100'],
    ['label' => 'Referrals', 'value' => $stats['total_referrals'], 'icon' => 'M7.217 10.907a2.25 2.25 0 1 0 0 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186 9.566-5.314m-9.566 7.5 9.566 5.314m0 0a2.25 2.25 0 1 0 3.935 2.186 2.25 2.25 0 0 0-3.935-2.186Zm0-12.814a2.25 2.25 0 1 0 3.933-2.185 2.25 2.25 0 0 0-3.933 2.185Z', 'ring' => 'ring-pink-200', 'bg' => 'bg-pink-50', 'text' => 'text-pink-700', 'iconBg' => 'bg-pink-100'],
    ['label' => 'Wallet Issued (₹)', 'value' => number_format($stats['wallet_issued'],2), 'icon' => 'M21 12a2.25 2.25 0 0 0-2.25-2.25H15a3 3 0 1 1-6 0H5.25A2.25 2.25 0 0 0 3 12m18 0v6a2.25 2.25 0 0 1-2.25 2.25H5.25A2.25 2.25 0 0 1 3 18v-6m18 0V9M3 12V9m18 0a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 9m18 0V6a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 6v3', 'ring' => 'ring-amber-200', 'bg' => 'bg-amber-50', 'text' => 'text-amber-700', 'iconBg' => 'bg-amber-100'],
    ];
    @endphp

    @foreach($cards as $card)
    <div class="card ring-1 {{ $card['ring'] }} {{ $card['bg'] }} p-4">
        <div class="flex items-center gap-3 mb-2">
            <div class="w-9 h-9 rounded-lg {{ $card['iconBg'] }} flex items-center justify-center">
                <svg class="w-5 h-5 {{ $card['text'] }}" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="{{ $card['icon'] }}" />
                </svg>
            </div>
        </div>
        <p class="text-xs font-medium uppercase tracking-wider {{ $card['text'] }} opacity-70">{{ $card['label'] }}</p>
        <p class="text-2xl font-display font-bold mt-1 {{ $card['text'] }}">{{ $card['value'] }}</p>
    </div>
    @endforeach
</div>



{{-- Chatbot Analytics --}}
<div class="card p-5 mb-6">
    <div class="flex items-center justify-between mb-4">
        <h3 class="font-semibold text-surface-800">Chatbot Analytics</h3>
        <span class="text-xs text-surface-500">Lightweight assistant interactions</span>
    </div>
    <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
        <div class="rounded-xl border border-surface-200 p-3 bg-surface-50">
            <p class="text-xs uppercase tracking-wider text-surface-500">Suggestion Requests</p>
            <p class="text-xl font-bold text-surface-800 mt-1">{{ $chatbotStats['requests'] }}</p>
        </div>
        <div class="rounded-xl border border-surface-200 p-3 bg-surface-50">
            <p class="text-xs uppercase tracking-wider text-surface-500">Fallback Rate</p>
            <p class="text-xl font-bold text-surface-800 mt-1">{{ number_format($chatbotStats['fallback_rate'], 1) }}%</p>
        </div>
        <div class="rounded-xl border border-surface-200 p-3 bg-surface-50">
            <p class="text-xs uppercase tracking-wider text-surface-500">Widget Opens</p>
            <p class="text-xl font-bold text-surface-800 mt-1">{{ $chatbotStats['opens'] }}</p>
        </div>
    </div>
</div>

<div class="card overflow-hidden mb-6">
    <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" d="M8.625 9a3.375 3.375 0 116.75 0c0 1.313-.726 2.456-1.8 3.028-.724.387-1.2 1.161-1.2 1.982v.365m0 3.375h.008v.008h-.008v-.008z" />
        </svg>
        <span class="font-semibold text-surface-700">Recent Chatbot Events</span>
    </div>
    <div class="overflow-x-auto">
        <table class="w-full text-sm">
            <thead>
                <tr>
                    <th class="table-header">Time</th>
                    <th class="table-header">Event</th>
                    <th class="table-header">Intent</th>
                    <th class="table-header">Provider</th>
                    <th class="table-header">Fallback</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-100">
                @forelse($recent_chatbot_interactions as $event)
                <tr class="hover:bg-surface-50 transition-colors">
                    <td class="table-cell text-surface-500">{{ $event->created_at->format('d M H:i') }}</td>
                    <td class="table-cell text-surface-700">{{ str_replace('_', ' ', ucfirst($event->event_type)) }}</td>
                    <td class="table-cell text-surface-500">{{ $event->intent ?: '—' }}</td>
                    <td class="table-cell text-surface-500">{{ strtoupper($event->provider) }}</td>
                    <td class="table-cell text-surface-500">{{ $event->fallback_used ? 'Yes' : 'No' }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="table-cell text-center text-surface-400 py-6">No chatbot activity yet.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

<div class="grid md:grid-cols-2 gap-6">
    {{-- Recent Orders --}}
    <div class="card overflow-hidden">
        <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
            </svg>
            <span class="font-semibold text-surface-700">Recent Orders</span>
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead>
                    <tr>
                        <th class="table-header">ID</th>
                        <th class="table-header">User</th>
                        <th class="table-header">Total</th>
                        <th class="table-header">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-100">
                    @forelse($recent_orders as $order)
                    <tr class="hover:bg-surface-50 transition-colors">
                        <td class="table-cell">
                            <a href="{{ route('admin.orders.show', $order) }}" class="text-brand-600 hover:text-brand-700 font-medium">#{{ $order->id }}</a>
                        </td>
                        <td class="table-cell text-surface-700">{{ $order->user->name ?? '—' }}</td>
                        <td class="table-cell font-semibold">₹{{ number_format($order->total, 2) }}</td>
                        <td class="table-cell">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1
                                    {{ match($order->status) {
                                        'pending'   => 'bg-amber-50 text-amber-700 ring-amber-200',
                                        'confirmed' => 'bg-blue-50 text-blue-700 ring-blue-200',
                                        'shipped'   => 'bg-violet-50 text-violet-700 ring-violet-200',
                                        'delivered' => 'bg-emerald-50 text-emerald-700 ring-emerald-200',
                                        'cancelled' => 'bg-red-50 text-red-700 ring-red-200',
                                        default     => 'bg-surface-50 text-surface-700 ring-surface-200',
                                    } }}">
                                {{ ucfirst($order->status) }}
                            </span>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="table-cell text-center text-surface-400 py-6">No orders yet.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    {{-- Recent Users --}}
    <div class="card overflow-hidden">
        <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" />
            </svg>
            <span class="font-semibold text-surface-700">Recent Users</span>
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead>
                    <tr>
                        <th class="table-header">Name</th>
                        <th class="table-header">Email</th>
                        <th class="table-header">Joined</th>
                        <th class="table-header">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-100">
                    @forelse($recent_users as $user)
                    <tr class="hover:bg-surface-50 transition-colors">
                        <td class="table-cell">
                            <a href="{{ route('admin.users.show', $user) }}" class="text-brand-600 hover:text-brand-700 font-medium">{{ $user->name }}</a>
                        </td>
                        <td class="table-cell text-surface-500 truncate max-w-[160px]">{{ $user->email }}</td>
                        <td class="table-cell text-surface-400">{{ $user->created_at->format('d M') }}</td>
                        <td class="table-cell">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $user->is_active ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-red-50 text-red-700 ring-red-200' }}">
                                {{ $user->is_active ? 'Active' : 'Inactive' }}
                            </span>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="table-cell text-center text-surface-400 py-6">No users yet.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection