@extends('layouts.admin')
@section('title', 'User: ' . $user->name)

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    <!-- User card -->
    <div class="bg-white rounded-xl shadow-sm border p-6 space-y-3">
        <div class="flex items-center gap-4">
            @if($user->avatar)
            <img src="{{ Storage::url($user->avatar) }}" class="w-16 h-16 rounded-full object-cover">
            @else
            <div class="w-16 h-16 rounded-full bg-orange-100 text-orange-600 flex items-center justify-center text-2xl font-bold">
                {{ strtoupper(substr($user->name, 0, 1)) }}
            </div>
            @endif
            <div>
                <h2 class="font-semibold text-lg text-gray-800">{{ $user->name }}</h2>
                <p class="text-sm text-gray-500">{{ $user->email }}</p>
                <p class="text-sm text-gray-500">{{ $user->phone ?? '—' }}</p>
            </div>
        </div>
        <hr>
        <div class="text-sm space-y-2">
            <div class="flex justify-between"><span class="text-gray-500">Role</span><span class="font-medium">{{ ucfirst($user->role) }}</span></div>
            <div class="flex justify-between"><span class="text-gray-500">Wallet</span><span class="font-medium text-green-600">₹{{ number_format($user->wallet_balance, 2) }}</span></div>
            <div class="flex justify-between"><span class="text-gray-500">Referral Code</span><span class="font-mono text-xs bg-gray-100 px-2 py-1 rounded">{{ $user->referral_code }}</span></div>
            <div class="flex justify-between"><span class="text-gray-500">Status</span>
                <span class="px-2 py-1 rounded-full text-xs {{ $user->is_active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                    {{ $user->is_active ? 'Active' : 'Inactive' }}
                </span>
            </div>
            <div class="flex justify-between"><span class="text-gray-500">Joined</span><span>{{ $user->created_at->format('d M Y') }}</span></div>
        </div>
        <hr>
        <form method="POST" action="{{ route('admin.users.toggle', $user) }}">
            @csrf
            <button class="w-full text-sm py-2 rounded-lg border {{ $user->is_active ? 'border-red-400 text-red-600 hover:bg-red-50' : 'border-green-400 text-green-600 hover:bg-green-50' }}">
                {{ $user->is_active ? 'Deactivate User' : 'Activate User' }}
            </button>
        </form>
    </div>

    <!-- Orders + Wallet + Referrals -->
    <div class="lg:col-span-2 space-y-6">

        <!-- Recent Orders -->
        <div class="bg-white rounded-xl shadow-sm border overflow-hidden">
            <div class="px-5 py-4 border-b font-semibold text-gray-700">Orders</div>
            <table class="w-full text-sm">
                <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                    <tr>
                        <th class="px-4 py-3 text-left">ID</th>
                        <th class="px-4 py-3 text-left">Total</th>
                        <th class="px-4 py-3 text-left">Status</th>
                        <th class="px-4 py-3 text-left">Date</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @forelse($orders as $order)
                    <tr>
                        <td class="px-4 py-3"><a href="{{ route('admin.orders.show', $order) }}" class="text-orange-600 hover:underline">#{{ $order->id }}</a></td>
                        <td class="px-4 py-3">₹{{ number_format($order->total_amount, 2) }}</td>
                        <td class="px-4 py-3"><span class="px-2 py-1 rounded-full text-xs bg-gray-100 text-gray-600">{{ ucfirst($order->status) }}</span></td>
                        <td class="px-4 py-3 text-gray-400">{{ $order->created_at->format('d M Y') }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="px-4 py-5 text-center text-gray-400">No orders.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <!-- Wallet Transactions -->
        <div class="bg-white rounded-xl shadow-sm border overflow-hidden">
            <div class="px-5 py-4 border-b font-semibold text-gray-700">Recent Wallet Transactions</div>
            <table class="w-full text-sm">
                <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                    <tr>
                        <th class="px-4 py-3 text-left">Description</th>
                        <th class="px-4 py-3 text-left">Type</th>
                        <th class="px-4 py-3 text-left">Amount</th>
                        <th class="px-4 py-3 text-left">Date</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @forelse($walletTrans as $tx)
                    <tr>
                        <td class="px-4 py-3 text-gray-600">{{ $tx->description }}</td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-1 rounded-full text-xs {{ $tx->type === 'credit' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                                {{ ucfirst($tx->type) }}
                            </span>
                        </td>
                        <td class="px-4 py-3 font-medium {{ $tx->type === 'credit' ? 'text-green-600' : 'text-red-600' }}">
                            {{ $tx->type === 'credit' ? '+' : '-' }}₹{{ number_format($tx->amount, 2) }}
                        </td>
                        <td class="px-4 py-3 text-gray-400">{{ $tx->created_at->format('d M Y') }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="px-4 py-5 text-center text-gray-400">No transactions.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <!-- Referrals -->
        <div class="bg-white rounded-xl shadow-sm border overflow-hidden">
            <div class="px-5 py-4 border-b font-semibold text-gray-700">Referrals Made</div>
            <table class="w-full text-sm">
                <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                    <tr>
                        <th class="px-4 py-3 text-left">Referred User</th>
                        <th class="px-4 py-3 text-left">Signup Reward</th>
                        <th class="px-4 py-3 text-left">Purchase Reward</th>
                        <th class="px-4 py-3 text-left">Date</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @forelse($referrals as $ref)
                    <tr>
                        <td class="px-4 py-3">{{ $ref->referee->name ?? '—' }}</td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-1 rounded-full text-xs {{ $ref->signup_reward_given ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-500' }}">
                                {{ $ref->signup_reward_given ? 'Given' : 'Pending' }}
                            </span>
                        </td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-1 rounded-full text-xs {{ $ref->purchase_reward_given ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-500' }}">
                                {{ $ref->purchase_reward_given ? 'Given' : 'Pending' }}
                            </span>
                        </td>
                        <td class="px-4 py-3 text-gray-400">{{ $ref->created_at->format('d M Y') }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="px-4 py-5 text-center text-gray-400">No referrals.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection