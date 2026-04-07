@extends('layouts.admin')
@section('title', 'Referrals')

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    <!-- Referral tree table -->
    <div class="lg:col-span-2 bg-white rounded-xl shadow-sm border overflow-hidden">
        <div class="px-5 py-4 border-b font-semibold text-gray-700">All Referrals</div>
        <table class="w-full text-sm">
            <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                <tr>
                    <th class="px-4 py-3 text-left">Referrer</th>
                    <th class="px-4 py-3 text-left">Referred User</th>
                    <th class="px-4 py-3 text-left">Signup Reward</th>
                    <th class="px-4 py-3 text-left">Purchase Reward</th>
                    <th class="px-4 py-3 text-left">Date</th>
                </tr>
            </thead>
            <tbody class="divide-y">
                @forelse($referrals as $ref)
                <tr>
                    <td class="px-4 py-3 font-medium">{{ $ref->referrer->name ?? '—' }}</td>
                    <td class="px-4 py-3 text-gray-600">{{ $ref->referee->name ?? '—' }}</td>
                    <td class="px-4 py-3">
                        <span class="px-2 py-1 rounded-full text-xs {{ $ref->signup_reward_given ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-400' }}">
                            {{ $ref->signup_reward_given ? 'Given' : 'Pending' }}
                        </span>
                    </td>
                    <td class="px-4 py-3">
                        <span class="px-2 py-1 rounded-full text-xs {{ $ref->purchase_reward_given ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-400' }}">
                            {{ $ref->purchase_reward_given ? 'Given' : 'Pending' }}
                        </span>
                    </td>
                    <td class="px-4 py-3 text-gray-400">{{ $ref->created_at->format('d M Y') }}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="px-4 py-8 text-center text-gray-400">No referrals yet.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
        <div class="px-5 py-4 border-t">{{ $referrals->links() }}</div>
    </div>

    <!-- Settings -->
    <div class="space-y-4">
        @foreach($settings as $setting)
        <div class="bg-white rounded-xl shadow-sm border p-5">
            <h3 class="font-semibold text-gray-700 mb-3 text-sm capitalize">{{ str_replace('_', ' ', $setting->event) }} Settings</h3>
            <form method="POST" action="{{ route('admin.referrals.settings') }}" class="space-y-3">
                @csrf
                <input type="hidden" name="event" value="{{ $setting->event }}">
                <div>
                    <label class="block text-xs font-medium text-gray-600 mb-1">Referrer Reward (₹)</label>
                    <input name="referrer_reward" type="number" step="0.01" min="0" value="{{ $setting->referrer_reward }}"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-xs font-medium text-gray-600 mb-1">Referee Reward (₹)</label>
                    <input name="referee_reward" type="number" step="0.01" min="0" value="{{ $setting->referee_reward }}"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <button type="submit" class="w-full py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">Update</button>
            </form>
        </div>
        @endforeach
    </div>
</div>
@endsection