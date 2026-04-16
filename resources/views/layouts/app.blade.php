<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', config('app.name')) — Local Commerce &amp; Deals</title>
    <meta name="description" content="@yield('description', 'Shop local products, discover services, earn wallet rewards and referral bonuses.')">
    <link rel="icon" type="image/png" href="{{ asset('assets/images/favicon.png') }}">
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700|outfit:500,600,700" rel="stylesheet" />
    @php
    $viteRendered = false;
    try {
    echo app(Illuminate\Foundation\Vite::class)(['resources/css/app.css', 'resources/js/app.js']);
    $viteRendered = true;
    } catch (Throwable $e) {
    $viteRendered = false;
    }
    @endphp
    @if (!$viteRendered)
    <script src="https://cdn.tailwindcss.com"></script>
    {{-- Alpine CDN auto-starts when loaded; component functions are already
         defined in the footer inline script which runs before this loads. --}}
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    @endif
    @stack('head')
</head>

<body class="bg-surface-50 font-sans antialiased" x-data="{ mobileMenu: false }">

    {{-- ── Sticky Header ── --}}
    <header class="sticky top-0 z-50 bg-white/80 backdrop-blur-xl border-b border-surface-100 shadow-sm">
        <div class="max-w-7xl mx-auto px-4 sm:px-6">
            <div class="flex items-center h-16 gap-4">
                {{-- Logo --}}
                <a href="{{ route('home') }}" class="flex items-center flex-shrink-0">
                    <img src="{{ asset('assets/images/logo.png') }}" alt="AddMagPro" class="h-9 w-auto">
                </a>

                {{-- Location Selector --}}
                <div class="hidden md:flex items-center flex-shrink-0 relative" x-data="locationPicker()" x-init="init()">
                    <button @click="open = !open" class="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-sm font-medium text-surface-600 hover:bg-surface-100 transition-colors">
                        <svg class="w-4 h-4 text-brand-500" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z" />
                        </svg>
                        <span x-text="selectedLabel" class="max-w-[120px] truncate"></span>
                        <svg class="w-3 h-3 text-surface-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                        </svg>
                    </button>
                    <div x-show="open" @click.outside="open = false" x-cloak
                        x-transition:enter="transition ease-out duration-200" x-transition:enter-start="opacity-0 scale-95" x-transition:enter-end="opacity-100 scale-100"
                        class="absolute top-full left-0 mt-1 w-72 bg-white border border-surface-100 rounded-2xl shadow-soft p-4 z-50">
                        <p class="text-xs font-semibold text-surface-500 uppercase tracking-wider mb-2">Select Location</p>
                        <select x-model="stateId" @change="onStateChange()" class="input text-sm mb-2 w-full">
                            <option value="">All States</option>
                            @foreach(\App\Models\State::orderBy('state_name')->get() as $st)
                            <option value="{{ $st->id }}" {{ session('location_state_id') == $st->id ? 'selected' : '' }}>{{ $st->state_name }}</option>
                            @endforeach
                        </select>
                        <select x-model="districtId" class="input text-sm mb-3 w-full">
                            <option value="">All Districts</option>
                            <template x-for="d in districts" :key="d.id">
                                <option :value="d.id" x-text="d.district_name" :selected="d.id == initialDistrictId"></option>
                            </template>
                        </select>
                        <button @click="applyLocation()" class="btn-primary w-full text-sm py-2">Apply</button>
                    </div>
                </div>

                {{-- Search --}}
                <form action="{{ route('search') }}" method="GET" class="flex-1 max-w-xl hidden md:flex">
                    <div class="flex w-full rounded-2xl overflow-hidden border border-surface-200 bg-surface-50 focus-within:ring-2 focus-within:ring-brand-400 focus-within:border-brand-300 transition-all">
                        <span class="pl-4 flex items-center text-surface-400">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <circle cx="11" cy="11" r="8" />
                                <path d="M21 21l-4.35-4.35" />
                            </svg>
                        </span>
                        <input name="q" value="{{ request('q') }}" placeholder="Search products, services…"
                            class="flex-1 px-3 py-2.5 text-sm bg-transparent outline-none border-none focus:ring-0">
                        <button class="px-5 bg-brand-500 text-white text-sm font-medium hover:bg-brand-600 transition-colors">Search</button>
                    </div>
                </form>

                {{-- Right actions --}}
                <div class="flex items-center gap-2 sm:gap-3 ml-auto">
                    @auth
                    {{-- Wallet --}}
                    <a href="{{ route('account.wallet.index') }}" class="hidden md:flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-emerald-50 text-emerald-700 text-sm font-semibold hover:bg-emerald-100 transition-colors">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" />
                        </svg>
                        ₹{{ number_format(auth()->user()->wallet_balance, 2) }}
                    </a>

                    {{-- Notifications --}}
                    <a href="{{ route('account.notifications.index') }}" class="relative p-2 rounded-xl text-surface-500 hover:bg-surface-100 hover:text-brand-500 transition-colors"
                        x-data="notifBadge()" x-init="fetchCount()">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0" />
                        </svg>
                        <span x-show="count > 0" x-text="count" x-cloak
                            class="absolute -top-0.5 -right-0.5 bg-red-500 text-white text-[10px] font-bold rounded-full min-w-[18px] h-[18px] flex items-center justify-center leading-none ring-2 ring-white"></span>
                    </a>

                    {{-- Cart --}}
                    <a href="{{ route('cart.index') }}" class="relative p-2 rounded-xl text-surface-500 hover:bg-surface-100 hover:text-brand-500 transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" />
                        </svg>
                    </a>

                    {{-- User Menu --}}
                    <div class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="w-9 h-9 rounded-full bg-gradient-to-br from-brand-400 to-brand-600 text-white font-bold text-sm flex items-center justify-center ring-2 ring-brand-100 hover:ring-brand-200 transition-all shadow-sm">
                            {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
                        </button>
                        <div x-show="open" @click.outside="open = false" x-cloak
                            x-transition:enter="transition ease-out duration-200" x-transition:enter-start="opacity-0 scale-95" x-transition:enter-end="opacity-100 scale-100"
                            x-transition:leave="transition ease-in duration-100" x-transition:leave-start="opacity-100 scale-100" x-transition:leave-end="opacity-0 scale-95"
                            class="absolute right-0 mt-2 w-56 bg-white border border-surface-100 rounded-2xl shadow-soft py-2 text-sm z-50">
                            <div class="px-4 py-2 border-b border-surface-100 mb-1">
                                <p class="font-semibold text-surface-900 truncate">{{ auth()->user()->name }}</p>
                                <p class="text-xs text-surface-400 truncate">{{ auth()->user()->email ?: auth()->user()->phone }}</p>
                            </div>
                            <p class="px-4 py-1 text-[11px] uppercase tracking-wide text-surface-400 font-semibold">Shopping</p>
                            <a href="{{ route('account.orders.index') }}" class="flex items-center gap-3 px-4 py-2 text-surface-600 hover:bg-surface-50 hover:text-surface-900 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
                                </svg>
                                Orders</a>
                            <a href="{{ route('account.wishlist.index') }}" class="flex items-center gap-3 px-4 py-2 text-surface-600 hover:bg-surface-50 hover:text-surface-900 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                                </svg>
                                Wishlist</a>
                            <a href="{{ route('account.coupons.index') }}" class="flex items-center gap-3 px-4 py-2 text-surface-600 hover:bg-surface-50 hover:text-surface-900 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 010 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 010-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375z" />
                                </svg>
                                Coupons</a>

                            <p class="px-4 pt-2 pb-1 text-[11px] uppercase tracking-wide text-surface-400 font-semibold">Payments</p>
                            <a href="{{ route('account.wallet.index') }}" class="flex items-center gap-3 px-4 py-2 text-surface-600 hover:bg-surface-50 hover:text-surface-900 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 00-2.25-2.25H15a3 3 0 110-6h5.25A2.25 2.25 0 0121 6v6zm0 0v6a2.25 2.25 0 01-2.25 2.25H5.25A2.25 2.25 0 013 18V6a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 6" />
                                </svg>
                                Wallet</a>
                            <a href="{{ route('account.transactions.index') }}" class="flex items-center gap-3 px-4 py-2 text-surface-600 hover:bg-surface-50 hover:text-surface-900 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 7.5 7.5 3m0 0L12 7.5M7.5 3v13.5m13.5 0L16.5 21m0 0L12 16.5m4.5 4.5V7.5" />
                                </svg>
                                Transactions</a>
                            <a href="{{ route('account.referrals.index') }}" class="flex items-center gap-3 px-4 py-2 text-surface-600 hover:bg-surface-50 hover:text-surface-900 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7.5v3m0 0v3m0-3h3m-3 0h-3m-2.25-4.125a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zM4 19.235v-.11a6.375 6.375 0 0112.75 0v.109A12.318 12.318 0 0110.374 21c-2.331 0-4.512-.645-6.374-1.766z" />
                                </svg>
                                Referral Dashboard</a>
                            <p class="px-4 pt-2 pb-1 text-[11px] uppercase tracking-wide text-surface-400 font-semibold">Account</p>
                            <a href="{{ route('account.settings.edit') }}" class="flex items-center gap-3 px-4 py-2 text-surface-600 hover:bg-surface-50 hover:text-surface-900 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.094c.55 0 1.02.398 1.11.94l.077.463c.063.374.313.686.645.87.137.076.272.156.404.24.326.196.72.257 1.076.124l.44-.165c.516-.194 1.094.03 1.37.54l.547.948c.275.51.17 1.149-.26 1.53l-.364.322c-.293.26-.437.657-.43 1.046.001.154.001.31 0 .465-.007.389.137.786.43 1.046l.364.322c.43.381.535 1.02.26 1.53l-.547.948c-.276.51-.854.734-1.37.54l-.44-.165c-.356-.133-.75-.072-1.076.124a8.174 8.174 0 01-.404.24.98.98 0 00-.645.87l-.077.463c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.02-.398-1.11-.94l-.077-.463a.98.98 0 00-.645-.87 8.174 8.174 0 01-.404-.24c-.325-.196-.72-.257-1.076-.124l-.44.165a1.125 1.125 0 01-1.37-.54l-.547-.948a1.125 1.125 0 01.26-1.53l.364-.322c.293-.26.437-.657.43-1.046a9.14 9.14 0 010-.465c.007-.389-.137-.786-.43-1.046l-.364-.322a1.125 1.125 0 01-.26-1.53l.547-.948a1.125 1.125 0 011.37-.54l.44.165c.356.133.751.072 1.076-.124.132-.084.267-.164.404-.24.332-.184.582-.496.645-.87l.077-.463z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                                Settings</a>
                            <a href="{{ route('account.profile.edit') }}" class="flex items-center gap-3 px-4 py-2 text-surface-600 hover:bg-surface-50 hover:text-surface-900 transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                                </svg>
                                Profile</a>
                            @if(auth()->user()->isAdmin())
                            <div class="border-t border-surface-100 my-1"></div>
                            <p class="px-4 pt-1 pb-1 text-[11px] uppercase tracking-wide text-surface-400 font-semibold">Admin</p>
                            <a href="{{ route('admin.dashboard') }}" class="flex items-center gap-3 px-4 py-2 text-purple-600 hover:bg-purple-50 font-medium transition-colors">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                                Admin Panel</a>
                            @endif
                            <div class="border-t border-surface-100 my-1"></div>
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button class="w-full flex items-center gap-3 px-4 py-2 text-red-500 hover:bg-red-50 transition-colors">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15M12 9l-3 3m0 0l3 3m-3-3h12.75" />
                                    </svg>
                                    Logout</button>
                            </form>
                        </div>
                    </div>
                    @else
                    <a href="{{ route('login') }}" class="btn-ghost text-sm">Login</a>
                    <a href="{{ route('register') }}" class="btn-primary text-sm">Register</a>
                    @endauth
                </div>
            </div>

            {{-- Primary menu (similar to addmagpro.com) --}}
            <div class="hidden md:flex items-center gap-2 pb-3 text-sm">
                <a href="{{ route('categories.stores') }}"
                    class="px-4 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.stores', 'categories.services') ? 'bg-brand-500 text-white shadow-sm' : 'text-surface-600 hover:bg-brand-50 hover:text-brand-600' }}">
                    Stores &amp; Services
                </a>
                <a href="{{ route('categories.index') }}"
                    class="px-4 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.index', 'categories.show', 'products.show') ? 'bg-blue-500 text-white shadow-sm' : 'text-surface-600 hover:bg-blue-50 hover:text-blue-600' }}">
                    Products
                </a>
                <a href="{{ route('categories.services') }}"
                    class="px-4 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.services', 'listings.show') ? 'bg-emerald-500 text-white shadow-sm' : 'text-surface-600 hover:bg-emerald-50 hover:text-emerald-600' }}">
                    Classifieds
                </a>
            </div>

            {{-- Mobile search --}}
            <div class="md:hidden pb-3">
                {{-- Mobile Location --}}
                <div class="mb-2 relative" x-data="locationPicker()" x-init="init()">
                    <button @click="open = !open" class="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-medium text-surface-600 bg-surface-50 border border-surface-200 w-full">
                        <svg class="w-3.5 h-3.5 text-brand-500 flex-shrink-0" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z" />
                        </svg>
                        <span x-text="selectedLabel" class="truncate"></span>
                        <svg class="w-3 h-3 text-surface-400 ml-auto flex-shrink-0" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                        </svg>
                    </button>
                    <div x-show="open" @click.outside="open = false" x-cloak
                        x-transition:enter="transition ease-out duration-200" x-transition:enter-start="opacity-0 scale-95" x-transition:enter-end="opacity-100 scale-100"
                        class="absolute top-full left-0 right-0 mt-1 bg-white border border-surface-100 rounded-2xl shadow-soft p-4 z-50">
                        <p class="text-xs font-semibold text-surface-500 uppercase tracking-wider mb-2">Select Location</p>
                        <select x-model="stateId" @change="onStateChange()" class="input text-sm mb-2 w-full">
                            <option value="">All States</option>
                            @foreach(\App\Models\State::orderBy('state_name')->get() as $st)
                            <option value="{{ $st->id }}">{{ $st->state_name }}</option>
                            @endforeach
                        </select>
                        <select x-model="districtId" class="input text-sm mb-3 w-full">
                            <option value="">All Districts</option>
                            <template x-for="d in districts" :key="d.id">
                                <option :value="d.id" x-text="d.district_name"></option>
                            </template>
                        </select>
                        <button @click="applyLocation()" class="btn-primary w-full text-sm py-2">Apply</button>
                    </div>
                </div>

                <form action="{{ route('search') }}" method="GET" class="flex gap-2">
                    <input name="q" value="{{ request('q') }}" placeholder="Search products, services…"
                        class="input flex-1">
                    <button class="btn-primary px-4">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <circle cx="11" cy="11" r="8" />
                            <path d="M21 21l-4.35-4.35" />
                        </svg>
                    </button>
                </form>

                <div class="mt-3 flex gap-2 overflow-x-auto text-xs" style="-ms-overflow-style:none;scrollbar-width:none;">
                    <a href="{{ route('categories.stores') }}"
                        class="flex-shrink-0 px-3 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.stores', 'categories.services') ? 'bg-brand-500 text-white shadow-sm' : 'text-surface-600 bg-surface-100 hover:bg-brand-50 hover:text-brand-600' }}">
                        Stores &amp; Services
                    </a>
                    <a href="{{ route('categories.index') }}"
                        class="flex-shrink-0 px-3 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.index', 'categories.show', 'products.show') ? 'bg-blue-500 text-white shadow-sm' : 'text-surface-600 bg-surface-100 hover:bg-blue-50 hover:text-blue-600' }}">
                        Products
                    </a>
                    <a href="{{ route('categories.services') }}"
                        class="flex-shrink-0 px-3 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.services', 'listings.show') ? 'bg-emerald-500 text-white shadow-sm' : 'text-surface-600 bg-surface-100 hover:bg-emerald-50 hover:text-emerald-600' }}">
                        Classifieds
                    </a>
                </div>
            </div>
        </div>
    </header>

    {{-- ── Category Bar ── --}}
    <nav class="bg-white border-b border-surface-100 relative">
        <div class="max-w-7xl mx-auto px-4 sm:px-6">
            <div class="flex gap-1 py-2.5 text-sm overflow-x-auto scrollbar-hide" style="-ms-overflow-style:none;scrollbar-width:none;">
                <a href="{{ route('categories.index') }}"
                    class="flex-shrink-0 px-4 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.index') ? 'bg-brand-500 text-white shadow-sm' : 'text-surface-600 hover:bg-brand-50 hover:text-brand-600' }}">All</a>
                <a href="{{ route('categories.stores') }}"
                    class="flex-shrink-0 px-4 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.stores') ? 'bg-brand-500 text-white shadow-sm' : 'text-surface-600 hover:bg-brand-50 hover:text-brand-600' }}">Stores</a>
                <a href="{{ route('categories.services') }}"
                    class="flex-shrink-0 px-4 py-1.5 rounded-full font-medium transition-all {{ request()->routeIs('categories.services') ? 'bg-blue-500 text-white shadow-sm' : 'text-surface-600 hover:bg-blue-50 hover:text-blue-600' }}">Services</a>
                @foreach(\App\Models\Category::active()->topLevel()->get() as $cat)
                <a href="{{ route('categories.show', $cat->slug) }}"
                    class="flex-shrink-0 px-4 py-1.5 rounded-full font-medium transition-all {{ request()->is('category/'.$cat->slug.'*') ? 'bg-brand-500 text-white shadow-sm' : 'text-surface-600 hover:bg-brand-50 hover:text-brand-600' }}">
                    {{ $cat->name }}
                </a>
                @endforeach
            </div>
        </div>
    </nav>

    {{-- ── Flash Messages ── --}}
    @if(session('success'))
    <div class="max-w-7xl mx-auto px-4 sm:px-6 mt-4 animate-slide-up">
        <div class="flex items-center gap-3 p-4 bg-emerald-50 border border-emerald-200 text-emerald-800 rounded-2xl text-sm">
            <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            {{ session('success') }}
        </div>
    </div>
    @endif
    @if(session('error'))
    <div class="max-w-7xl mx-auto px-4 sm:px-6 mt-4 animate-slide-up">
        <div class="flex items-center gap-3 p-4 bg-red-50 border border-red-200 text-red-800 rounded-2xl text-sm">
            <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z" />
            </svg>
            {{ session('error') }}
        </div>
    </div>
    @endif

    {{-- ── Main Content ── --}}
    <main class="max-w-7xl mx-auto px-4 sm:px-6 py-8">
        @yield('content')
    </main>

    <x-chatbot-panel />

    {{-- ── Premium Footer ── --}}
    <footer class="bg-surface-900 text-surface-300 mt-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 pt-16 pb-8">
            <div class="grid grid-cols-2 md:grid-cols-5 gap-8 lg:gap-12">
                {{-- Brand --}}
                <div class="col-span-2">
                    <div class="flex items-center gap-2 mb-4">
                        <img src="{{ asset('assets/images/logo.png') }}" alt="AddMagPro" class="h-9 w-auto brightness-0 invert">
                    </div>
                    <p class="text-surface-400 text-sm leading-relaxed max-w-sm">We are a leading E-commerce and Local Search Engine platform designed to help businesses reach a broader audience and grow your customer base. One-stop shop for consumers and a lucrative marketplace for vendors.</p>
                    {{-- Social --}}
                    <div class="flex gap-3 mt-5">
                        @foreach(['M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z', 'M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z', 'M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z'] as $socialPath)
                        <a href="javascript:;" class="w-9 h-9 rounded-full bg-surface-800 flex items-center justify-center text-surface-400 hover:bg-brand-500 hover:text-white transition-all">
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                                <path d="{{ $socialPath }}" />
                            </svg>
                        </a>
                        @endforeach
                    </div>
                </div>

                {{-- Categories --}}
                <div>
                    <h4 class="font-display font-semibold text-white mb-4">Categories</h4>
                    <ul class="space-y-2.5 text-sm">
                        <li><a href="{{ route('categories.index') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Electronics</a></li>
                        <li><a href="{{ route('categories.index') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Fashion</a></li>
                        <li><a href="{{ route('categories.index') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Furniture</a></li>
                        <li><a href="{{ route('categories.index') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Shoes</a></li>
                        <li><a href="{{ route('categories.index') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Services</a></li>
                    </ul>
                </div>

                {{-- Company --}}
                <div>
                    <h4 class="font-display font-semibold text-white mb-4">Company</h4>
                    <ul class="space-y-2.5 text-sm">
                        <li><a href="{{ route('pages.about') }}" class="text-surface-400 hover:text-brand-400 transition-colors">About Us</a></li>
                        <li><a href="{{ route('pages.contact') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Contact Us</a></li>
                        <li><a href="{{ route('pages.privacy') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Privacy Policy</a></li>
                        <li><a href="{{ route('pages.terms') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Terms &amp; Conditions</a></li>
                        <li><a href="{{ route('pages.shipping') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Shipping Policy</a></li>
                        <li><a href="{{ route('pages.refund') }}" class="text-surface-400 hover:text-brand-400 transition-colors">Refund Policy</a></li>
                    </ul>
                </div>

                {{-- Support --}}
                <div>
                    <h4 class="font-display font-semibold text-white mb-4">Support</h4>
                    <ul class="space-y-3 text-sm">
                        <li class="flex items-center gap-2 text-surface-400">
                            <svg class="w-4 h-4 text-brand-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                            </svg>
                            contact@addmagpro.com
                        </li>
                        <li class="flex items-center gap-2 text-surface-400">
                            <svg class="w-4 h-4 text-brand-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z" />
                            </svg>
                            8522852201
                        </li>
                    </ul>
                    @auth
                    <div class="mt-4 pt-4 border-t border-surface-800">
                        <a href="{{ route('account.orders.index') }}" class="text-sm text-surface-400 hover:text-brand-400 transition-colors">My Orders</a>
                    </div>
                    @else
                    <div class="mt-4 pt-4 border-t border-surface-800 flex gap-3">
                        <a href="{{ route('login') }}" class="text-sm text-surface-400 hover:text-brand-400 transition-colors">Login</a>
                        <a href="{{ route('register') }}" class="text-sm text-surface-400 hover:text-brand-400 transition-colors">Register</a>
                    </div>
                    @endauth
                </div>
            </div>

            {{-- Bottom --}}
            <div class="border-t border-surface-800 mt-12 pt-6 flex flex-col sm:flex-row justify-between items-center gap-4 text-xs text-surface-500">
                <p>&copy; {{ date('Y') }} www.addmagpro.com | A Unit of Koochana Publications | All rights reserved.</p>
                <div class="flex gap-4">
                    <a href="{{ route('pages.privacy') }}" class="hover:text-surface-300 transition-colors">Privacy Policy</a>
                    <a href="{{ route('pages.terms') }}" class="hover:text-surface-300 transition-colors">Terms &amp; Conditions</a>
                    <a href="{{ route('pages.shipping') }}" class="hover:text-surface-300 transition-colors">Shipping Policy</a>
                    <a href="{{ route('pages.refund') }}" class="hover:text-surface-300 transition-colors">Refund Policy</a>
                    <a href="{{ route('pages.contact') }}" class="hover:text-surface-300 transition-colors">Contact Us</a>
                </div>
            </div>
        </div>
    </footer>

    @stack('scripts')
    <script>
        function notifBadge() {
            return {
                count: 0,
                fetchCount() {
                    fetch("{{ route('account.notifications.count') }}")
                        .then(r => r.json())
                        .then(d => {
                            this.count = d.count || 0;
                        })
                        .catch(() => {});
                }
            }
        }


        function chatbotWidget() {
            return {
                open: false,
                loading: false,
                currentIntent: null,
                suggestions: [],
                toggleWidget(value) {
                    this.open = value;
                    if (value) {
                        this.track('widget_opened');
                    }
                },
                selectIntent(intent) {
                    this.currentIntent = intent;
                    this.loading = true;
                    this.suggestions = [];
                    this.track('intent_selected', {
                        intent
                    });

                    fetch('/api/chatbot/suggestions', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                                'Accept': 'application/json'
                            },
                            body: JSON.stringify({
                                intent
                            })
                        })
                        .then(r => r.json())
                        .then(data => {
                            this.suggestions = Array.isArray(data.suggestions) ? data.suggestions : [];
                        })
                        .catch(() => {
                            this.suggestions = [];
                        })
                        .finally(() => {
                            this.loading = false;
                        });
                },
                track(eventType, meta = {}) {
                    fetch('/api/chatbot/track', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                            'Accept': 'application/json'
                        },
                        body: JSON.stringify({
                            event_type: eventType,
                            intent: this.currentIntent,
                            meta,
                        })
                    }).catch(() => {});
                }
            }
        }

        function locationPicker() {
            return {
                open: false,
                stateId: '{{ session("location_state_id", "") }}',
                districtId: '{{ session("location_district_id", "") }}',
                initialDistrictId: {
                    {
                        session('location_district_id', 0)
                    }
                },
                districts: [],
                selectedLabel: '{{ session("location_label", "All India") }}',
                init() {
                    if (this.stateId) this.loadDistricts(this.stateId);
                },
                onStateChange() {
                    this.districtId = '';
                    if (this.stateId) {
                        this.loadDistricts(this.stateId);
                    } else {
                        this.districts = [];
                    }
                },
                loadDistricts(stateId) {
                    fetch('/api/districts/' + stateId)
                        .then(r => r.json())
                        .then(d => {
                            this.districts = d;
                        })
                        .catch(() => {
                            this.districts = [];
                        });
                },
                applyLocation() {
                    const params = new URLSearchParams();
                    params.set('state_id', this.stateId);
                    params.set('district_id', this.districtId);
                    params.set('_token', document.querySelector('meta[name="csrf-token"]').content);
                    fetch('/set-location', {
                            method: 'POST',
                            body: params
                        })
                        .then(() => window.location.reload())
                        .catch(() => {});
                }
            }
        }

        // Start Alpine after all component functions are defined.
        // Module scripts (Vite) are deferred and run AFTER inline scripts,
        // so window.Alpine may not exist yet. Wait for DOMContentLoaded
        // which fires after deferred/module scripts have executed.
        if (window.Alpine) {
            window.Alpine.start();
        } else {
            document.addEventListener('DOMContentLoaded', () => {
                if (window.Alpine) window.Alpine.start();
            });
        }
    </script>
</body>

</html>