<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Referral;
use App\Models\User;
use App\Support\ApiResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class ReferralController extends Controller
{
    use ApiResponse;

    public function index(Request $request)
    {
        $user = $request->user();
        $perPage = min((int) $request->integer('per_page', 20), 50);

        $referrals = Referral::query()
            ->where('referrer_id', $user->id)
            ->with('referred:id,name,phone,avatar,is_active')
            ->latest()
            ->paginate($perPage)
            ->withQueryString();

        $shareUrl = url('/register?ref=' . $user->referral_code);
        $whatsappUrl = 'https://wa.me/?text=' . urlencode(
            "Join AdMagPro using my referral code {$user->referral_code} and earn rewards!\n{$shareUrl}"
        );
        $activeReferrals = Referral::query()
            ->where('referrer_id', $user->id)
            ->where('status', 'active')
            ->count();
        $teamStructure = $this->buildTeamStructure($user->id);

        $teamInsights = $this->buildTeamInsights($user);

        return $this->success([
            'summary' => [
                'referral_code' => $user->referral_code,
                'total_referrals' => $referrals->total(),
                'active_referrals' => $activeReferrals,
                'inactive_referrals' => max($referrals->total() - $activeReferrals, 0),
                'total_earnings' => round((float) $user->walletTransactions()
                    ->where('type', 'credit')
                    ->where('reference_type', 'referrals')
                    ->sum('amount'), 2),
                'team_structure' => $teamStructure,
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
                        'is_active' => (bool) ($referral->referred?->is_active ?? false),
                        'avatar_url' => $referral->referred?->avatar ? imageUrl($referral->referred->avatar) : null,
                    ],
                    'team' => [
                        'parent_id' => $referral->referrer_id,
                        'child_id' => $referral->referred_id,
                        'depth' => 1,
                    ],
                ];
            })->values(),
            'team_structure' => $teamInsights['team_structure'],
            'level_summary' => $teamInsights['level_summary'],
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
        $depth = min(max((int) $request->integer('depth', 3), 1), 5);

        $teamInsights = $this->buildTeamInsights($user);

        $teamStructure = collect($teamInsights['team_structure']);
        $levelSummary = $teamInsights['level_summary'];

        return $this->success([
            'team_structure' => $teamStructure->values(),
            'level_summary' => $levelSummary,
            'depth' => $depth,
            'total_team' => $teamStructure->count(),
        ], 'Referral team fetched');
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
            'team_structure' => $teamStructure->values(),
            'level_summary' => $this->buildLevelSummary($user, $teamStructure),
        ];
    }

    private function buildLevelSummary(User $user, Collection $teamStructure): array
    {
        if ($teamStructure->isEmpty()) {
            return [];
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
                $memberCount = $levelRows->count();
                $activeCount = $levelRows->where('member.is_active', true)->count();
                $inactiveCount = $memberCount - $activeCount;
                $earnings = $levelRows->sum(
                    fn(array $row): float => (float) ($creditByReferralId[$row['id']] ?? 0)
                );

                return [
                    'depth' => $depth,
                    'members' => $memberCount,
                    'active_members' => $activeCount,
                    'inactive_members' => $inactiveCount,
                    'earnings' => round($earnings, 2),
                ];
            })
            ->values()
            ->all();
    }
}
