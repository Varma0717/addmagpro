@extends('layouts.account')
@section('page_title', 'Support')
@section('title', 'Support')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">Support</h2>

<div class="card p-6 space-y-4">
    <p class="text-surface-600">Our support team is available to help with account access, payments, orders and referral issues.</p>
    <div class="space-y-2 text-sm">
        <p><span class="font-semibold text-surface-700">Contact page:</span> <a class="text-brand-600 hover:underline" href="{{ route('pages.contact') }}">{{ route('pages.contact') }}</a></p>
        <p><span class="font-semibold text-surface-700">Response time:</span> Within 24 business hours</p>
    </div>
</div>
@endsection
