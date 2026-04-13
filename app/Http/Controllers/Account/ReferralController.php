<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\Referral;
use Illuminate\Support\Facades\DB;

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

        $depth = 3;
        $teamRows = collect();
        $parentIds = collect([$user->id]);

        for ($level = 1; $level <= $depth; $level++) {
            $levelRows = Referral::query()
                ->whereIn('referrer_id', $parentIds->all())
                ->with('referred')
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
                    'joined_at' => $member->created_at,
                    'signup_reward_given' => $member->signup_reward_given,
                    'purchase_reward_given' => $member->purchase_reward_given,
                    'parent_user_id' => $member->referrer_id,
                    'child_user_id' => $member->referred_id,
                    'member' => $member->referred,
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

        $levelStats = collect(range(1, $depth))
            ->mapWithKeys(function (int $level) use ($teamRows): array {
                $rows = $teamRows->where('level', $level);
                return [
                    'L' . $level => [
                        'level' => $level,
                        'count' => $rows->count(),
                        'earnings' => round((float) $rows->sum('earning'), 2),
                    ],
                ];
            });

        $teamByParent = $teamRows
            ->groupBy('parent_user_id')
            ->map(fn ($rows) => $rows->sortBy('joined_at')->values());

        return view('account.referrals', compact(
            'user',
            'referrals',
            'totalEarnings',
            'shareUrl',
            'whatsappUrl',
            'levelStats',
            'teamRows',
            'teamByParent'
        ));
    }
}
