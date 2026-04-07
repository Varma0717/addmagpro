@extends('layouts.account')
@section('page_title', 'Refer & Earn')
@section('title', 'Refer & Earn')

@section('account_content')
<h2 class="text-xl font-bold text-gray-800 mb-6">Refer & Earn</h2>

<!-- Share card -->
<div class="bg-gradient-to-r from-orange-500 to-pink-500 text-white rounded-2xl p-6 mb-6">
    <p class="text-sm opacity-80 mb-1">Your Referral Code</p>
    <div class="flex items-center gap-3 mb-4">
        <span class="text-3xl font-bold font-mono tracking-widest">{{ auth()->user()->referral_code }}</span>
        <button onclick="copyCode()" class="px-3 py-1 bg-white/20 rounded-lg text-sm hover:bg-white/30">Copy</button>
    </div>
    <p class="text-sm opacity-70">Share this code and earn rewards when friends sign up and shop!</p>
</div>

<!-- Stats -->
<div class="grid grid-cols-2 md:grid-cols-3 gap-4 mb-6">
    <div class="bg-white rounded-xl border p-4 text-center">
        <p class="text-2xl font-bold text-orange-600">{{ $referrals->count() }}</p>
        <p class="text-sm text-gray-500 mt-1">Total Referrals</p>
    </div>
    <div class="bg-white rounded-xl border p-4 text-center">
        <p class="text-2xl font-bold text-green-600">₹{{ number_format($totalEarnings, 2) }}</p>
        <p class="text-sm text-gray-500 mt-1">Total Earned</p>
    </div>
    <div class="bg-white rounded-xl border p-4 text-center md:col-span-1 col-span-2">
        <div class="flex flex-col gap-2">
            <a href="{{ $whatsappUrl }}" target="_blank"
                class="block py-2 bg-green-500 text-white rounded-xl text-sm font-medium hover:bg-green-600">
                Share on WhatsApp
            </a>
            <button onclick="copyLink('{{ $shareUrl }}')" class="py-2 border border-gray-300 rounded-xl text-sm text-gray-600 hover:bg-gray-50">
                Copy Link
            </button>
        </div>
    </div>
</div>

<!-- Referrals list -->
<div class="bg-white rounded-xl border overflow-hidden">
    <div class="px-5 py-4 border-b font-semibold text-gray-700">My Referrals</div>
    @if($referrals->isEmpty())
    <p class="px-5 py-8 text-center text-gray-400">No referrals yet. Share your code!</p>
    @else
    <table class="w-full text-sm">
        <thead class="bg-gray-50 text-xs text-gray-500 uppercase">
            <tr>
                <th class="px-4 py-3 text-left">Friend</th>
                <th class="px-4 py-3 text-left">Joined</th>
                <th class="px-4 py-3 text-left">Signup Reward</th>
                <th class="px-4 py-3 text-left">Purchase Reward</th>
            </tr>
        </thead>
        <tbody class="divide-y">
            @foreach($referrals as $ref)
            <tr>
                <td class="px-4 py-3 font-medium">{{ $ref->referred->name ?? '—' }}</td>
                <td class="px-4 py-3 text-gray-400">{{ $ref->created_at->format('d M Y') }}</td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs {{ $ref->signup_reward_given ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-400' }}">
                        {{ $ref->signup_reward_given ? '✓ Given' : 'Pending' }}
                    </span>
                </td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs {{ $ref->purchase_reward_given ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-400' }}">
                        {{ $ref->purchase_reward_given ? '✓ Given' : 'Pending' }}
                    </span>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    @endif
</div>
@endsection

@push('scripts')
<script>
    function copyCode() {
        navigator.clipboard.writeText('{{ auth()->user()->referral_code }}');
        alert('Referral code copied!');
    }

    function copyLink(url) {
        navigator.clipboard.writeText(url);
        alert('Link copied!');
    }
</script>
@endpush