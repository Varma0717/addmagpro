<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'AddMagPro') }}</title>
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
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    @endif
</head>

<body class="font-sans text-surface-800 antialiased">
    <div class="min-h-screen flex">
        {{-- Left decorative panel --}}
        <div class="hidden lg:flex lg:w-1/2 bg-gradient-to-br from-brand-500 via-brand-600 to-brand-700 relative overflow-hidden items-center justify-center">
            <div class="relative z-10 text-center px-12">
                <div class="flex items-center justify-center mb-8">
                    <img src="{{ asset('assets/images/logo.png') }}" alt="AddMagPro" class="h-12 w-auto brightness-0 invert">
                </div>
                <p class="text-white/80 text-lg leading-relaxed max-w-md mx-auto">Your local commerce super app. Shop products, discover services, earn wallet rewards and referral bonuses.</p>
            </div>
            {{-- Background decoration --}}
            <div class="absolute top-0 right-0 w-72 h-72 bg-white/5 rounded-full -translate-y-1/2 translate-x-1/2"></div>
            <div class="absolute bottom-0 left-0 w-96 h-96 bg-white/5 rounded-full translate-y-1/2 -translate-x-1/2"></div>
        </div>

        {{-- Right form panel --}}
        <div class="flex-1 flex flex-col items-center justify-center py-12 px-6 bg-surface-50">
            <a href="/" class="lg:hidden flex items-center mb-8">
                <img src="{{ asset('assets/images/logo.png') }}" alt="AddMagPro" class="h-9 w-auto">
            </a>

            <div class="w-full max-w-md">
                <div class="card p-8">
                    {{ $slot }}
                </div>
            </div>
        </div>
    </div>
</body>

</html>