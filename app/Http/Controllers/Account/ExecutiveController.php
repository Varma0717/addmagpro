<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use App\Models\DiscountStorePurchase;
use App\Models\DiscountVendor;
use App\Models\Referral;
use App\Models\UserWithdrawRequest;
use App\Models\WalletTransaction;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ExecutiveController extends Controller
{
    public function dashboard()
    {
        $user = auth()->user();

        $myCommission = (float) WalletTransaction::query()
            ->where('user_id', $user->id)
            ->where('type', 'credit')
            ->where('reference_type', 'referrals')
            ->sum('amount');

        $stats = [
            'my_commission' => $myCommission,
            'back2back_value' => 0,
            'back2back_income' => 0,
            'discount_cashback' => 0,
            'deposite_wallet' => (float) $user->wallet_balance,
            'cummulative' => (float) $user->wallet_balance,
        ];

        $memberReferralLink = url('/service_user_registration/' . ($user->phone ?: $user->id));
        $vendorReferralLink = url('/vendor_register/' . ($user->phone ?: $user->id));

        $withdrawRequests = UserWithdrawRequest::query()
            ->where('user_id', $user->id)
            ->latest()
            ->take(5)
            ->get();

        return view('account.dashboard', compact('stats', 'memberReferralLink', 'vendorReferralLink', 'withdrawRequests'));
    }

    public function generateCoupons()
    {
        $user = auth()->user();

        $myCoupons = $user->coupons()
            ->orderByDesc('user_coupons.created_at')
            ->get();

        return view('account.generate-coupons', compact('myCoupons'));
    }

    public function storeGeneratedCoupon(Request $request)
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

    public function teamDetails()
    {
        $user = auth()->user();

        $teamMembers = Referral::query()
            ->where('referrer_id', $user->id)
            ->with('referred')
            ->latest()
            ->paginate(20);

        return view('account.team-details', compact('teamMembers'));
    }

    public function discountShopOrders()
    {
        $orders = DiscountStorePurchase::query()
            ->where('customer_id', auth()->id())
            ->latest()
            ->paginate(20);

        return view('account.discount-shop-orders', compact('orders'));
    }

    public function discountStoreCustomerPayments()
    {
        $vendorIds = DiscountVendor::query()
            ->where('user_id', auth()->id())
            ->pluck('id');

        $payments = DiscountStorePurchase::query()
            ->whereIn('vendor_id', $vendorIds)
            ->latest()
            ->paginate(20);

        return view('account.discount-customer-payments', compact('payments'));
    }

    public function requestWithdraw(Request $request)
    {
        $user = $request->user();

        $data = $request->validate([
            'amount' => ['required', 'numeric', 'min:100'],
            'remarks' => ['nullable', 'string', 'max:255'],
        ]);

        if ((float) $data['amount'] > (float) $user->wallet_balance) {
            return back()->with('error', 'Withdraw amount cannot exceed wallet balance.');
        }

        UserWithdrawRequest::query()->create([
            'user_id' => $user->id,
            'request_no' => 'WDR-' . strtoupper(Str::random(8)),
            'amount' => $data['amount'],
            'status' => 'pending',
            'remarks' => $data['remarks'] ?? null,
        ]);

        return back()->with('success', 'Withdraw request submitted successfully.');
    }
}
