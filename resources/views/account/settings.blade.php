@extends('layouts.account')
@section('page_title', 'Settings')
@section('title', 'Account Settings')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">Settings</h2>

<div class="space-y-4">
    <a href="{{ route('account.profile.edit') }}" class="card p-5 flex items-center justify-between hover:border-brand-200 transition-colors">
        <div>
            <p class="font-semibold text-surface-800">Profile Settings</p>
            <p class="text-sm text-surface-500 mt-1">Update personal details, photo, email and phone.</p>
        </div>
        <span class="text-brand-600 text-sm font-semibold">Manage</span>
    </a>

    <a href="{{ route('account.support.index') }}" class="card p-5 flex items-center justify-between hover:border-brand-200 transition-colors">
        <div>
            <p class="font-semibold text-surface-800">Help & Support</p>
            <p class="text-sm text-surface-500 mt-1">Need help with account, orders, refunds, or wallet?</p>
        </div>
        <span class="text-brand-600 text-sm font-semibold">Contact</span>
    </a>
</div>
@endsection
