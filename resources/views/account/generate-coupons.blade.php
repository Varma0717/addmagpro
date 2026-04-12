@extends('layouts.account')
@section('page_title', 'Generate Coupons')
@section('title', 'Generate Coupons')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">Generate Coupons</h2>

<div class="card p-5 mb-6">
    <form method="POST" action="{{ route('account.coupons.store') }}">
        @csrf
        <button class="btn-primary">Generate Coupon</button>
    </form>
</div>

<div class="card overflow-hidden">
    <div class="px-5 py-3 border-b border-surface-100 font-semibold">My Coupons</div>
    @if($myCoupons->isEmpty())
    <div class="p-5 text-surface-500">No coupons generated yet.</div>
    @else
    <div class="divide-y divide-surface-100">
        @foreach($myCoupons as $coupon)
        <div class="p-4 flex items-center justify-between text-sm">
            <div>
                <p class="font-semibold">{{ $coupon->code }}</p>
                <p class="text-surface-500">{{ $coupon->name }} • {{ $coupon->type === 'percentage' ? $coupon->value . '%' : '₹' . number_format((float) $coupon->value, 2) }}</p>
            </div>
            <span class="px-2 py-1 rounded bg-surface-100 text-xs">{{ $coupon->pivot->used_at ? 'Used' : 'Available' }}</span>
        </div>
        @endforeach
    </div>
    @endif
</div>
@endsection
