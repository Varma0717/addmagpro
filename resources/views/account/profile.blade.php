@extends('layouts.account')
@section('page_title', 'Edit Profile')
@section('title', 'My Profile')

@section('account_content')
<h2 class="text-xl font-bold text-gray-800 mb-6">Edit Profile</h2>

<div class="bg-white rounded-xl border p-6 max-w-lg">
    <form method="POST" action="{{ route('account.profile.update') }}" enctype="multipart/form-data" class="space-y-5">
        @csrf

        <!-- Avatar -->
        <div class="flex items-center gap-4">
            @if(auth()->user()->avatar)
            <img src="{{ Storage::url(auth()->user()->avatar) }}" class="w-16 h-16 rounded-full object-cover">
            @else
            <div class="w-16 h-16 rounded-full bg-orange-100 text-orange-600 font-bold text-2xl flex items-center justify-center">
                {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
            </div>
            @endif
            <div>
                <label class="text-sm font-medium text-gray-700 block mb-1">Profile Photo</label>
                <input type="file" name="avatar" accept="image/*"
                    class="text-sm text-gray-600 file:mr-3 file:py-1 file:px-3 file:rounded file:border-0 file:text-sm file:bg-orange-50 file:text-orange-700">
            </div>
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
            <input name="name" value="{{ old('name', auth()->user()->name) }}" required
                class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
            @error('name')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Phone</label>
            <input name="phone" value="{{ old('phone', auth()->user()->phone) }}"
                class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input value="{{ auth()->user()->email }}" disabled
                class="w-full border border-gray-200 bg-gray-50 rounded-lg px-3 py-2 text-sm text-gray-400 cursor-not-allowed">
        </div>

        <hr>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">New Password (leave blank to keep current)</label>
            <input type="password" name="password"
                class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Confirm New Password</label>
            <input type="password" name="password_confirmation"
                class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
        </div>

        <button type="submit" class="px-6 py-2.5 bg-orange-500 text-white rounded-xl font-medium hover:bg-orange-600">
            Save Changes
        </button>
    </form>
</div>
@endsection