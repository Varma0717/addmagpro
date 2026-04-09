@extends('layouts.admin')
@section('title', 'Referrals')

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    {{-- Referral Table --}}
    <div class="lg:col-span-2 card overflow-hidden">
        <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.217 10.907a2.25 2.25 0 1 0 0 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186 9.566-5.314m-9.566 7.5 9.566 5.314m0 0a2.25 2.25 0 1 0 3.935 2.186 2.25 2.25 0 0 0-3.935-2.186Zm0-12.814a2.25 2.25 0 1 0 3.933-2.185 2.25 2.25 0 0 0-3.933 2.185Z" />
            </svg>
            <span class="font-semibold text-surface-700">All Referrals</span>
        </div>
        <table class="w-full text-sm">
            <thead>
                <tr>
                    <th class="table-header">Referrer</th>
                    <th class="table-header">Referred User</th>
                    <th class="table-header">Signup Reward</th>
                    <th class="table-header">Purchase Reward</th>
                    <th class="table-header">Date</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-100">
                @forelse($referrals as $ref)
                <tr class="hover:bg-surface-50 transition-colors">
                    <td class="table-cell font-medium">{{ $ref->referrer->name ?? '—' }}</td>
                    <td class="table-cell text-surface-600">{{ $ref->referee->name ?? '—' }}</td>
                    <td class="table-cell">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $ref->signup_reward_given ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-surface-50 text-surface-400 ring-surface-200' }}">
                            {{ $ref->signup_reward_given ? 'Given' : 'Pending' }}
                        </span>
                    </td>
                    <td class="table-cell">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $ref->purchase_reward_given ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-surface-50 text-surface-400 ring-surface-200' }}">
                            {{ $ref->purchase_reward_given ? 'Given' : 'Pending' }}
                        </span>
                    </td>
                    <td class="table-cell text-surface-400">{{ $ref->created_at->format('d M Y') }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="table-cell text-center text-surface-400 py-8">No referrals yet.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
        <div class="px-5 py-4 border-t border-surface-100">{{ $referrals->links() }}</div>
    </div>

    {{-- Referral Settings --}}
    <div class="space-y-4">
        @foreach($settings as $setting)
        <div class="card p-5">
            <div class="flex items-center gap-2 mb-3">
                <svg class="w-4 h-4 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.325.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 0 1 1.37.49l1.296 2.247a1.125 1.125 0 0 1-.26 1.431l-1.003.827c-.293.241-.438.613-.43.992a7.723 7.723 0 0 1 0 .255c-.008.378.137.75.43.991l1.004.827c.424.35.534.955.26 1.43l-1.298 2.247a1.125 1.125 0 0 1-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.47 6.47 0 0 1-.22.128c-.331.183-.581.495-.644.869l-.213 1.281c-.09.543-.56.94-1.11.94h-2.594c-.55 0-1.019-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 0 1-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 0 1-1.369-.49l-1.297-2.247a1.125 1.125 0 0 1 .26-1.431l1.004-.827c.292-.24.437-.613.43-.991a6.932 6.932 0 0 1 0-.255c.007-.38-.138-.751-.43-.992l-1.004-.827a1.125 1.125 0 0 1-.26-1.43l1.297-2.247a1.125 1.125 0 0 1 1.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.086.22-.128.332-.183.582-.495.644-.869l.214-1.28Z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                </svg>
                <h3 class="font-display font-semibold text-surface-700 text-sm capitalize">{{ str_replace('_', ' ', $setting->event) }} Settings</h3>
            </div>
            <form method="POST" action="{{ route('admin.referrals.settings') }}" class="space-y-3">
                @csrf
                <input type="hidden" name="event" value="{{ $setting->event }}">
                <div>
                    <label class="block text-xs font-medium text-surface-600 mb-1">Referrer Reward (₹)</label>
                    <input name="referrer_reward" type="number" step="0.01" min="0" value="{{ $setting->referrer_reward }}" class="input w-full">
                </div>
                <div>
                    <label class="block text-xs font-medium text-surface-600 mb-1">Referee Reward (₹)</label>
                    <input name="referee_reward" type="number" step="0.01" min="0" value="{{ $setting->referee_reward }}" class="input w-full">
                </div>
                <button type="submit" class="btn-primary w-full justify-center">Update</button>
            </form>
        </div>
        @endforeach
    </div>
</div>
@endsection