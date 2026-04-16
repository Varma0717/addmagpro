@extends('layouts.app')
@section('title')
@yield('page_title', 'My Account')
@endsection

@section('content')
<div class="grid md:grid-cols-4 gap-6 lg:gap-8">
    {{-- Sidebar --}}
    <aside class="md:col-span-1">
        <div class="card p-5 sticky top-24">
            {{-- User info --}}
            <div class="flex items-center gap-3 mb-5 pb-5 border-b border-surface-100">
                @if(auth()->user()->avatar)
                <img src="{{ imageUrl(auth()->user()->avatar) }}" class="w-11 h-11 rounded-full object-cover ring-2 ring-brand-100">
                @else
                <div class="w-11 h-11 rounded-full bg-gradient-to-br from-brand-400 to-brand-600 text-white font-bold text-sm flex items-center justify-center ring-2 ring-brand-100">
                    {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
                </div>
                @endif
                <div class="min-w-0">
                    <p class="font-semibold text-sm text-surface-900 truncate">{{ auth()->user()->name }}</p>
                    <p class="text-xs text-surface-400 truncate">{{ auth()->user()->email ?: auth()->user()->phone }}</p>
                </div>
            </div>

            <div class="mb-4 rounded-xl bg-brand-50 text-brand-700 px-3 py-2 text-xs font-semibold">
                You Are In Executive Level
            </div>

            @php
            $accountSections = [
            [
            'title' => 'Overview',
            'links' => [
            ['route' => 'account.index', 'label' => 'Dashboard', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />'],
            ],
            ],
            [
            'title' => 'Shopping',
            'links' => [
            ['route' => 'account.orders.index', 'label' => 'Orders', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />'],
            ['route' => 'account.wishlist.index', 'label' => 'Wishlist', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />'],
            ['route' => 'account.coupons.index', 'label' => 'Coupons', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 010 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 010-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375z" />'],
            ],
            ],
            [
            'title' => 'Payments',
            'links' => [
            ['route' => 'account.wallet.index', 'label' => 'Wallet', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 00-2.25-2.25H15a3 3 0 110-6h5.25A2.25 2.25 0 0121 6v6zm0 0v6a2.25 2.25 0 01-2.25 2.25H5.25A2.25 2.25 0 013 18V6a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 6" />'],
            ['route' => 'account.transactions.index', 'label' => 'Transactions', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M3 7.5 7.5 3m0 0L12 7.5M7.5 3v13.5m13.5 0L16.5 21m0 0L12 16.5m4.5 4.5V7.5" />'],
            ],
            ],
            [
            'title' => 'Rewards',
            'links' => [
            ['route' => 'account.referrals.index', 'label' => 'Referral Dashboard', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M19 7.5v3m0 0v3m0-3h3m-3 0h-3m-2.25-4.125a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zM4 19.235v-.11a6.375 6.375 0 0112.75 0v.109A12.318 12.318 0 0110.374 21c-2.331 0-4.512-.645-6.374-1.766z" />'],
            ['route' => 'account.team.index', 'label' => 'Team Details', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 003.742-.477 3 3 0 00-4.682-2.72m.94 3.197.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.579-5.963-1.593A5.979 5.979 0 016 18.75m12 0a5.969 5.969 0 00-.152-1.34M6 18.75a5.97 5.97 0 01.152-1.34m0 0a3 3 0 015.196-1.143M6.152 17.41a3 3 0 00-4.682 2.72A9.094 9.094 0 005.21 18.72m6.79-8.47a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z" />'],
            ],
            ],
            [
            'title' => 'Account',
            'links' => [
            ['route' => 'account.settings.edit', 'label' => 'Settings', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />'],
            ['route' => 'account.support.index', 'label' => 'Support', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M8.625 9.75a3.375 3.375 0 116.75 0c0 1.256-.69 2.35-1.712 2.926a2.25 2.25 0 00-1.163 1.949v.375M12 18.75h.008v.008H12v-.008z" />
            <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 12a9.75 9.75 0 11-19.5 0 9.75 9.75 0 0119.5 0z" />'],
            ['route' => 'account.profile.edit', 'label' => 'Profile', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />'],
            ['route' => 'account.discount-orders.index', 'label' => 'My Discount Shop Orders', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />'],
            ['route' => 'account.discount-payments.index', 'label' => 'Discount Store Customer Payments', 'svg' => '
            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 8.25h19.5m-18 0v8.25A2.25 2.25 0 006 18.75h12a2.25 2.25 0 002.25-2.25V8.25m-18 0V6A2.25 2.25 0 016 3.75h12A2.25 2.25 0 0120.25 6v2.25" />'],
            ],
            ],
            ];

            $memberReferralLink = url('/service_user_registration/' . (auth()->user()->phone ?: auth()->id()));
            $vendorReferralLink = url('/vendor_register/' . (auth()->user()->phone ?: auth()->id()));
            $depositWallet = (float) (auth()->user()->wallet_balance ?? 0);
            $stats = [
            ['label' => 'My Commission', 'value' => 0],
            ['label' => 'Back2Back Value', 'value' => 0],
            ['label' => 'Back2Back Income', 'value' => 0],
            ['label' => 'Discount Cashback', 'value' => 0],
            ['label' => 'Deposite Wallet', 'value' => $depositWallet],
            ['label' => 'Cummulative', 'value' => $depositWallet],
            ];
            @endphp
            <nav class="space-y-1 text-sm">
                @foreach($accountSections as $section)
                <div class="pt-2 first:pt-0">
                    <p class="px-3 pb-1 text-[11px] uppercase tracking-wide text-surface-400 font-semibold">{{ $section['title'] }}</p>
                    @foreach($section['links'] as $link)
                    @php
                    $isActive = $link['route'] ? request()->routeIs(rtrim($link['route'], '.index') . '*') : false;
                    @endphp
                    <a href="{{ $link['route'] ? route($link['route']) : 'javascript:;' }}"
                        class="flex items-center gap-3 px-3 py-2.5 rounded-xl transition-all duration-200 {{ $isActive ? 'bg-brand-50 text-brand-600 font-semibold shadow-sm' : 'text-surface-600 hover:bg-surface-50 hover:text-surface-900' }} {{ !empty($link['coming_soon']) ? 'opacity-70' : '' }}">
                        <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">{!! $link['svg'] !!}</svg>
                        <span>{{ $link['label'] }}</span>
                        @if(!empty($link['coming_soon']))
                        <span class="ml-auto text-[10px] px-1.5 py-0.5 rounded bg-surface-100 text-surface-500">Soon</span>
                        @endif
                    </a>
                    @endforeach
                </div>
                @endforeach
                @if(auth()->user()->isAdmin())
                <div class="pt-2">
                    <p class="px-3 pb-1 text-[11px] uppercase tracking-wide text-surface-400 font-semibold">Admin</p>
                    <a href="{{ route('admin.dashboard') }}" class="flex items-center gap-3 px-3 py-2.5 rounded-xl transition-all duration-200 text-purple-600 hover:bg-purple-50 font-semibold">
                        <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                        <span>Admin Panel</span>
                    </a>
                </div>
                @endif

                <form method="POST" action="{{ route('logout') }}" class="pt-1">
                    @csrf
                    <button type="submit" class="w-full text-left flex items-center gap-3 px-3 py-2.5 rounded-xl transition-all duration-200 text-red-600 hover:bg-red-50">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15M12 9l-3 3m0 0l3 3m-3-3h12.75" />
                        </svg>
                        <span>Logout</span>
                    </button>
                </form>
            </nav>

            <div class="mt-5 pt-4 border-t border-surface-100 space-y-3">
                <div>
                    <p class="text-xs font-semibold text-surface-700 mb-1">Member Referral Link:</p>
                    <div class="flex items-center gap-2">
                        <a href="{{ $memberReferralLink }}" class="text-xs text-brand-600 truncate hover:underline">{{ $memberReferralLink }}</a>
                        <button type="button" class="text-xs px-2 py-1 rounded bg-surface-100 hover:bg-surface-200 text-surface-600"
                            onclick="navigator.clipboard.writeText('{{ $memberReferralLink }}')">Copy</button>
                    </div>
                </div>
                <div>
                    <p class="text-xs font-semibold text-surface-700 mb-1">Vendor Referral Link:</p>
                    <div class="flex items-center gap-2">
                        <a href="{{ $vendorReferralLink }}" class="text-xs text-brand-600 truncate hover:underline">{{ $vendorReferralLink }}</a>
                        <button type="button" class="text-xs px-2 py-1 rounded bg-surface-100 hover:bg-surface-200 text-surface-600"
                            onclick="navigator.clipboard.writeText('{{ $vendorReferralLink }}')">Copy</button>
                    </div>
                </div>
            </div>

            <div class="mt-5 pt-4 border-t border-surface-100 grid grid-cols-2 gap-2">
                @foreach($stats as $stat)
                <div class="rounded-lg border border-surface-100 bg-surface-50 p-2.5">
                    <p class="text-[11px] text-surface-500 leading-tight">{{ $stat['label'] }}</p>
                    <p class="text-sm font-semibold text-surface-800 mt-1">{{ number_format((float) $stat['value'], 2) }}</p>
                </div>
                @endforeach
            </div>

            <div class="mt-3">
                <a href="{{ route('account.index') }}#withdraw" class="w-full inline-flex items-center justify-center px-3 py-2 rounded-xl bg-brand-500 text-white text-sm font-semibold hover:bg-brand-600 transition-colors">
                    Withdraw
                </a>
            </div>
        </div>
    </aside>

    {{-- Main content --}}
    <main class="md:col-span-3">
        @yield('account_content')
    </main>
</div>
@endsection