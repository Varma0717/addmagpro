<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Referral;
use App\Models\ReferralSetting;
use Illuminate\Http\Request;

class ReferralController extends Controller
{
    public function index(Request $request)
    {
        $referrals = Referral::with('referrer', 'referred')
            ->latest()
            ->paginate(30);

        $settings = ReferralSetting::all()->keyBy('event');

        return view('admin.referrals.index', compact('referrals', 'settings'));
    }

    public function updateSettings(Request $request)
    {
        $request->validate([
            'settings'                          => 'required|array',
            'settings.*.referrer_amount'        => 'required|numeric|min:0',
            'settings.*.referee_amount'         => 'required|numeric|min:0',
            'settings.*.is_active'              => 'boolean',
        ]);

        foreach ($request->settings as $event => $values) {
            ReferralSetting::where('event', $event)->update([
                'referrer_amount' => $values['referrer_amount'],
                'referee_amount'  => $values['referee_amount'],
                'is_active'       => isset($values['is_active']),
            ]);
        }

        return back()->with('success', 'Referral settings updated.');
    }
}
