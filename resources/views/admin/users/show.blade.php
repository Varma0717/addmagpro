@extends('layouts.admin')
@section('title', 'User: ' . $user->name)

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    {{-- User Card --}}
    <div class="card p-6 space-y-4">
        <div class="flex items-center gap-4">
            @if($user->avatar)
            <img src="{{ Storage::url($user->avatar) }}" class="w-16 h-16 rounded-2xl object-cover ring-2 ring-brand-100">
            @else
            <div class="w-16 h-16 rounded-2xl bg-gradient-to-br from-brand-400 to-brand-600 text-white flex items-center justify-center text-2xl font-display font-bold shadow-soft">
                {{ strtoupper(substr($user->name, 0, 1)) }}
            </div>
            @endif
            <div>
                <h2 class="font-display font-semibold text-lg text-surface-800">{{ $user->name }}</h2>
                <p class="text-sm text-surface-500">{{ $user->email }}</p>
                <p class="text-sm text-surface-500">{{ $user->phone ?? '—' }}</p>
            </div>
        </div>
        <hr class="border-surface-100">
        <div class="text-sm space-y-2.5">
            <div class="flex justify-between"><span class="text-surface-500">Role</span><span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $user->role === 'admin' ? 'bg-violet-50 text-violet-700 ring-violet-200' : 'bg-surface-50 text-surface-600 ring-surface-200' }}">{{ ucfirst($user->role) }}</span></div>
            <div class="flex justify-between"><span class="text-surface-500">Wallet</span><span class="font-semibold text-emerald-600">₹{{ number_format($user->wallet_balance, 2) }}</span></div>
            <div class="flex justify-between"><span class="text-surface-500">Referral Code</span><span class="font-mono text-xs bg-surface-100 px-2.5 py-1 rounded-lg">{{ $user->referral_code }}</span></div>
            <div class="flex justify-between items-center"><span class="text-surface-500">Status</span>
                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $user->is_active ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-red-50 text-red-700 ring-red-200' }}">
                    {{ $user->is_active ? 'Active' : 'Inactive' }}
                </span>
            </div>
            <div class="flex justify-between"><span class="text-surface-500">Joined</span><span>{{ $user->created_at->format('d M Y') }}</span></div>
        </div>
        <hr class="border-surface-100">
        <form method="POST" action="{{ route('admin.users.toggle', $user) }}">
            @csrf
            <button class="w-full {{ $user->is_active ? 'btn-danger' : 'btn-secondary' }} justify-center">
                {{ $user->is_active ? 'Deactivate User' : 'Activate User' }}
            </button>
        </form>
    </div>

    {{-- Orders + Wallet + Referrals --}}
    <div class="lg:col-span-2 space-y-6">

        {{-- Orders --}}
        <div class="card overflow-hidden">
            <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
                <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                </svg>
                <span class="font-semibold text-surface-700">Orders</span>
            </div>
            <table class="w-full text-sm">
                <thead>
                    <tr>
                        <th class="table-header">ID</th>
                        <th class="table-header">Total</th>
                        <th class="table-header">Status</th>
                        <th class="table-header">Date</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-100">
                    @forelse($user->orders as $order)
                    <tr class="hover:bg-surface-50 transition-colors">
                        <td class="table-cell"><a href="{{ route('admin.orders.show', $order) }}" class="text-brand-600 hover:text-brand-700 font-medium">#{{ $order->id }}</a></td>
                        <td class="table-cell font-semibold">₹{{ number_format($order->total, 2) }}</td>
                        <td class="table-cell"><span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 bg-surface-50 text-surface-600 ring-surface-200">{{ ucfirst($order->status) }}</span></td>
                        <td class="table-cell text-surface-400">{{ $order->created_at->format('d M Y') }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="table-cell text-center text-surface-400 py-5">No orders.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        {{-- Wallet Transactions --}}
        <div class="card overflow-hidden">
            <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
                <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 0 0-2.25-2.25H15a3 3 0 1 1-6 0H5.25A2.25 2.25 0 0 0 3 12m18 0v6a2.25 2.25 0 0 1-2.25 2.25H5.25A2.25 2.25 0 0 1 3 18v-6m18 0V9M3 12V9m18 0a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 9m18 0V6a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 6v3" />
                </svg>
                <span class="font-semibold text-surface-700">Recent Wallet Transactions</span>
            </div>
            <table class="w-full text-sm">
                <thead>
                    <tr>
                        <th class="table-header">Description</th>
                        <th class="table-header">Type</th>
                        <th class="table-header">Amount</th>
                        <th class="table-header">Date</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-100">
                    @forelse($user->walletTransactions as $tx)
                    <tr class="hover:bg-surface-50 transition-colors">
                        <td class="table-cell text-surface-600">{{ $tx->description }}</td>
                        <td class="table-cell">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $tx->type === 'credit' ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-red-50 text-red-700 ring-red-200' }}">
                                {{ ucfirst($tx->type) }}
                            </span>
                        </td>
                        <td class="table-cell font-semibold {{ $tx->type === 'credit' ? 'text-emerald-600' : 'text-red-600' }}">
                            {{ $tx->type === 'credit' ? '+' : '-' }}₹{{ number_format($tx->amount, 2) }}
                        </td>
                        <td class="table-cell text-surface-400">{{ $tx->created_at->format('d M Y') }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="table-cell text-center text-surface-400 py-5">No transactions.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        {{-- Referrals --}}
        <div class="card overflow-hidden">
            <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
                <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M7.217 10.907a2.25 2.25 0 1 0 0 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186 9.566-5.314m-9.566 7.5 9.566 5.314m0 0a2.25 2.25 0 1 0 3.935 2.186 2.25 2.25 0 0 0-3.935-2.186Zm0-12.814a2.25 2.25 0 1 0 3.933-2.185 2.25 2.25 0 0 0-3.933 2.185Z" />
                </svg>
                <span class="font-semibold text-surface-700">Referrals Made</span>
            </div>
            <table class="w-full text-sm">
                <thead>
                    <tr>
                        <th class="table-header">Referred User</th>
                        <th class="table-header">Signup Reward</th>
                        <th class="table-header">Purchase Reward</th>
                        <th class="table-header">Date</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-surface-100">
                    @forelse($user->referrals as $ref)
                    <tr class="hover:bg-surface-50 transition-colors">
                        <td class="table-cell font-medium">{{ $ref->referred->name ?? '—' }}</td>
                        <td class="table-cell">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $ref->signup_reward_given ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-surface-50 text-surface-500 ring-surface-200' }}">
                                {{ $ref->signup_reward_given ? 'Given' : 'Pending' }}
                            </span>
                        </td>
                        <td class="table-cell">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $ref->purchase_reward_given ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-surface-50 text-surface-500 ring-surface-200' }}">
                                {{ $ref->purchase_reward_given ? 'Given' : 'Pending' }}
                            </span>
                        </td>
                        <td class="table-cell text-surface-400">{{ $ref->created_at->format('d M Y') }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="table-cell text-center text-surface-400 py-5">No referrals.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection