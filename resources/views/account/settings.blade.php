@extends('layouts.account')
@section('page_title', 'Account Settings')
@section('title', 'Account Settings')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">Account Settings</h2>

<form method="POST" action="{{ route('account.settings.update') }}" class="space-y-6">
    @csrf

    <section class="card p-5">
        <h3 class="font-semibold text-surface-800 mb-4">Notification Preferences</h3>
        <div class="grid sm:grid-cols-2 gap-3">
            @foreach([
                'notify_email' => 'Email notifications',
                'notify_sms' => 'SMS notifications',
                'notify_push' => 'Push notifications',
                'marketing_alerts' => 'Marketing offers',
            ] as $key => $label)
                <label class="flex items-center justify-between rounded-xl border border-surface-200 px-3 py-2.5">
                    <span class="text-sm text-surface-700">{{ $label }}</span>
                    <input type="checkbox" name="{{ $key }}" value="1" class="rounded border-surface-300 text-brand-600 focus:ring-brand-500" {{ !empty($settings[$key]) ? 'checked' : '' }}>
                </label>
            @endforeach
        </div>
    </section>

    <section class="card p-5">
        <h3 class="font-semibold text-surface-800 mb-4">Security &amp; Profile Toggles</h3>
        <div class="grid sm:grid-cols-2 gap-3">
            @foreach([
                'two_factor_auth' => 'Two-factor authentication',
                'login_alerts' => 'Login alerts',
                'profile_public' => 'Public profile visibility',
                'show_activity_status' => 'Show activity status',
            ] as $key => $label)
                <label class="flex items-center justify-between rounded-xl border border-surface-200 px-3 py-2.5">
                    <span class="text-sm text-surface-700">{{ $label }}</span>
                    <input type="checkbox" name="{{ $key }}" value="1" class="rounded border-surface-300 text-brand-600 focus:ring-brand-500" {{ !empty($settings[$key]) ? 'checked' : '' }}>
                </label>
            @endforeach
        </div>
    </section>

    <div>
        <button class="btn-primary">Save Settings</button>
    </div>
</form>
@endsection
