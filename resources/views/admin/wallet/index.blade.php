@extends('layouts.admin')
@section('title', 'Wallet Transactions')

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    {{-- Transactions List --}}
    <div class="lg:col-span-2 card overflow-hidden">
        <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 0 0-2.25-2.25H15a3 3 0 1 1-6 0H5.25A2.25 2.25 0 0 0 3 12m18 0v6a2.25 2.25 0 0 1-2.25 2.25H5.25A2.25 2.25 0 0 1 3 18v-6m18 0V9M3 12V9m18 0a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 9m18 0V6a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 6v3" />
            </svg>
            <span class="font-semibold text-surface-700">All Wallet Transactions</span>
        </div>
        <table class="w-full text-sm">
            <thead>
                <tr>
                    <th class="table-header">User</th>
                    <th class="table-header">Description</th>
                    <th class="table-header">Type</th>
                    <th class="table-header">Amount</th>
                    <th class="table-header">Date</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-100">
                @forelse($transactions as $tx)
                <tr class="hover:bg-surface-50 transition-colors">
                    <td class="table-cell font-medium">{{ $tx->user->name ?? '—' }}</td>
                    <td class="table-cell text-surface-500">{{ $tx->description }}</td>
                    <td class="table-cell">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $tx->type === 'credit' ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-red-50 text-red-700 ring-red-200' }}">
                            {{ ucfirst($tx->type) }}
                        </span>
                    </td>
                    <td class="table-cell font-semibold {{ $tx->type === 'credit' ? 'text-emerald-600' : 'text-red-600' }}">
                        {{ $tx->type === 'credit' ? '+' : '-' }}₹{{ number_format($tx->amount, 2) }}
                    </td>
                    <td class="table-cell text-surface-400">{{ $tx->created_at->format('d M Y, h:i A') }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="table-cell text-center text-surface-400 py-8">No transactions.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
        <div class="px-5 py-4 border-t border-surface-100">{{ $transactions->links() }}</div>
    </div>

    {{-- Manual Credit Form --}}
    <div class="card p-6 space-y-4 self-start">
        <div class="flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
            </svg>
            <h3 class="font-display font-semibold text-surface-700">Manual Wallet Credit</h3>
        </div>
        <form method="POST" action="{{ route('admin.wallet.credit') }}" class="space-y-4">
            @csrf
            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">User</label>
                <select name="user_id" required class="input w-full">
                    <option value="">Select user…</option>
                    @foreach($users as $u)
                    <option value="{{ $u->id }}">{{ $u->name }} ({{ $u->email }})</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Amount (₹)</label>
                <input name="amount" type="number" step="0.01" min="1" required class="input w-full">
            </div>
            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Description</label>
                <input name="description" value="Admin credit" required class="input w-full">
            </div>
            <button type="submit" class="btn-primary w-full justify-center">Credit Wallet</button>
        </form>
    </div>

</div>
@endsection