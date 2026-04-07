<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', config('app.name')) — Local Commerce &amp; Deals</title>
    <meta name="description" content="@yield('description', 'Shop local products, discover services, earn wallet rewards and referral bonuses.')">
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
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    @endif
    @stack('head')
</head>

<body class="bg-gray-50 font-sans antialiased" x-data="{ mobileMenu: false }">

    <!-- Top Nav -->
    <header class="sticky top-0 z-50 bg-white border-b shadow-sm">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex items-center h-14 gap-4">
                <a href="{{ route('home') }}" class="text-xl font-bold text-orange-500 flex-shrink-0">AdMagPro</a>

                <form action="{{ route('search') }}" method="GET" class="flex-1 max-w-xl hidden md:flex">
                    <div class="flex w-full rounded-lg overflow-hidden border border-gray-300 focus-within:ring-2 focus-within:ring-orange-400">
                        <input name="q" value="{{ request('q') }}" placeholder="Search products, services…"
                            class="flex-1 px-4 py-2 text-sm outline-none">
                        <button class="px-4 bg-orange-500 text-white text-sm hover:bg-orange-600">Search</button>
                    </div>
                </form>

                <div class="flex items-center gap-3 ml-auto">
                    @auth
                    <a href="{{ route('account.wallet.index') }}" class="hidden md:flex items-center gap-1 text-sm font-medium text-gray-700 hover:text-orange-500">
                        <span class="text-green-500">₹</span>{{ number_format(auth()->user()->wallet_balance, 2) }}
                    </a>

                    <a href="{{ route('account.notifications.index') }}" class="relative text-gray-600 hover:text-orange-500"
                        x-data="notifBadge()" x-init="fetchCount()">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6 6 0 10-12 0v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                        </svg>
                        <span x-show="count > 0" x-text="count"
                            class="absolute -top-1.5 -right-1.5 bg-red-500 text-white text-xs rounded-full w-4 h-4 flex items-center justify-center leading-none"></span>
                    </a>

                    <a href="{{ route('cart.index') }}" class="relative text-gray-600 hover:text-orange-500">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                        </svg>
                    </a>

                    <div class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="w-8 h-8 rounded-full bg-orange-100 text-orange-600 font-bold text-sm flex items-center justify-center">
                            {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
                        </button>
                        <div x-show="open" @click.outside="open = false" x-cloak
                            class="absolute right-0 mt-2 w-48 bg-white border rounded-xl shadow-lg py-1 text-sm z-50">
                            <a href="{{ route('account.orders.index') }}" class="block px-4 py-2 hover:bg-gray-50 text-gray-700">My Orders</a>
                            <a href="{{ route('account.wallet.index') }}" class="block px-4 py-2 hover:bg-gray-50 text-gray-700">Wallet</a>
                            <a href="{{ route('account.referrals.index') }}" class="block px-4 py-2 hover:bg-gray-50 text-gray-700">Referrals</a>
                            <a href="{{ route('account.wishlist.index') }}" class="block px-4 py-2 hover:bg-gray-50 text-gray-700">Wishlist</a>
                            <a href="{{ route('account.profile.edit') }}" class="block px-4 py-2 hover:bg-gray-50 text-gray-700">Profile</a>
                            @if(auth()->user()->isAdmin())
                            <a href="{{ route('admin.dashboard') }}" class="block px-4 py-2 hover:bg-gray-50 text-purple-600 font-medium">Admin Panel</a>
                            @endif
                            <hr class="my-1">
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button class="w-full text-left px-4 py-2 hover:bg-gray-50 text-red-600">Logout</button>
                            </form>
                        </div>
                    </div>
                    @else
                    <a href="{{ route('login') }}" class="text-sm text-gray-600 hover:text-orange-500">Login</a>
                    <a href="{{ route('register') }}" class="text-sm px-4 py-2 bg-orange-500 text-white rounded-lg hover:bg-orange-600">Register</a>
                    @endauth
                </div>
            </div>

            <div class="md:hidden pb-3">
                <form action="{{ route('search') }}" method="GET" class="flex gap-2">
                    <input name="q" value="{{ request('q') }}" placeholder="Search…"
                        class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    <button class="px-4 py-2 bg-orange-500 text-white rounded-lg text-sm">Go</button>
                </form>
            </div>
        </div>
    </header>

    <!-- Category bar -->
    <nav class="bg-white border-b">
        <div class="max-w-7xl mx-auto px-4 overflow-x-auto">
            <div class="flex gap-1 py-2 text-sm whitespace-nowrap">
                <a href="{{ route('categories.index') }}"
                    class="px-3 py-1.5 rounded-full {{ request()->routeIs('categories.index') ? 'bg-orange-500 text-white' : 'text-gray-600 hover:bg-orange-50 hover:text-orange-600' }}">All</a>
                @foreach(\App\Models\Category::active()->topLevel()->get() as $cat)
                <a href="{{ route('categories.show', $cat->slug) }}"
                    class="px-3 py-1.5 rounded-full {{ request()->is('category/'.$cat->slug.'*') ? 'bg-orange-500 text-white' : 'text-gray-600 hover:bg-orange-50 hover:text-orange-600' }}">
                    {{ $cat->name }}
                </a>
                @endforeach
            </div>
        </div>
    </nav>

    @if(session('success'))
    <div class="max-w-7xl mx-auto px-4 mt-4">
        <div class="p-3 bg-green-50 border border-green-200 text-green-800 rounded-xl text-sm">{{ session('success') }}</div>
    </div>
    @endif
    @if(session('error'))
    <div class="max-w-7xl mx-auto px-4 mt-4">
        <div class="p-3 bg-red-50 border border-red-200 text-red-800 rounded-xl text-sm">{{ session('error') }}</div>
    </div>
    @endif

    <main class="max-w-7xl mx-auto px-4 py-6">
        @yield('content')
    </main>

    <footer class="bg-gray-800 text-gray-300 mt-12 py-10">
        <div class="max-w-7xl mx-auto px-4 grid md:grid-cols-4 gap-8 text-sm">
            <div>
                <div class="text-white font-bold text-lg mb-2">AdMagPro</div>
                <p class="text-gray-400">Your local commerce super app.</p>
            </div>
            <div>
                <h4 class="text-white font-semibold mb-3">Shop</h4>
                <ul class="space-y-2">
                    <li><a href="{{ route('categories.index') }}" class="hover:text-white">Categories</a></li>
                    <li><a href="{{ route('search') }}" class="hover:text-white">Search</a></li>
                </ul>
            </div>
            <div>
                <h4 class="text-white font-semibold mb-3">Account</h4>
                <ul class="space-y-2">
                    @auth
                    <li><a href="{{ route('account.orders.index') }}" class="hover:text-white">My Orders</a></li>
                    <li><a href="{{ route('account.referrals.index') }}" class="hover:text-white">Refer &amp; Earn</a></li>
                    @else
                    <li><a href="{{ route('login') }}" class="hover:text-white">Login</a></li>
                    <li><a href="{{ route('register') }}" class="hover:text-white">Register</a></li>
                    @endauth
                </ul>
            </div>
            <div>
                <h4 class="text-white font-semibold mb-3">Contact</h4>
                <p class="text-gray-400">support@admagpro.com</p>
            </div>
        </div>
        <div class="text-center text-gray-500 text-xs mt-8">&copy; {{ date('Y') }} AdMagPro.</div>
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
    </script>
</body>

</html>