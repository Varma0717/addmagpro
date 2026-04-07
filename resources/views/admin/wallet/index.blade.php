@extends('layouts.admin')
@section('title', 'Wallet Transactions')

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    <!-- Transactions list -->
    <div class="lg:col-span-2 bg-white rounded-xl shadow-sm border overflow-hidden">
        <div class="px-5 py-4 border-b font-semibold text-gray-700">All Wallet Transactions</div>
        <table class="w-full text-sm">
            <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                <tr>
                    <th class="px-4 py-3 text-left">User</th>
                    <th class="px-4 py-3 text-left">Description</th>
                    <th class="px-4 py-3 text-left">Type</th>
                    <th class="px-4 py-3 text-left">Amount</th>
                    <th class="px-4 py-3 text-left">Date</th>
                </tr>
            </thead>
            <tbody class="divide-y">
                @forelse($transactions as $tx)
                <tr>
                    <td class="px-4 py-3 font-medium">{{ $tx->user->name ?? '—' }}</td>
                    <td class="px-4 py-3 text-gray-500">{{ $tx->description }}</td>
                    <td class="px-4 py-3">
                        <span class="px-2 py-1 rounded-full text-xs {{ $tx->type === 'credit' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                            {{ ucfirst($tx->type) }}
                        </span>
                    </td>
                    <td class="px-4 py-3 font-medium {{ $tx->type === 'credit' ? 'text-green-600' : 'text-red-600' }}">
                        {{ $tx->type === 'credit' ? '+' : '-' }}₹{{ number_format($tx->amount, 2) }}
                    </td>
                    <td class="px-4 py-3 text-gray-400">{{ $tx->created_at->format('d M Y, h:i A') }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="px-4 py-8 text-center text-gray-400">No transactions.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
        <div class="px-5 py-4 border-t">{{ $transactions->links() }}</div>
    </div>

    <!-- Manual credit form -->
    <div class="bg-white rounded-xl shadow-sm border p-6 space-y-4 self-start">
        <h3 class="font-semibold text-gray-700">Manual Wallet Credit</h3>
        <form method="POST" action="{{ route('admin.wallet.credit') }}" class="space-y-4">
            @csrf
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">User</label>
                <select name="user_id" required class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    <option value="">Select user…</option>
                    @foreach($users as $u)
                    <option value="{{ $u->id }}">{{ $u->name }} ({{ $u->email }})</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Amount (₹)</label>
                <input name="amount" type="number" step="0.01" min="1" required
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                <input name="description" value="Admin credit" required
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>
            <button type="submit" class="w-full px-4 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">Credit Wallet</button>
        </form>
    </div>

</div>
@endsection