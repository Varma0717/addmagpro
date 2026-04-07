<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Admin') — AdMagPro</title>
    @if (file_exists(public_path('build/manifest.json')) || file_exists(public_path('hot')))
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    @else
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    @endif
</head>

<body class="bg-gray-100 font-sans antialiased" x-data="{ sidebarOpen: false }">

    <!-- Sidebar -->
    <aside class="fixed inset-y-0 left-0 z-50 w-64 bg-gray-900 text-white flex flex-col transition-transform duration-200"
        :class="sidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'">
        <!-- Logo -->
        <div class="flex items-center gap-3 px-6 py-4 border-b border-gray-700">
            <span class="text-2xl font-bold text-orange-400">AdMagPro</span>
            <span class="text-xs text-gray-400 mt-1">Admin</span>
        </div>

        <!-- Nav -->
        <nav class="flex-1 overflow-y-auto py-4 px-3 space-y-1 text-sm">
            @php
            $navItems = [
            ['route' => 'admin.dashboard', 'icon' => '📊', 'label' => 'Dashboard'],
            ['route' => 'admin.users.index', 'icon' => '👥', 'label' => 'Users'],
            ['route' => 'admin.categories.index', 'icon' => '🗂️', 'label' => 'Categories'],
            ['route' => 'admin.products.index', 'icon' => '📦', 'label' => 'Products'],
            ['route' => 'admin.listings.index', 'icon' => '🏪', 'label' => 'Listings'],
            ['route' => 'admin.orders.index', 'icon' => '🛒', 'label' => 'Orders'],
            ['route' => 'admin.wallet.index', 'icon' => '💰', 'label' => 'Wallet'],
            ['route' => 'admin.referrals.index', 'icon' => '🔗', 'label' => 'Referrals'],
            ['route' => 'admin.banners.index', 'icon' => '🖼️', 'label' => 'Banners'],
            ['route' => 'admin.coupons.index', 'icon' => '🎫', 'label' => 'Coupons'],
            ['route' => 'admin.notifications.index','icon' => '🔔', 'label' => 'Notifications'],
            ];
            @endphp

            @foreach($navItems as $item)
            <a href="{{ route($item['route']) }}"
                class="flex items-center gap-3 px-3 py-2 rounded-lg transition-colors
                          {{ request()->routeIs(rtrim($item['route'], '.index') . '*') ? 'bg-orange-500 text-white' : 'text-gray-300 hover:bg-gray-700' }}">
                <span>{{ $item['icon'] }}</span>
                <span>{{ $item['label'] }}</span>
            </a>
            @endforeach
        </nav>

        <!-- Bottom -->
        <div class="px-4 py-4 border-t border-gray-700 text-sm text-gray-400">
            <div class="font-medium text-white">{{ auth()->user()->name }}</div>
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button class="mt-1 text-xs hover:text-red-400">Logout</button>
            </form>
        </div>
    </aside>

    <!-- Overlay for mobile -->
    <div class="fixed inset-0 bg-black/50 z-40 lg:hidden" x-show="sidebarOpen" @click="sidebarOpen = false" x-cloak></div>

    <!-- Main content -->
    <div class="lg:ml-64 flex flex-col min-h-screen">

        <!-- Top bar -->
        <header class="sticky top-0 z-30 bg-white border-b px-4 py-3 flex items-center justify-between shadow-sm">
            <button class="lg:hidden p-2 rounded hover:bg-gray-100" @click="sidebarOpen = !sidebarOpen">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
            </button>
            <h1 class="text-lg font-semibold text-gray-800">@yield('title', 'Dashboard')</h1>
            <span class="text-sm text-gray-500">Admin Panel</span>
        </header>

        <!-- Page content -->
        <main class="flex-1 p-6">
            @if (session('success'))
            <div class="mb-4 p-4 bg-green-50 border border-green-200 text-green-800 rounded-lg text-sm">
                {{ session('success') }}
            </div>
            @endif
            @if (session('error'))
            <div class="mb-4 p-4 bg-red-50 border border-red-200 text-red-800 rounded-lg text-sm">
                {{ session('error') }}
            </div>
            @endif

            @yield('content')
        </main>
    </div>
</body>

</html>