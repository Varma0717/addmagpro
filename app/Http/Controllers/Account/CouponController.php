<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use Illuminate\Http\Request;

class CouponController extends Controller
{
    public function index()
    {
        $coupons = auth()->user()
            ->coupons()
            ->orderByDesc('user_coupons.created_at')
            ->paginate(20);

        return view('account.coupons.index', compact('coupons'));
    }

    public function store(Request $request)
    {
        $user = $request->user();

        $coupon = Coupon::query()
            ->where('is_active', true)
            ->where(function ($q) {
                $q->whereNull('expires_at')->orWhere('expires_at', '>', now());
            })
            ->inRandomOrder()
            ->first();

        if (!$coupon) {
            return back()->with('error', 'No active coupons available right now.');
        }

        $user->coupons()->syncWithoutDetaching([$coupon->id]);

        return back()->with('success', 'Coupon generated successfully.');
    }
}
