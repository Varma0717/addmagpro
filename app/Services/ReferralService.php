<?php

namespace App\Services;

use App\Models\Referral;
use App\Models\ReferralSetting;
use App\Models\User;

class ReferralService
{
    public function __construct(private readonly WalletService $walletService) {}

    public function handleSignup(User $newUser): void
    {
        if (!$newUser->referred_by) return;

        $referrer = User::find($newUser->referred_by);
        if (!$referrer) return;

        $referral = Referral::firstOrCreate(
            ['referred_id' => $newUser->id],
            ['referrer_id' => $referrer->id, 'status' => 'active']
        );

        if ($referral->signup_reward_given) return;

        $setting = ReferralSetting::where('event', 'signup')->where('is_active', true)->first();
        if (!$setting) return;

        if ($setting->referrer_amount > 0) {
            $this->walletService->credit($referrer, $setting->referrer_amount, 'Referral signup bonus', 'referrals', $referral->id);
        }
        if ($setting->referee_amount > 0) {
            $this->walletService->credit($newUser, $setting->referee_amount, 'Welcome bonus', 'referrals', $referral->id);
        }

        $referral->update(['signup_reward_given' => true, 'status' => 'active']);
    }

    public function handleFirstPurchase(User $buyer): void
    {
        $referral = Referral::where('referred_id', $buyer->id)
            ->where('purchase_reward_given', false)
            ->first();

        if (!$referral) return;

        $setting = ReferralSetting::where('event', 'first_purchase')->where('is_active', true)->first();
        if (!$setting) return;

        $referrer = User::find($referral->referrer_id);
        if ($referrer && $setting->referrer_amount > 0) {
            $this->walletService->credit($referrer, $setting->referrer_amount, 'Referral purchase bonus', 'referrals', $referral->id);
        }

        $referral->update(['purchase_reward_given' => true]);
    }
}
