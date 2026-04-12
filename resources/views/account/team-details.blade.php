@extends('layouts.account')
@section('page_title', 'Team Details')
@section('title', 'Team Details')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">Team Details</h2>

<div class="card overflow-hidden">
    <div class="px-5 py-3 border-b border-surface-100 font-semibold">My Team Members</div>
    @if($teamMembers->isEmpty())
    <div class="p-5 text-surface-500">No team members yet.</div>
    @else
    <div class="overflow-x-auto">
        <table class="w-full text-sm">
            <thead>
                <tr>
                    <th class="table-header text-left">Name</th>
                    <th class="table-header text-left">Phone</th>
                    <th class="table-header text-left">Status</th>
                    <th class="table-header text-left">Joined</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-100">
                @foreach($teamMembers as $member)
                <tr>
                    <td class="table-cell">{{ $member->referred->name ?? '—' }}</td>
                    <td class="table-cell">{{ $member->referred->phone ?? '—' }}</td>
                    <td class="table-cell">{{ ucfirst($member->status) }}</td>
                    <td class="table-cell">{{ $member->created_at->format('d M Y') }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="px-5 py-3 border-t border-surface-100">{{ $teamMembers->links() }}</div>
    @endif
</div>
@endsection