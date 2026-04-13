@extends('layouts.account')
@section('page_title', 'Refer & Earn')
@section('title', 'Refer & Earn')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6 flex items-center gap-2">
    <svg class="w-6 h-6 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 0 0 3.741-.479 3 3 0 0 0-4.682-2.72m.94 3.198.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0 1 12 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 0 1 6 18.719m12 0a5.971 5.971 0 0 0-.941-3.197m0 0A5.995 5.995 0 0 0 12 12.75a5.995 5.995 0 0 0-5.058 2.772m0 0a3 3 0 0 0-4.681 2.72 8.986 8.986 0 0 0 3.74.477m.94-3.197a5.971 5.971 0 0 0-.94 3.197M15 6.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm6 3a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Zm-13.5 0a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Z" />
    </svg>
    Refer & Earn
</h2>

<div class="bg-gradient-to-br from-brand-500 via-brand-600 to-pink-500 text-white rounded-2xl p-7 mb-6 shadow-glow relative overflow-hidden">
    <div class="absolute top-0 right-0 w-40 h-40 bg-white/5 rounded-full -translate-y-1/2 translate-x-1/2"></div>
    <p class="text-sm opacity-80 mb-1">Your Referral Code</p>
    <div class="flex items-center gap-3 mb-4">
        <span class="text-3xl font-bold font-mono tracking-widest">{{ auth()->user()->referral_code }}</span>
        <button onclick="copyCode()" class="px-3 py-1.5 bg-white/20 rounded-xl text-sm hover:bg-white/30 transition font-medium backdrop-blur-sm">
            <svg class="w-4 h-4 inline -mt-0.5 mr-1" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.666 3.888A2.25 2.25 0 0 0 13.5 2.25h-3c-1.03 0-1.9.693-2.166 1.638m7.332 0c.055.194.084.4.084.612v0a.75.75 0 0 1-.75.75H9.75a.75.75 0 0 1-.75-.75v0c0-.212.03-.418.084-.612m7.332 0c.646.049 1.288.11 1.927.184 1.1.128 1.907 1.077 1.907 2.185V19.5a2.25 2.25 0 0 1-2.25 2.25H6.75A2.25 2.25 0 0 1 4.5 19.5V6.257c0-1.108.806-2.057 1.907-2.185a48.208 48.208 0 0 1 1.927-.184" />
            </svg>
            Copy
        </button>
    </div>
    <p class="text-sm opacity-70 relative">Share this code and earn rewards when friends sign up and shop!</p>
</div>

<div class="grid grid-cols-2 md:grid-cols-3 gap-4 mb-6">
    <div class="card p-5 text-center">
        <p class="text-3xl font-bold font-display text-brand-600">{{ $referrals->count() }}</p>
        <p class="text-sm text-surface-500 mt-1">Total Referrals</p>
    </div>
    <div class="card p-5 text-center">
        <p class="text-3xl font-bold font-display text-emerald-600">₹{{ number_format($totalEarnings, 2) }}</p>
        <p class="text-sm text-surface-500 mt-1">Total Earned</p>
    </div>
    <div class="card p-5 text-center md:col-span-1 col-span-2">
        <div class="flex flex-col gap-2">
            <a href="{{ $whatsappUrl }}" target="_blank" class="flex items-center justify-center gap-2 py-2.5 bg-emerald-500 text-white rounded-xl text-sm font-semibold hover:bg-emerald-600 transition">
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347z" />
                    <path d="M12 0C5.373 0 0 5.373 0 12c0 2.625.846 5.059 2.284 7.034L.789 23.492a.75.75 0 0 0 .917.918l4.462-1.494A11.945 11.945 0 0 0 12 24c6.627 0 12-5.373 12-12S18.627 0 12 0zm0 22a9.94 9.94 0 0 1-5.39-1.585l-.386-.238-2.65.886.887-2.649-.239-.387A9.96 9.96 0 0 1 2 12C2 6.486 6.486 2 12 2s10 4.486 10 10-4.486 10-10 10z" />
                </svg>
                Share on WhatsApp
            </a>
            <button onclick="copyLink('{{ $shareUrl }}')" class="btn-ghost py-2.5 text-sm justify-center">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.19 8.688a4.5 4.5 0 0 1 1.242 7.244l-4.5 4.5a4.5 4.5 0 0 1-6.364-6.364l1.757-1.757m9.86-3.02a4.5 4.5 0 0 0-1.242-7.244l-4.5-4.5a4.5 4.5 0 0 0-6.364 6.364l1.757 1.757" />
                </svg>
                Copy Link
            </button>
        </div>
    </div>
</div>

