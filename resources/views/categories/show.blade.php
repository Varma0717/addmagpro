@extends('layouts.app')
@section('title', $category->name)

@section('content')
{{-- Breadcrumb --}}
<nav class="flex items-center gap-2 text-sm text-surface-400 mb-6" data-animate>
    <a href="{{ route('home') }}" class="hover:text-brand-500 transition-colors">Home</a>
    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
    </svg>
    <span class="text-surface-800 font-medium">{{ $category->name }}</span>
</nav>

<div class="grid md:grid-cols-4 gap-6 lg:gap-8">
    {{-- Filters sidebar --}}
    <aside class="md:col-span-1">
        <form method="GET" class="space-y-4 sticky top-24">
            <div class="card p-5">
                <h3 class="font-semibold text-surface-800 mb-3 flex items-center gap-2">
                    <svg class="w-4 h-4 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818l.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                    Price Range
                </h3>
                <div class="space-y-2.5">
                    <div>
                        <label class="text-xs text-surface-500 font-medium">Min (₹)</label>
                        <input name="min_price" type="number" value="{{ request('min_price') }}" class="input mt-1">
                    </div>
                    <div>
                        <label class="text-xs text-surface-500 font-medium">Max (₹)</label>
                        <input name="max_price" type="number" value="{{ request('max_price') }}" class="input mt-1">
                    </div>
                </div>
            </div>

            <div class="card p-5">
                <h3 class="font-semibold text-surface-800 mb-3 flex items-center gap-2">
                    <svg class="w-4 h-4 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
                    </svg>
                    Min Rating
                </h3>
                <select name="min_rating" class="input">
                    <option value="">Any rating</option>
                    @foreach([4,3,2,1] as $r)
                    <option value="{{ $r }}" {{ request('min_rating') == $r ? 'selected' : '' }}>{{ $r }}+ stars</option>
                    @endforeach
                </select>
            </div>

            @if($brands->count())
            <div class="card p-5">
                <h3 class="font-semibold text-surface-800 mb-3 flex items-center gap-2">
                    <svg class="w-4 h-4 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9.568 3H5.25A2.25 2.25 0 003 5.25v4.318c0 .597.237 1.17.659 1.591l9.581 9.581c.699.699 1.78.872 2.607.33a18.095 18.095 0 005.223-5.223c.542-.827.369-1.908-.33-2.607L11.16 3.66A2.25 2.25 0 009.568 3z" />
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 6h.008v.008H6V6z" />
                    </svg>
                    Brand
                </h3>
                <select name="brand_id" class="input">
                    <option value="">All brands</option>
                    @foreach($brands as $brand)
                    <option value="{{ $brand->id }}" {{ request('brand_id') == $brand->id ? 'selected' : '' }}>{{ $brand->brand_name }}</option>
                    @endforeach
                </select>
            </div>
            @endif

            <div class="card p-5">
                <h3 class="font-semibold text-surface-800 mb-3 flex items-center gap-2">
                    <svg class="w-4 h-4 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3 7.5L7.5 3m0 0L12 7.5M7.5 3v13.5m13.5-4.5L16.5 16.5m0 0L12 12m4.5 4.5V3" />
                    </svg>
                    Sort By
                </h3>
                <select name="sort" class="input">
                    <option value="latest" {{ request('sort', 'latest') == 'latest' ? 'selected' : '' }}>Newest first</option>
                    <option value="price_asc" {{ request('sort') == 'price_asc' ? 'selected' : '' }}>Price: Low to High</option>
                    <option value="price_desc" {{ request('sort') == 'price_desc' ? 'selected' : '' }}>Price: High to Low</option>
                    <option value="rating" {{ request('sort') == 'rating' ? 'selected' : '' }}>Highest Rated</option>
                </select>
            </div>

            <button type="submit" class="btn-primary w-full">Apply Filters</button>
            <a href="{{ route('categories.show', $category->slug) }}" class="block text-center text-sm text-surface-400 hover:text-brand-500 transition-colors">Clear filters</a>
        </form>
    </aside>

    {{-- Products/Listings grid --}}
    <div class="md:col-span-3">
        <div class="flex items-center justify-between mb-5">
            <h1 class="text-xl font-display font-bold text-surface-900">{{ $category->name }}</h1>
            <span class="badge-info">{{ $items->total() }} results</span>
        </div>

        @if($category->type === 'ecommerce')
        <div class="grid grid-cols-2 md:grid-cols-3 gap-4 lg:gap-5">
            @forelse($items as $product)
            @include('partials.product-card', ['product' => $product])
            @empty
            <div class="col-span-3 text-center py-20">
                <svg class="w-16 h-16 text-surface-200 mx-auto mb-4" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
                </svg>
                <p class="text-surface-400 font-medium">No products found</p>
                <p class="text-surface-300 text-sm mt-1">Try adjusting your filters</p>
            </div>
            @endforelse
        </div>
        @else
        <div class="space-y-4">
            @forelse($items as $listing)
            <a href="{{ route('listings.show', $listing->slug) }}"
                class="flex gap-4 card-hover p-5">
                @if($listing->images->count())
                <img src="{{ imageUrl($listing->images->first()->image_path) }}" alt="{{ $listing->business_name }}" class="w-24 h-24 object-cover rounded-xl flex-shrink-0">
                @else
                <div class="w-24 h-24 bg-blue-50 rounded-xl flex items-center justify-center flex-shrink-0">
                    <svg class="w-10 h-10 text-blue-300" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35" />
                    </svg>
                </div>
                @endif
                <div class="flex-1 min-w-0">
                    <h3 class="font-semibold text-surface-900 truncate">{{ $listing->business_name }}</h3>
                    <p class="text-sm text-surface-500 mt-1">{{ $listing->address }}, {{ $listing->city }}</p>
                    @if($listing->reviews_avg_rating)
                    <div class="flex items-center gap-1.5 mt-2">
                        <div class="flex items-center gap-0.5">
                            @for($s = 1; $s <= 5; $s++)
                                <svg class="w-3.5 h-3.5 {{ $s <= round($listing->reviews_avg_rating) ? 'text-amber-400' : 'text-surface-200' }}" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
                                @endfor
                        </div>
                        <span class="text-sm font-medium text-surface-700">{{ number_format($listing->reviews_avg_rating, 1) }}</span>
                        <span class="text-xs text-surface-400">({{ $listing->reviews_count }})</span>
                    </div>
                    @endif
                    @if($listing->phone)
                    <p class="text-sm text-brand-500 mt-2 flex items-center gap-1.5">
                        <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z" />
                        </svg>
                        {{ $listing->phone }}
                    </p>
                    @endif
                </div>
            </a>
            @empty
            <div class="text-center py-20">
                <svg class="w-16 h-16 text-surface-200 mx-auto mb-4" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18" />
                </svg>
                <p class="text-surface-400 font-medium">No listings found</p>
                <p class="text-surface-300 text-sm mt-1">Try adjusting your filters</p>
            </div>
            @endforelse
        </div>
        @endif

        <div class="mt-8">{{ $items->withQueryString()->links() }}</div>
    </div>
</div>
@endsection