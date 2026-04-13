<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\UserCoupon;

class CouponController extends Controller
{
    public function index()
    {
        $userCoupons = UserCoupon::query()
            ->where('user_id', auth()->id())
            ->with('coupon')
            ->latest()
            ->get()
            ->filter(fn (UserCoupon $userCoupon) => $userCoupon->coupon !== null);

        $availableCoupons = $userCoupons
            ->filter(function (UserCoupon $userCoupon) {
                $coupon = $userCoupon->coupon;

                return $userCoupon->used_at === null
                    && $coupon->is_active
                    && (!$coupon->expires_at || !$coupon->expires_at->isPast());
            })
            ->values();

        $usedCoupons = $userCoupons
            ->filter(fn (UserCoupon $userCoupon) => $userCoupon->used_at !== null)
            ->values();

        $expiredCoupons = $userCoupons
            ->filter(function (UserCoupon $userCoupon) {
                $coupon = $userCoupon->coupon;

                return $userCoupon->used_at === null
                    && (!$coupon->is_active || ($coupon->expires_at && $coupon->expires_at->isPast()));
            })
            ->values();

        return view('account.coupons', compact('availableCoupons', 'usedCoupons', 'expiredCoupons'));
    }
}
