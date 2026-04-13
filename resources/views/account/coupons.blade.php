@extends('layouts.account')
@section('page_title', 'My Coupons')
@section('title', 'My Coupons')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">My Coupons</h2>

<div class="space-y-6">
    <section class="card p-5">
        <div class="flex items-center justify-between mb-4">
            <h3 class="font-semibold text-surface-800">Available Coupons</h3>
            <span class="text-xs px-2 py-1 rounded-full bg-emerald-100 text-emerald-700">{{ $availableCoupons->count() }}</span>
        </div>
        @if($availableCoupons->isEmpty())
            <p class="text-sm text-surface-500">No available coupons right now.</p>
        @else
            <div class="space-y-3">
                @foreach($availableCoupons as $userCoupon)
                    @php($coupon = $userCoupon->coupon)
                    <div class="rounded-xl border border-surface-200 p-4 bg-white">
                        <div class="flex items-start justify-between gap-3">
                            <div>
                                <p class="font-semibold text-surface-900">{{ $coupon->code }}</p>
                                <p class="text-sm text-surface-600">{{ $coupon->name }}</p>
                            </div>
                            <span class="text-xs font-semibold px-2 py-1 rounded-full bg-brand-50 text-brand-700">
                                {{ $coupon->type === 'percentage' ? rtrim(rtrim(number_format((float) $coupon->value, 2), '0'), '.') . '%' : '₹' . number_format((float) $coupon->value, 2) }} OFF
                            </span>
                        </div>
                        <div class="mt-3 grid sm:grid-cols-3 gap-2 text-xs text-surface-500">
                            <p>Min Order: ₹{{ number_format((float) $coupon->min_order_amount, 2) }}</p>
                            <p>Max Discount: {{ $coupon->max_discount_amount ? '₹' . number_format((float) $coupon->max_discount_amount, 2) : 'No limit' }}</p>
                            <p>Expires: {{ $coupon->expires_at ? $coupon->expires_at->format('d M Y, h:i A') : 'Never' }}</p>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif
    </section>

    <section class="card p-5">
        <div class="flex items-center justify-between mb-4">
            <h3 class="font-semibold text-surface-800">Used Coupons</h3>
            <span class="text-xs px-2 py-1 rounded-full bg-blue-100 text-blue-700">{{ $usedCoupons->count() }}</span>
        </div>
        @if($usedCoupons->isEmpty())
            <p class="text-sm text-surface-500">No used coupons yet.</p>
        @else
            <div class="space-y-2">
                @foreach($usedCoupons as $userCoupon)
                    <div class="flex items-center justify-between rounded-lg border border-surface-100 bg-surface-50 px-3 py-2.5 text-sm">
                        <div>
                            <p class="font-medium text-surface-800">{{ $userCoupon->coupon->code }}</p>
                            <p class="text-xs text-surface-500">{{ $userCoupon->coupon->name }}</p>
                        </div>
                        <p class="text-xs text-surface-500">Used on {{ $userCoupon->used_at?->format('d M Y, h:i A') }}</p>
                    </div>
                @endforeach
            </div>
        @endif
    </section>

    <section class="card p-5">
        <div class="flex items-center justify-between mb-4">
            <h3 class="font-semibold text-surface-800">Expired / Inactive Coupons</h3>
            <span class="text-xs px-2 py-1 rounded-full bg-rose-100 text-rose-700">{{ $expiredCoupons->count() }}</span>
        </div>
        @if($expiredCoupons->isEmpty())
            <p class="text-sm text-surface-500">No expired or inactive coupons.</p>
        @else
            <div class="space-y-2">
                @foreach($expiredCoupons as $userCoupon)
                    <div class="rounded-lg border border-rose-100 bg-rose-50 px-3 py-2.5 text-sm">
                        <p class="font-medium text-surface-800">{{ $userCoupon->coupon->code }} — {{ $userCoupon->coupon->name }}</p>
                        <p class="text-xs text-surface-500 mt-1">
                            {{ !$userCoupon->coupon->is_active ? 'Inactive coupon' : 'Expired on ' . optional($userCoupon->coupon->expires_at)->format('d M Y, h:i A') }}
                        </p>
                    </div>
                @endforeach
            </div>
        @endif
    </section>
</div>
@endsection
