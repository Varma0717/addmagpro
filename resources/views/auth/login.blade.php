<x-guest-layout>
    {{-- Header --}}
    <div class="text-center mb-8">
        <div class="inline-flex items-center justify-center w-14 h-14 rounded-2xl bg-gradient-to-br from-brand-500 to-brand-600 shadow-glow mb-4">
            <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
            </svg>
        </div>
        <h2 class="text-2xl font-bold font-display text-surface-900">Welcome Back</h2>
        <p class="text-surface-500 mt-1">Sign in to your account</p>
    </div>

    {{-- Session Status --}}
    @if (session('status'))
    <div class="mb-4 rounded-xl bg-emerald-50 border border-emerald-200 p-4 flex items-center gap-3">
        <svg class="w-5 h-5 text-emerald-500 shrink-0" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
        </svg>
        <p class="text-sm text-emerald-700">{{ session('status') }}</p>
    </div>
    @endif

    <form method="POST" action="{{ route('login') }}" class="space-y-5">
        @csrf

        {{-- Email --}}
        <div>
            <label for="email" class="block text-sm font-semibold text-surface-700 mb-1.5">Email Address</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                    <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75" />
                    </svg>
                </span>
                <input id="email" type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="username"
                    class="input pl-11" placeholder="you@example.com" />
            </div>
            @error('email') <p class="mt-1.5 text-sm text-red-600">{{ $message }}</p> @enderror
        </div>

        {{-- Password --}}
        <div>
            <label for="password" class="block text-sm font-semibold text-surface-700 mb-1.5">Password</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3.5 pointer-events-none">
                    <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 1 0-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 0 0 2.25-2.25v-6.75a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0-2.25 2.25v6.75a2.25 2.25 0 0 0 2.25 2.25Z" />
                    </svg>
                </span>
                <input id="password" type="password" name="password" required autocomplete="current-password"
                    class="input pl-11" placeholder="••••••••" />
            </div>
            @error('password') <p class="mt-1.5 text-sm text-red-600">{{ $message }}</p> @enderror
        </div>

        {{-- Remember + Forgot --}}
        <div class="flex items-center justify-between">
            <label for="remember_me" class="inline-flex items-center gap-2 cursor-pointer">
                <input id="remember_me" type="checkbox" name="remember"
                    class="w-4 h-4 rounded border-surface-300 text-brand-600 focus:ring-brand-500 transition" />
                <span class="text-sm text-surface-600">Remember me</span>
            </label>

            @if (Route::has('password.request'))
            <a href="{{ route('password.request') }}" class="text-sm font-semibold text-brand-600 hover:text-brand-700 transition">
                Forgot password?
            </a>
            @endif
        </div>

        {{-- Submit --}}
        <button type="submit" class="btn-primary w-full justify-center text-base py-3">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
            </svg>
            Sign In
        </button>
    </form>

    {{-- Register Link --}}
    <p class="mt-8 text-center text-sm text-surface-500">
        Don't have an account?
        <a href="{{ route('register') }}" class="font-semibold text-brand-600 hover:text-brand-700 transition">Create one free</a>
    </p>
</x-guest-layout>