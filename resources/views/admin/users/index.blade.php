@extends('layouts.admin')
@section('title', 'Users')

@section('content')
<div class="card overflow-hidden">
    <div class="px-5 py-4 border-b border-surface-100 flex items-center justify-between">
        <div class="flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z"/></svg>
            <h2 class="font-semibold text-surface-700">All Users</h2>
        </div>
        <form method="GET" class="flex gap-2">
            <input name="search" value="{{ request('search') }}" placeholder="Search name or email…" class="input py-1.5">
            <button class="btn-primary btn-sm">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z"/></svg>
                Search
            </button>
        </form>
    </div>
    <div class="overflow-x-auto">
        <table class="w-full text-sm">
            <thead>
                <tr>
                    <th class="table-header">ID</th>
                    <th class="table-header">Name</th>
                    <th class="table-header">Email</th>
                    <th class="table-header">Phone</th>
                    <th class="table-header">Role</th>
                    <th class="table-header">Wallet</th>
                    <th class="table-header">Status</th>
                    <th class="table-header">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-100">
                @forelse($users as $user)
                <tr class="hover:bg-surface-50 transition-colors">
                    <td class="table-cell text-surface-400">{{ $user->id }}</td>
                    <td class="table-cell font-medium">
                        <a href="{{ route('admin.users.show', $user) }}" class="text-brand-600 hover:text-brand-700">{{ $user->name }}</a>
                    </td>
                    <td class="table-cell text-surface-500">{{ $user->email }}</td>
                    <td class="table-cell text-surface-500">{{ $user->phone ?? '—' }}</td>
                    <td class="table-cell">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $user->role === 'admin' ? 'bg-violet-50 text-violet-700 ring-violet-200' : 'bg-surface-50 text-surface-600 ring-surface-200' }}">
                            {{ ucfirst($user->role) }}
                        </span>
                    </td>
                    <td class="table-cell font-semibold">₹{{ number_format($user->wallet_balance, 2) }}</td>
                    <td class="table-cell">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $user->is_active ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-red-50 text-red-700 ring-red-200' }}">
                            {{ $user->is_active ? 'Active' : 'Inactive' }}
                        </span>
                    </td>
                    <td class="table-cell">
                        <form method="POST" action="{{ route('admin.users.toggle', $user) }}">
                            @csrf
                            <button class="{{ $user->is_active ? 'btn-danger' : 'btn-secondary' }} btn-sm">
                                {{ $user->is_active ? 'Deactivate' : 'Activate' }}
                            </button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="8" class="table-cell text-center text-surface-400 py-8">No users found.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="px-5 py-4 border-t border-surface-100">
        {{ $users->withQueryString()->links() }}
    </div>
</div>
@endsection