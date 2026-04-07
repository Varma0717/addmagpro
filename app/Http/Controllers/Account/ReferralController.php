<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\Referral;

class ReferralController extends Controller
{
    public function index()
    {
        $user      = auth()->user();
        $referrals = Referral::where('referrer_id', $user->id)
            ->with('referred')
            ->latest()
            ->paginate(20);

        $totalEarnings = $user->walletTransactions()
            ->where('type', 'credit')
            ->where('reference_type', 'referrals')
            ->sum('amount');

        $shareUrl  = url('/register?ref=' . $user->referral_code);
        $whatsappUrl = 'https://wa.me/?text=' . urlencode("Join AdMagPro using my referral code *{$user->referral_code}* and earn rewards! \n{$shareUrl}");

        return view('account.referrals', compact('user', 'referrals', 'totalEarnings', 'shareUrl', 'whatsappUrl'));
    }
}
