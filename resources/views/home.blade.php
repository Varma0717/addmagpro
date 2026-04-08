@extends('layouts.app')
@section('title', 'AddMagPro — Local Commerce & Deals')

@section('content')

{{-- Banner Carousel --}}
@if($carouselBanners->count())
<div class="relative mb-10 rounded-3xl overflow-hidden shadow-card" x-data="carousel({{ $carouselBanners->count() }})">
    <div class="relative h-56 md:h-[380px]">
        @foreach($carouselBanners as $i => $banner)
        <div x-show="current === {{ $i }}"
            x-transition:enter="transition ease-out duration-700" x-transition:enter-start="opacity-0 scale-105" x-transition:enter-end="opacity-100 scale-100"
            x-transition:leave="transition ease-in duration-300" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
            class="absolute inset-0">
            <img src="{{ Storage::url($banner->image_path) }}" alt="{{ $banner->title }}" class="w-full h-full object-cover">
            @if($banner->link_url)
            <a href="{{ $banner->link_url }}" class="absolute inset-0"></a>
            @endif
            @if($banner->title)
            <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/70 via-black/30 to-transparent px-8 py-6">
                <p class="text-white font-display text-xl md:text-2xl font-bold">{{ $banner->title }}</p>
            </div>
            @endif
        </div>
        @endforeach
    </div>
    {{-- Dots --}}
    @if($carouselBanners->count() > 1)
    <div class="absolute bottom-4 left-0 right-0 flex justify-center gap-2">
        @foreach($carouselBanners as $i => $banner)
        <button @click="current = {{ $i }}"
            :class="current === {{ $i }} ? 'bg-white w-8' : 'bg-white/40 w-2.5'"
            class="h-2.5 rounded-full transition-all duration-500 hover:bg-white/80"></button>
        @endforeach
    </div>
    @endif
    {{-- Nav arrows --}}
    @if($carouselBanners->count() > 1)
    <button @click="current = (current - 1 + {{ $carouselBanners->count() }}) % {{ $carouselBanners->count() }}"
        class="absolute left-4 top-1/2 -translate-y-1/2 w-10 h-10 rounded-full bg-white/20 backdrop-blur-sm text-white hover:bg-white/40 flex items-center justify-center transition-all">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
        </svg>
    </button>
    <button @click="current = (current + 1) % {{ $carouselBanners->count() }}"
        class="absolute right-4 top-1/2 -translate-y-1/2 w-10 h-10 rounded-full bg-white/20 backdrop-blur-sm text-white hover:bg-white/40 flex items-center justify-center transition-all">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
        </svg>
    </button>
    @endif
</div>
@endif

{{-- Shop by Category --}}
<section class="mb-12" data-animate>
    <div class="flex items-center justify-between mb-6">
        <h2 class="section-title">Shop by Category</h2>
        <a href="{{ route('categories.index') }}" class="text-sm text-brand-500 hover:text-brand-600 font-medium flex items-center gap-1 transition-colors">
            View all
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
            </svg>
        </a>
    </div>
    <div class="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 gap-4">
        @foreach($ecomCategories as $cat)
        <a href="{{ route('categories.show', $cat->slug) }}"
            class="flex flex-col items-center gap-3 p-4 bg-white rounded-2xl border border-surface-100 hover:border-brand-300 hover:shadow-soft transition-all duration-300 group">
            @if($cat->image)
            <img src="{{ Storage::url($cat->image) }}" alt="{{ $cat->name }}" class="w-14 h-14 object-cover rounded-xl group-hover:scale-110 transition-transform duration-300">
            @else
            <div class="w-14 h-14 bg-brand-50 rounded-xl flex items-center justify-center">
                <svg class="w-7 h-7 text-brand-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" />
                </svg>
            </div>
            @endif
            <span class="text-xs text-center text-surface-700 group-hover:text-brand-600 font-medium leading-tight">{{ $cat->name }}</span>
        </a>
        @endforeach
    </div>
</section>

{{-- Featured Products --}}
@if($featuredProducts->count())
<section class="mb-12" data-animate>
    <div class="flex items-center justify-between mb-6">
        <h2 class="section-title">Featured Products</h2>
    </div>
    <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4 lg:gap-5">
        @foreach($featuredProducts as $product)
        @include('partials.product-card', ['product' => $product])
        @endforeach
    </div>
</section>
@endif

{{-- Mid Banner --}}
@if($midBanners->count())
<div class="mb-12 rounded-3xl overflow-hidden shadow-card" data-animate>
    <img src="{{ Storage::url($midBanners->first()->image_path) }}" alt="" class="w-full h-40 md:h-56 object-cover">
</div>
@endif

{{-- Local Services --}}
<section class="mb-12" data-animate>
    <div class="flex items-center justify-between mb-6">
        <h2 class="section-title">Find Local Services</h2>
        <a href="{{ route('categories.index') }}" class="text-sm text-brand-500 hover:text-brand-600 font-medium flex items-center gap-1 transition-colors">
            View all
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
            </svg>
        </a>
    </div>
    <div class="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-7 gap-3">
        @foreach($serviceCategories as $cat)
        <a href="{{ route('categories.show', $cat->slug) }}"
            class="flex flex-col items-center gap-2.5 p-3 bg-white rounded-2xl border border-surface-100 hover:border-blue-300 hover:shadow-soft transition-all duration-300 group">
            @if($cat->image)
            <img src="{{ Storage::url($cat->image) }}" alt="{{ $cat->name }}" class="w-11 h-11 object-cover rounded-xl group-hover:scale-110 transition-transform duration-300">
            @else
            <div class="w-11 h-11 bg-blue-50 rounded-xl flex items-center justify-center">
                <svg class="w-6 h-6 text-blue-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" />
                </svg>
            </div>
            @endif
            <span class="text-xs text-center text-surface-700 group-hover:text-blue-600 font-medium leading-tight">{{ $cat->name }}</span>
        </a>
        @endforeach
    </div>
</section>

{{-- New Arrivals --}}
@if($newProducts->count())
<section class="mb-12" data-animate>
    <div class="flex items-center justify-between mb-6">
        <h2 class="section-title">New Arrivals</h2>
    </div>
    <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4 lg:gap-5">
        @foreach($newProducts as $product)
        @include('partials.product-card', ['product' => $product])
        @endforeach
    </div>
</section>
@endif

@endsection

@push('scripts')
<script>
    function carousel(total) {
        return {
            current: 0,
            init() {
                if (total > 1) {
                    setInterval(() => {
                        this.current = (this.current + 1) % total;
                    }, 5000);
                }
            }
        }
    }
</script>
@endpush