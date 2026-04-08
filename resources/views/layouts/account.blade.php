@extends('layouts.app')
@section('title', @yield('page_title', 'My Account'))

@section('content')
<div class="grid md:grid-cols-4 gap-6 lg:gap-8">
    {{-- Sidebar --}}
    <aside class="md:col-span-1">
        <div class="card p-5 sticky top-24">
            {{-- User info --}}
            <div class="flex items-center gap-3 mb-5 pb-5 border-b border-surface-100">
                @if(auth()->user()->avatar)
                <img src="{{ Storage::url(auth()->user()->avatar) }}" class="w-11 h-11 rounded-full object-cover ring-2 ring-brand-100">
                @else
                <div class="w-11 h-11 rounded-full bg-gradient-to-br from-brand-400 to-brand-600 text-white font-bold text-sm flex items-center justify-center ring-2 ring-brand-100">
                    {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
                </div>
                @endif
                <div class="min-w-0">
                    <p class="font-semibold text-sm text-surface-900 truncate">{{ auth()->user()->name }}</p>
                    <p class="text-xs text-surface-400 truncate">{{ auth()->user()->email }}</p>
                </div>
            </div>
            @php
            $links = [
            ['route' => 'account.orders.index', 'label' => 'My Orders', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />'],
            ['route' => 'account.wallet.index', 'label' => 'Wallet', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 00-2.25-2.25H15a3 3 0 110-6h5.25A2.25 2.25 0 0121 6v6zm0 0v6a2.25 2.25 0 01-2.25 2.25H5.25A2.25 2.25 0 013 18V6a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 6" />'],
            ['route' => 'account.referrals.index', 'label' => 'Refer & Earn', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M19 7.5v3m0 0v3m0-3h3m-3 0h-3m-2.25-4.125a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zM4 19.235v-.11a6.375 6.375 0 0112.75 0v.109A12.318 12.318 0 0110.374 21c-2.331 0-4.512-.645-6.374-1.766z" />'],
            ['route' => 'account.wishlist.index', 'label' => 'Wishlist', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />'],
            ['route' => 'account.notifications.index', 'label' => 'Notifications', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0" />'],
            ['route' => 'account.profile.edit', 'label' => 'Profile', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />'],
            ];
            @endphp
            <nav class="space-y-1 text-sm">
                @foreach($links as $link)
                <a href="{{ route($link['route']) }}"
                    class="flex items-center gap-3 px-3 py-2.5 rounded-xl transition-all duration-200
                          {{ request()->routeIs(rtrim($link['route'], '.index') . '*') ? 'bg-brand-50 text-brand-600 font-semibold shadow-sm' : 'text-surface-600 hover:bg-surface-50 hover:text-surface-900' }}">
                    <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">{!! $link['svg'] !!}</svg>
                    <span>{{ $link['label'] }}</span>
                </a>
                @endforeach
            </nav>
        </div>
    </aside>

    {{-- Main content --}}
    <main class="md:col-span-3">
        @yield('account_content')
    </main>
</div>
@endsection