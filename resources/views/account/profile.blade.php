@extends('layouts.account')
@section('page_title', 'Edit Profile')
@section('title', 'My Profile')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6 flex items-center gap-2">
    <svg class="w-6 h-6 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
    </svg>
    Edit Profile
</h2>

<div class="card p-7 max-w-lg">
    <form method="POST" action="{{ route('account.profile.update') }}" enctype="multipart/form-data" class="space-y-5">
        @csrf

        {{-- Avatar --}}
        <div class="flex items-center gap-5">
            @if(auth()->user()->avatar)
            <img src="{{ Storage::url(auth()->user()->avatar) }}" class="w-18 h-18 rounded-2xl object-cover ring-2 ring-surface-100" alt="">
            @else
            <div class="w-18 h-18 rounded-2xl bg-gradient-to-br from-brand-500 to-brand-600 text-white font-bold text-2xl flex items-center justify-center shadow-soft">
                {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
            </div>
            @endif
            <div>
                <label class="text-sm font-semibold text-surface-700 block mb-1.5">Profile Photo</label>
                <input type="file" name="avatar" accept="image/*"
                    class="text-sm text-surface-600 file:mr-3 file:py-1.5 file:px-4 file:rounded-xl file:border-0 file:text-sm file:font-medium file:bg-brand-50 file:text-brand-700 hover:file:bg-brand-100 file:transition file:cursor-pointer">
            </div>
        </div>

        {{-- Name --}}
        <div>
            <label class="block text-sm font-semibold text-surface-700 mb-1.5">Full Name</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                    <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                    </svg>
                </span>
                <input name="name" value="{{ old('name', auth()->user()->name) }}" required class="input pl-11" />
            </div>
            @error('name') <p class="text-red-500 text-xs mt-1.5">{{ $message }}</p> @enderror
        </div>

        {{-- Phone --}}
        <div>
            <label class="block text-sm font-semibold text-surface-700 mb-1.5">Phone</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                    <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 0 0 2.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 0 1-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 0 0-1.091-.852H4.5A2.25 2.25 0 0 0 2.25 4.5v2.25Z" />
                    </svg>
                </span>
                <input name="phone" value="{{ old('phone', auth()->user()->phone) }}" class="input pl-11" />
            </div>
        </div>

        {{-- Email (disabled) --}}
        <div>
            <label class="block text-sm font-semibold text-surface-700 mb-1.5">Email</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                    <svg class="w-5 h-5 text-surface-300" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75" />
                    </svg>
                </span>
                <input value="{{ auth()->user()->email }}" disabled
                    class="w-full pl-11 pr-4 py-2.5 border border-surface-200 bg-surface-50 rounded-xl text-sm text-surface-400 cursor-not-allowed" />
            </div>
        </div>

        <hr class="border-surface-100" />

        {{-- New Password --}}
        <div>
            <label class="block text-sm font-semibold text-surface-700 mb-1.5">New Password <span class="font-normal text-surface-400">(leave blank to keep current)</span></label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                    <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 1 0-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 0 0 2.25-2.25v-6.75a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0-2.25 2.25v6.75a2.25 2.25 0 0 0 2.25 2.25Z" />
                    </svg>
                </span>
                <input type="password" name="password" class="input pl-11" placeholder="••••••••" />
            </div>
        </div>

        {{-- Confirm Password --}}
        <div>
            <label class="block text-sm font-semibold text-surface-700 mb-1.5">Confirm New Password</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                    <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z" />
                    </svg>
                </span>
                <input type="password" name="password_confirmation" class="input pl-11" placeholder="••••••••" />
            </div>
        </div>

        <button type="submit" class="btn-primary py-3 px-6 text-base">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
            </svg>
            Save Changes
        </button>
    </form>
</div>
@endsection