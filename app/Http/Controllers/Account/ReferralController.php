<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\Referral;
use App\Models\User;
use Illuminate\Support\Collection;

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

        $teamInsights = $this->buildTeamInsights($user);

        return view('account.referrals', compact(
            'user',
            'referrals',
            'totalEarnings',
            'shareUrl',
            'whatsappUrl',
            'teamInsights'
        ));
    }

    private function buildTeamInsights(User $user): array
    {
        $teamStructure = collect();
        $frontier = collect([$user->id]);
        $depth = 1;

        while ($frontier->isNotEmpty()) {
            $batch = Referral::query()
                ->whereIn('referrer_id', $frontier->all())
                ->with('referred:id,name,phone,avatar,is_active')
                ->orderBy('created_at')
                ->get();

            if ($batch->isEmpty()) {
                break;
            }

            $teamStructure = $teamStructure->merge(
                $batch->map(function (Referral $referral) use ($depth): array {
                    return [
                        'id' => $referral->id,
                        'parent_id' => $referral->referrer_id,
                        'child_id' => $referral->referred_id,
                        'depth' => $depth,
                        'status' => $referral->status,
                        'signup_reward_given' => $referral->signup_reward_given,
                        'purchase_reward_given' => $referral->purchase_reward_given,
                        'joined_at' => $referral->created_at,
                        'member' => [
                            'id' => $referral->referred?->id,
                            'name' => $referral->referred?->name,
                            'phone' => $referral->referred?->phone,
                            'is_active' => (bool) ($referral->referred?->is_active ?? false),
                            'avatar_url' => $referral->referred?->avatar ? imageUrl($referral->referred->avatar) : null,
                        ],
                    ];
                })
            );

            $frontier = $batch->pluck('referred_id')->filter()->unique()->values();
            $depth++;
        }

        return [
            'rows' => $teamStructure->values(),
            'level_summary' => $this->buildLevelSummary($user, $teamStructure),
        ];
    }

    private function buildLevelSummary(User $user, Collection $teamStructure): Collection
    {
        if ($teamStructure->isEmpty()) {
            return collect();
        }

        $creditByReferralId = $user->walletTransactions()
            ->where('type', 'credit')
            ->where('reference_type', 'referrals')
            ->whereNotNull('reference_id')
            ->selectRaw('reference_id, SUM(amount) as total_amount')
            ->groupBy('reference_id')
            ->pluck('total_amount', 'reference_id');

        return $teamStructure
            ->groupBy('depth')
            ->sortKeys()
            ->map(function (Collection $levelRows, int $depth) use ($creditByReferralId): array {
                $members = $levelRows->count();
                $active = $levelRows->where('member.is_active', true)->count();
                $inactive = $members - $active;
                $earnings = $levelRows->sum(
                    fn (array $row): float => (float) ($creditByReferralId[$row['id']] ?? 0)
                );

                return [
                    'depth' => $depth,
                    'members' => $members,
                    'active_members' => $active,
                    'inactive_members' => $inactive,
                    'earnings' => round($earnings, 2),
                ];
            });
    }
}
