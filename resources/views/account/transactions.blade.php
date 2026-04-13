@extends('layouts.account')
@section('page_title', 'Transactions')
@section('title', 'Transactions')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">Transactions</h2>

<div class="card overflow-hidden">
    @if($transactions->isEmpty())
    <div class="p-8 text-center text-surface-500">No wallet transactions found.</div>
    @else
    <div class="divide-y divide-surface-100">
        @foreach($transactions as $tx)
        <div class="flex items-center justify-between gap-4 px-5 py-4">
            <div>
                <p class="font-semibold text-surface-800">{{ $tx->description }}</p>
                <p class="text-xs text-surface-400 mt-1">{{ $tx->created_at->format('d M Y, h:i A') }}</p>
            </div>
            <p class="font-bold {{ $tx->type === 'credit' ? 'text-emerald-600' : 'text-red-600' }}">
                {{ $tx->type === 'credit' ? '+' : '−' }}₹{{ number_format($tx->amount, 2) }}
            </p>
        </div>
        @endforeach
    </div>
    <div class="px-5 py-4 border-t border-surface-100">{{ $transactions->links() }}</div>
    @endif
</div>
@endsection
