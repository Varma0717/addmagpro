@extends('layouts.admin')
@section('title', 'Users')

@section('content')
<div class="bg-white rounded-xl shadow-sm border overflow-hidden">
    <div class="px-5 py-4 border-b flex items-center justify-between">
        <h2 class="font-semibold text-gray-700">All Users</h2>
        <form method="GET" class="flex gap-2">
            <input name="search" value="{{ request('search') }}" placeholder="Search name or email…"
                class="border border-gray-300 rounded-lg px-3 py-1.5 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
            <button class="px-4 py-1.5 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">Search</button>
        </form>
    </div>
    <div class="overflow-x-auto">
        <table class="w-full text-sm">
            <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
                <tr>
                    <th class="px-4 py-3 text-left">ID</th>
                    <th class="px-4 py-3 text-left">Name</th>
                    <th class="px-4 py-3 text-left">Email</th>
                    <th class="px-4 py-3 text-left">Phone</th>
                    <th class="px-4 py-3 text-left">Role</th>
                    <th class="px-4 py-3 text-left">Wallet</th>
                    <th class="px-4 py-3 text-left">Status</th>
                    <th class="px-4 py-3 text-left">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y">
                @forelse($users as $user)
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-3 text-gray-400">{{ $user->id }}</td>
                    <td class="px-4 py-3 font-medium">
                        <a href="{{ route('admin.users.show', $user) }}" class="text-orange-600 hover:underline">{{ $user->name }}</a>
                    </td>
                    <td class="px-4 py-3 text-gray-500">{{ $user->email }}</td>
                    <td class="px-4 py-3 text-gray-500">{{ $user->phone ?? '—' }}</td>
                    <td class="px-4 py-3">
                        <span class="px-2 py-1 rounded-full text-xs {{ $user->role === 'admin' ? 'bg-purple-100 text-purple-700' : 'bg-gray-100 text-gray-600' }}">
                            {{ ucfirst($user->role) }}
                        </span>
                    </td>
                    <td class="px-4 py-3 font-medium">₹{{ number_format($user->wallet_balance, 2) }}</td>
                    <td class="px-4 py-3">
                        <span class="px-2 py-1 rounded-full text-xs {{ $user->is_active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                            {{ $user->is_active ? 'Active' : 'Inactive' }}
                        </span>
                    </td>
                    <td class="px-4 py-3">
                        <form method="POST" action="{{ route('admin.users.toggle', $user) }}">
                            @csrf
                            <button class="text-xs px-3 py-1 rounded border {{ $user->is_active ? 'border-red-400 text-red-600 hover:bg-red-50' : 'border-green-400 text-green-600 hover:bg-green-50' }}">
                                {{ $user->is_active ? 'Deactivate' : 'Activate' }}
                            </button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="8" class="px-4 py-8 text-center text-gray-400">No users found.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="px-5 py-4 border-t">
        {{ $users->withQueryString()->links() }}
    </div>
</div>
@endsection