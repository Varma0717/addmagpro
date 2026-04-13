<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Referral;
use App\Support\ApiResponse;
use Illuminate\Http\Request;

class ReferralController extends Controller
{
    use ApiResponse;

    public function index(Request $request)
    {
        $user = $request->user();
        $perPage = min((int) $request->integer('per_page', 20), 50);
        $baseReferralQuery = Referral::query()->where('referrer_id', $user->id);

        $referrals = (clone $baseReferralQuery)
            ->with('referred:id,name,phone,avatar')
            ->latest()
            ->paginate($perPage)
            ->withQueryString();

        $shareUrl = url('/register?ref=' . $user->referral_code);
        $whatsappUrl = 'https://wa.me/?text=' . urlencode(
            "Join AdMagPro using my referral code {$user->referral_code} and earn rewards!\n{$shareUrl}"
        );

        return $this->success([
            'summary' => [
                'referral_code' => $user->referral_code,
                'total_referrals' => $referrals->total(),
                'active_referrals_count' => (clone $baseReferralQuery)->where('status', 'active')->count(),
                'inactive_referrals_count' => (clone $baseReferralQuery)->where('status', 'pending')->count(),
                'first_purchase_completed_count' => (clone $baseReferralQuery)->where('purchase_reward_given', true)->count(),
                'total_earnings' => round((float) $user->walletTransactions()
                    ->where('type', 'credit')
                    ->where('reference_type', 'referrals')
                    ->sum('amount'), 2),
            ],
            'share' => [
                'share_url' => $shareUrl,
                'whatsapp_url' => $whatsappUrl,
            ],
            'referrals' => $referrals->getCollection()->map(function (Referral $referral): array {
                return [
                    'id' => $referral->id,
                    'status' => $referral->status,
                    'signup_reward_given' => $referral->signup_reward_given,
                    'purchase_reward_given' => $referral->purchase_reward_given,
                    'joined_at' => $referral->created_at,
                    'referred_user' => [
                        'id' => $referral->referred?->id,
                        'name' => $referral->referred?->name,
                        'phone' => $referral->referred?->phone,
                        'avatar_url' => $referral->referred?->avatar ? imageUrl($referral->referred->avatar) : null,
                    ],
                ];
            })->values(),
        ], 'Referrals fetched', 200, [
            'pagination' => [
                'current_page' => $referrals->currentPage(),
                'last_page' => $referrals->lastPage(),
                'per_page' => $referrals->perPage(),
                'total' => $referrals->total(),
            ],
        ]);
    }

    public function team(Request $request)
    {
        $user = $request->user();
        $perPage = min((int) $request->integer('per_page', 20), 50);

        $team = Referral::query()
            ->where('referrer_id', $user->id)
            ->with('referred:id,name,phone,avatar')
            ->latest()
            ->paginate($perPage)
            ->withQueryString();

        return $this->success(
            $team->getCollection()->map(function (Referral $member): array {
                return [
                    'id' => $member->id,
                    'status' => $member->status,
                    'joined_at' => $member->created_at,
                    'member' => [
                        'id' => $member->referred?->id,
                        'name' => $member->referred?->name,
                        'phone' => $member->referred?->phone,
                        'avatar_url' => $member->referred?->avatar ? imageUrl($member->referred->avatar) : null,
                    ],
                ];
            })->values(),
            'Referral team fetched',
            200,
            [
                'pagination' => [
                    'current_page' => $team->currentPage(),
                    'last_page' => $team->lastPage(),
                    'per_page' => $team->perPage(),
                    'total' => $team->total(),
                ],
            ]
        );
    }
}
