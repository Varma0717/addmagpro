@extends('layouts.app')
@section('title', @yield('page_title', 'My Account'))

@section('content')
<div class="grid md:grid-cols-4 gap-6">
    <!-- Sidebar -->
    <aside class="md:col-span-1">
        <div class="bg-white rounded-xl border p-4">
            <div class="flex items-center gap-3 mb-4 pb-4 border-b">
                @if(auth()->user()->avatar)
                <img src="{{ Storage::url(auth()->user()->avatar) }}" class="w-10 h-10 rounded-full object-cover">
                @else
                <div class="w-10 h-10 rounded-full bg-orange-100 text-orange-600 font-bold flex items-center justify-center">
                    {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
                </div>
                @endif
                <div>
                    <p class="font-semibold text-sm text-gray-800">{{ auth()->user()->name }}</p>
                    <p class="text-xs text-gray-400">{{ auth()->user()->email }}</p>
                </div>
            </div>
            @php
            $links = [
            ['route' => 'account.orders.index', 'label' => 'My Orders', 'icon' => '📦'],
            ['route' => 'account.wallet.index', 'label' => 'Wallet', 'icon' => '💰'],
            ['route' => 'account.referrals.index', 'label' => 'Refer & Earn', 'icon' => '🔗'],
            ['route' => 'account.wishlist.index', 'label' => 'Wishlist', 'icon' => '♥'],
            ['route' => 'account.notifications.index','label' => 'Notifications', 'icon' => '🔔'],
            ['route' => 'account.profile.edit', 'label' => 'Profile', 'icon' => '👤'],
            ];
            @endphp
            <nav class="space-y-1 text-sm">
                @foreach($links as $link)
                <a href="{{ route($link['route']) }}"
                    class="flex items-center gap-3 px-3 py-2 rounded-lg transition-colors
                              {{ request()->routeIs(rtrim($link['route'], '.index') . '*') ? 'bg-orange-50 text-orange-600 font-medium' : 'text-gray-600 hover:bg-gray-50' }}">
                    <span>{{ $link['icon'] }}</span>
                    <span>{{ $link['label'] }}</span>
                </a>
                @endforeach
            </nav>
        </div>
    </aside>

    <!-- Main content -->
    <main class="md:col-span-3">
        @yield('account_content')
    </main>
</div>
@endsection