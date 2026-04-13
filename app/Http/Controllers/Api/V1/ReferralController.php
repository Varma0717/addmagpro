<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Referral;
use App\Support\ApiResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ReferralController extends Controller
{
    use ApiResponse;

    public function index(Request $request)
    {
        $user = $request->user();
        $perPage = min((int) $request->integer('per_page', 20), 50);

        $referrals = Referral::query()
            ->where('referrer_id', $user->id)
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
        $depth = min(max((int) $request->integer('depth', 3), 1), 5);

        $teamRows = collect();
        $parentIds = collect([$user->id]);

        for ($level = 1; $level <= $depth; $level++) {
            $levelRows = Referral::query()
                ->whereIn('referrer_id', $parentIds->all())
                ->with('referred:id,name,phone,avatar')
                ->latest()
                ->get();

            if ($levelRows->isEmpty()) {
                break;
            }

            $teamRows = $teamRows->merge($levelRows->map(function (Referral $member) use ($level): array {
                return [
                    'id' => $member->id,
                    'level' => $level,
                    'status' => $member->status,
                    'signup_reward_given' => $member->signup_reward_given,
                    'purchase_reward_given' => $member->purchase_reward_given,
                    'joined_at' => $member->created_at,
                    'parent_user_id' => $member->referrer_id,
                    'child_user_id' => $member->referred_id,
                    'member' => [
                        'id' => $member->referred?->id,
                        'name' => $member->referred?->name,
                        'phone' => $member->referred?->phone,
                        'avatar_url' => $member->referred?->avatar ? imageUrl($member->referred->avatar) : null,
                    ],
                ];
            }));

            $parentIds = $levelRows->pluck('referred_id')->filter()->unique()->values();

            if ($parentIds->isEmpty()) {
                break;
            }
        }

        $referralIds = $teamRows->pluck('id')->all();
        $referralEarningMap = empty($referralIds)
            ? []
            : DB::table('wallet_transactions')
                ->select('reference_id', DB::raw('SUM(amount) as total'))
                ->where('user_id', $user->id)
                ->where('type', 'credit')
                ->where('reference_type', 'referrals')
                ->whereIn('reference_id', $referralIds)
                ->groupBy('reference_id')
                ->pluck('total', 'reference_id')
                ->map(fn ($value) => round((float) $value, 2))
                ->all();

        $teamRows = $teamRows->map(function (array $row) use ($referralEarningMap): array {
            $row['earning'] = $referralEarningMap[$row['id']] ?? 0.0;
            return $row;
        })->values();

        $levels = collect(range(1, $depth))
            ->map(function (int $level) use ($teamRows): array {
                $rows = $teamRows->where('level', $level);
                return [
                    'level' => $level,
                    'count' => $rows->count(),
                    'earnings' => round((float) $rows->sum('earning'), 2),
                ];
            })
            ->values();

        $parentChildMap = $teamRows
            ->groupBy(fn (array $row) => (string) $row['parent_user_id'])
            ->map(fn ($rows) => $rows->pluck('child_user_id')->values())
            ->all();

        return $this->success([
            'depth' => $depth,
            'levels' => $levels,
            'total_team' => $teamRows->count(),
            'members' => $teamRows,
            'parent_child_map' => $parentChildMap,
        ], 'Referral team fetched');
    }
}
