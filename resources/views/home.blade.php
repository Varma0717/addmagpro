@extends('layouts.app')
@section('title', 'AdMagPro')

@section('content')

{{-- Banner Carousel --}}
@if($carouselBanners->count())
<div class="relative mb-8 rounded-2xl overflow-hidden" x-data="carousel({{ $carouselBanners->count() }})">
    <div class="relative h-52 md:h-80">
        @foreach($carouselBanners as $i => $banner)
        <div x-show="current === {{ $i }}" class="absolute inset-0 transition-opacity duration-500">
            <img src="{{ Storage::url($banner->image_path) }}" class="w-full h-full object-cover">
            @if($banner->link_url)
            <a href="{{ $banner->link_url }}" class="absolute inset-0"></a>
            @endif
            @if($banner->title)
            <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/60 to-transparent px-6 py-4">
                <p class="text-white text-lg font-semibold">{{ $banner->title }}</p>
            </div>
            @endif
        </div>
        @endforeach
    </div>
    <!-- Dots -->
    @if($carouselBanners->count() > 1)
    <div class="absolute bottom-3 left-0 right-0 flex justify-center gap-2">
        @foreach($carouselBanners as $i => $banner)
        <button @click="current = {{ $i }}"
            :class="current === {{ $i }} ? 'bg-white w-6' : 'bg-white/50 w-2'"
            class="h-2 rounded-full transition-all duration-300"></button>
        @endforeach
    </div>
    @endif
</div>
@endif

{{-- Ecommerce categories --}}
<section class="mb-10">
    <div class="flex items-center justify-between mb-4">
        <h2 class="text-lg font-bold text-gray-800">Shop by Category</h2>
        <a href="{{ route('categories.index') }}" class="text-sm text-orange-500 hover:underline">View all →</a>
    </div>
    <div class="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 gap-3">
        @foreach($ecomCategories as $cat)
        <a href="{{ route('categories.show', $cat->slug) }}"
            class="flex flex-col items-center gap-2 p-3 bg-white rounded-xl border hover:border-orange-400 hover:shadow-sm transition-all group">
            @if($cat->image)
            <img src="{{ Storage::url($cat->image) }}" class="w-12 h-12 object-cover rounded-lg">
            @else
            <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-2xl">🛍️</div>
            @endif
            <span class="text-xs text-center text-gray-700 group-hover:text-orange-600 font-medium leading-tight">{{ $cat->name }}</span>
        </a>
        @endforeach
    </div>
</section>

{{-- Featured Products --}}
@if($featuredProducts->count())
<section class="mb-10">
    <div class="flex items-center justify-between mb-4">
        <h2 class="text-lg font-bold text-gray-800">Featured Products</h2>
    </div>
    <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4">
        @foreach($featuredProducts as $product)
        @include('partials.product-card', ['product' => $product])
        @endforeach
    </div>
</section>
@endif

{{-- Mid banner --}}
@if($midBanners->count())
<div class="mb-10 rounded-2xl overflow-hidden">
    <img src="{{ Storage::url($midBanners->first()->image_path) }}" class="w-full h-36 md:h-48 object-cover">
</div>
@endif

{{-- Service categories --}}
<section class="mb-10">
    <div class="flex items-center justify-between mb-4">
        <h2 class="text-lg font-bold text-gray-800">Find Local Services</h2>
        <a href="{{ route('categories.index') }}" class="text-sm text-orange-500 hover:underline">View all →</a>
    </div>
    <div class="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-7 gap-3">
        @foreach($serviceCategories as $cat)
        <a href="{{ route('categories.show', $cat->slug) }}"
            class="flex flex-col items-center gap-2 p-3 bg-white rounded-xl border hover:border-orange-400 hover:shadow-sm transition-all group">
            @if($cat->image)
            <img src="{{ Storage::url($cat->image) }}" class="w-10 h-10 object-cover rounded-lg">
            @else
            <div class="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center text-xl">🏪</div>
            @endif
            <span class="text-xs text-center text-gray-700 group-hover:text-orange-600 font-medium leading-tight">{{ $cat->name }}</span>
        </a>
        @endforeach
    </div>
</section>

{{-- New Products --}}
@if($newProducts->count())
<section class="mb-10">
    <div class="flex items-center justify-between mb-4">
        <h2 class="text-lg font-bold text-gray-800">New Arrivals</h2>
    </div>
    <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4">
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
                    }, 4000);
                }
            }
        }
    }
</script>
@endpush