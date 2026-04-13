<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class SettingsController extends Controller
{
    public function edit(Request $request)
    {
        $settings = $this->settingsForUser($request->user()->id);

        return view('account.settings', compact('settings'));
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'notify_email' => 'nullable|boolean',
            'notify_sms' => 'nullable|boolean',
            'notify_push' => 'nullable|boolean',
            'marketing_alerts' => 'nullable|boolean',
            'profile_public' => 'nullable|boolean',
            'show_activity_status' => 'nullable|boolean',
            'two_factor_auth' => 'nullable|boolean',
            'login_alerts' => 'nullable|boolean',
        ]);

        $settings = [
            'notify_email' => (bool) ($data['notify_email'] ?? false),
            'notify_sms' => (bool) ($data['notify_sms'] ?? false),
            'notify_push' => (bool) ($data['notify_push'] ?? false),
            'marketing_alerts' => (bool) ($data['marketing_alerts'] ?? false),
            'profile_public' => (bool) ($data['profile_public'] ?? false),
            'show_activity_status' => (bool) ($data['show_activity_status'] ?? false),
            'two_factor_auth' => (bool) ($data['two_factor_auth'] ?? false),
            'login_alerts' => (bool) ($data['login_alerts'] ?? false),
        ];

        Cache::forever($this->cacheKey($request->user()->id), $settings);

        return back()->with('success', 'Settings updated.');
    }

    private function settingsForUser(int $userId): array
    {
        return Cache::get($this->cacheKey($userId), [
            'notify_email' => true,
            'notify_sms' => false,
            'notify_push' => true,
            'marketing_alerts' => false,
            'profile_public' => false,
            'show_activity_status' => true,
            'two_factor_auth' => false,
            'login_alerts' => true,
        ]);
    }

    private function cacheKey(int $userId): string
    {
        return "account_settings_{$userId}";
    }
}
