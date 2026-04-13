@extends('layouts.account')
@section('page_title', 'Coupons')
@section('title', 'My Coupons')

@section('account_content')
<div class="flex items-center justify-between gap-3 mb-6">
    <h2 class="text-xl font-bold font-display text-surface-800">My Coupons</h2>
    <form method="POST" action="{{ route('account.coupons.store') }}">
        @csrf
        <button type="submit" class="btn-primary">Generate Coupon</button>
    </form>
</div>

<div class="card overflow-hidden">
    @if($coupons->isEmpty())
    <div class="p-8 text-center text-surface-500">No coupons available yet. Generate one to get started.</div>
    @else
    <div class="divide-y divide-surface-100">
        @foreach($coupons as $coupon)
        <div class="px-5 py-4">
            <div class="flex items-center justify-between gap-3">
                <p class="font-semibold text-surface-800">{{ $coupon->code }}</p>
                <span class="text-xs px-2 py-1 rounded-full {{ $coupon->pivot->used_at ? 'bg-surface-100 text-surface-500' : 'bg-emerald-100 text-emerald-700' }}">
                    {{ $coupon->pivot->used_at ? 'Used' : 'Available' }}
                </span>
            </div>
            <p class="text-sm text-surface-600 mt-1">{{ $coupon->description ?: 'Coupon available for eligible orders.' }}</p>
            <p class="text-xs text-surface-400 mt-2">
                Added {{ $coupon->pivot->created_at?->format('d M Y, h:i A') }}
                @if($coupon->expires_at)
                • Expires {{ $coupon->expires_at->format('d M Y') }}
                @endif
            </p>
        </div>
        @endforeach
    </div>
    <div class="px-5 py-4 border-t border-surface-100">{{ $coupons->links() }}</div>
    @endif
</div>
@endsection