<div class="card overflow-hidden mb-6">
    <div class="px-6 py-4 border-b border-surface-100 font-semibold text-surface-700 flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955a1.125 1.125 0 0 1 1.59 0L21.75 12m-3 3v4.5A1.5 1.5 0 0 1 17.25 21h-3.75v-4.5a1.5 1.5 0 0 0-1.5-1.5h0a1.5 1.5 0 0 0-1.5 1.5V21H6.75a1.5 1.5 0 0 1-1.5-1.5V15" />
        </svg>
        Team Structure
    </div>

    @php
        $teamRows = $teamInsights['rows'] ?? collect();
        $levelSummary = $teamInsights['level_summary'] ?? collect();
    @endphp

    @if($teamRows->isEmpty())
        <div class="px-6 py-10 text-center text-surface-400">No team members yet. Invite your first referral to build your structure.</div>
    @else
        <div class="px-6 py-4 border-b border-surface-100 grid gap-3 md:grid-cols-3">
            @foreach($levelSummary as $level)
                <div class="rounded-xl border border-surface-200 p-3 bg-surface-50">
                    <p class="text-sm font-semibold text-surface-700">Level {{ $level['depth'] }}</p>
                    <p class="text-xs text-surface-500 mt-1">Members: {{ $level['members'] }} · Active: {{ $level['active_members'] }} · Inactive: {{ $level['inactive_members'] }}</p>
                    <p class="text-sm font-semibold text-emerald-600 mt-1">Earnings: ₹{{ number_format($level['earnings'], 2) }}</p>
                </div>
            @endforeach
        </div>

        <div class="p-4 space-y-3">
            @foreach($teamRows->groupBy('depth') as $depth => $nodes)
                <details class="rounded-xl border border-surface-200 bg-white" {{ $depth === 1 ? 'open' : '' }}>
                    <summary class="cursor-pointer px-4 py-3 font-semibold text-surface-700 flex items-center justify-between">
                        <span>Level {{ $depth }} Team</span>
                        <span class="text-xs text-surface-400">{{ $nodes->count() }} members</span>
                    </summary>
                    <div class="border-t border-surface-100 px-4 py-3 space-y-3">
                        @foreach($nodes as $node)
                            <div class="rounded-lg border border-surface-100 p-3">
                                <div class="flex items-start justify-between gap-3">
                                    <div>
                                        <p class="font-semibold text-surface-700">{{ $node['member']['name'] ?? 'Member' }}</p>
                                        <p class="text-xs text-surface-400">{{ $node['member']['phone'] ?? 'No phone' }}</p>
                                        <p class="text-xs text-surface-400 mt-1">
                                            Parent ID: {{ $node['parent_id'] }} · Child ID: {{ $node['child_id'] }} · Joined {{ optional($node['joined_at'])->format('d M Y') }}
                                        </p>
                                    </div>
                                    <div class="flex flex-col gap-1 items-end">
                                        <span class="px-2 py-1 rounded-full text-xs font-medium {{ ($node['member']['is_active'] ?? false) ? 'bg-emerald-50 text-emerald-700' : 'bg-rose-50 text-rose-700' }}">
                                            {{ ($node['member']['is_active'] ?? false) ? 'Active Member' : 'Inactive Member' }}
                                        </span>
                                        <span class="px-2 py-1 rounded-full text-xs font-medium {{ ($node['status'] ?? 'pending') === 'active' ? 'bg-brand-50 text-brand-700' : 'bg-amber-50 text-amber-700' }}">
                                            Referral {{ ucfirst($node['status'] ?? 'pending') }}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </details>
            @endforeach
        </div>
    @endif
</div>

<div class="card overflow-hidden">
    <div class="px-6 py-4 border-b border-surface-100 font-semibold text-surface-700 flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" />
        </svg>
        My Referrals
    </div>
    @if($referrals->isEmpty())
    <div class="px-6 py-12 text-center">
        <svg class="w-10 h-10 text-surface-300 mx-auto mb-2" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 0 0 3.741-.479 3 3 0 0 0-4.682-2.72m.94 3.198.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0 1 12 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 0 1 6 18.719m12 0a5.971 5.971 0 0 0-.941-3.197m0 0A5.995 5.995 0 0 0 12 12.75a5.995 5.995 0 0 0-5.058 2.772m0 0a3 3 0 0 0-4.681 2.72 8.986 8.986 0 0 0 3.74.477m.94-3.197a5.971 5.971 0 0 0-.94 3.197M15 6.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm6 3a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Zm-13.5 0a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Z" />
        </svg>
        <p class="text-surface-400">No referrals yet. Share your code!</p>
    </div>
    @else
    <div class="overflow-x-auto">
        <table class="w-full text-sm">
            <thead>
                <tr>
                    <th class="table-header text-left">Friend</th>
                    <th class="table-header text-left">Joined</th>
                    <th class="table-header text-left">Status</th>
                    <th class="table-header text-left">Signup Reward</th>
                    <th class="table-header text-left">Purchase Reward</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-100">
                @foreach($referrals as $ref)
                <tr>
                    <td class="table-cell font-semibold">{{ $ref->referred->name ?? '—' }}</td>
                    <td class="table-cell text-surface-400">{{ $ref->created_at->format('d M Y') }}</td>
                    <td class="table-cell">
                        <span class="px-2.5 py-1 rounded-full text-xs font-medium {{ ($ref->referred?->is_active ?? false) ? 'bg-emerald-50 text-emerald-700 ring-1 ring-emerald-200' : 'bg-rose-50 text-rose-700 ring-1 ring-rose-200' }}">
                            {{ ($ref->referred?->is_active ?? false) ? 'Active' : 'Inactive' }}
                        </span>
                    </td>
                    <td class="table-cell">
                        <span class="px-2.5 py-1 rounded-full text-xs font-medium {{ $ref->signup_reward_given ? 'bg-emerald-50 text-emerald-700 ring-1 ring-emerald-200' : 'bg-surface-100 text-surface-400' }}">
                            @if($ref->signup_reward_given) Given @else Pending @endif
                        </span>
                    </td>
                    <td class="table-cell">
                        <span class="px-2.5 py-1 rounded-full text-xs font-medium {{ $ref->purchase_reward_given ? 'bg-emerald-50 text-emerald-700 ring-1 ring-emerald-200' : 'bg-surface-100 text-surface-400' }}">
                            @if($ref->purchase_reward_given) Given @else Pending @endif
                        </span>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
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
