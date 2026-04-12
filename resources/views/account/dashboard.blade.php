@extends('layouts.account')
@section('page_title', 'Dashboard')
@section('title', 'Dashboard')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">Executive Dashboard</h2>

<div class="grid grid-cols-2 md:grid-cols-3 gap-4 mb-6">
    <div class="card p-4">
        <p class="text-xs text-surface-500">My Commission</p>
        <p class="text-lg font-semibold">{{ number_format((float) $stats['my_commission'], 2) }}</p>
    </div>
    <div class="card p-4">
        <p class="text-xs text-surface-500">Back2Back Value</p>
        <p class="text-lg font-semibold">{{ number_format((float) $stats['back2back_value'], 2) }}</p>
    </div>
    <div class="card p-4">
        <p class="text-xs text-surface-500">Back2Back Income</p>
        <p class="text-lg font-semibold">{{ number_format((float) $stats['back2back_income'], 2) }}</p>
    </div>
    <div class="card p-4">
        <p class="text-xs text-surface-500">Discount Cashback</p>
        <p class="text-lg font-semibold">{{ number_format((float) $stats['discount_cashback'], 2) }}</p>
    </div>
    <div class="card p-4">
        <p class="text-xs text-surface-500">Deposite Wallet</p>
        <p class="text-lg font-semibold">{{ number_format((float) $stats['deposite_wallet'], 2) }}</p>
    </div>
    <div class="card p-4">
        <p class="text-xs text-surface-500">Cummulative</p>
        <p class="text-lg font-semibold">{{ number_format((float) $stats['cummulative'], 2) }}</p>
    </div>
</div>

<div class="card p-5 mb-6">
    <h3 class="font-semibold mb-3">Referral Links</h3>
    <div class="space-y-3 text-sm">
        <div>
            <p class="text-surface-600 mb-1">Member Referral Link</p>
            <div class="flex items-center gap-2">
                <a href="{{ $memberReferralLink }}" class="text-brand-600 truncate">{{ $memberReferralLink }}</a>
                <button type="button" class="px-2 py-1 rounded bg-surface-100" onclick="navigator.clipboard.writeText('{{ $memberReferralLink }}')">Copy</button>
            </div>
        </div>
        <div>
            <p class="text-surface-600 mb-1">Vendor Referral Link</p>
            <div class="flex items-center gap-2">
                <a href="{{ $vendorReferralLink }}" class="text-brand-600 truncate">{{ $vendorReferralLink }}</a>
                <button type="button" class="px-2 py-1 rounded bg-surface-100" onclick="navigator.clipboard.writeText('{{ $vendorReferralLink }}')">Copy</button>
            </div>
        </div>
    </div>
</div>

<div id="withdraw" class="card p-5">
    <h3 class="font-semibold mb-3">Withdraw</h3>
    <form method="POST" action="{{ route('account.withdraw.store') }}" class="grid sm:grid-cols-3 gap-3">
        @csrf
        <input type="number" step="0.01" min="100" name="amount" placeholder="Amount" class="input" required>
        <input type="text" name="remarks" placeholder="Remarks (optional)" class="input">
        <button class="btn-primary">Request Withdraw</button>
    </form>

    @if($withdrawRequests->isNotEmpty())
    <div class="mt-4 border-t border-surface-100 pt-4">
        <p class="text-sm font-medium mb-2">Recent Requests</p>
        <div class="space-y-2">
            @foreach($withdrawRequests as $req)
            <div class="text-sm flex items-center justify-between">
                <span>{{ $req->request_no }} - {{ number_format((float) $req->amount, 2) }}</span>
                <span class="px-2 py-0.5 rounded text-xs bg-surface-100">{{ ucfirst($req->status) }}</span>
            </div>
            @endforeach
        </div>
    </div>
    @endif
</div>
@endsection