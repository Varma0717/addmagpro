@extends('layouts.app')
@section('title', $category->name)

@section('content')
<div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
    <a href="{{ route('home') }}" class="hover:text-orange-500">Home</a>
    <span>/</span>
    <span class="text-gray-800 font-medium">{{ $category->name }}</span>
</div>

<div class="grid md:grid-cols-4 gap-6">
    <!-- Filters sidebar -->
    <aside class="md:col-span-1">
        <form method="GET" class="space-y-4">
            <div class="bg-white rounded-xl border p-4">
                <h3 class="font-semibold text-gray-700 mb-3">Price Range</h3>
                <div class="space-y-2">
                    <div>
                        <label class="text-xs text-gray-500">Min (₹)</label>
                        <input name="min_price" type="number" value="{{ request('min_price') }}"
                            class="w-full border border-gray-300 rounded-lg px-3 py-1.5 text-sm mt-1 focus:outline-none focus:ring-2 focus:ring-orange-400">
                    </div>
                    <div>
                        <label class="text-xs text-gray-500">Max (₹)</label>
                        <input name="max_price" type="number" value="{{ request('max_price') }}"
                            class="w-full border border-gray-300 rounded-lg px-3 py-1.5 text-sm mt-1 focus:outline-none focus:ring-2 focus:ring-orange-400">
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-xl border p-4">
                <h3 class="font-semibold text-gray-700 mb-3">Min Rating</h3>
                <select name="min_rating" class="w-full border border-gray-300 rounded-lg px-3 py-1.5 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    <option value="">Any</option>
                    @foreach([4,3,2,1] as $r)
                    <option value="{{ $r }}" {{ request('min_rating') == $r ? 'selected' : '' }}>{{ $r }}★ & above</option>
                    @endforeach
                </select>
            </div>

            <button type="submit" class="w-full py-2 bg-orange-500 text-white rounded-xl text-sm hover:bg-orange-600">Apply Filters</button>
            <a href="{{ route('categories.show', $category->slug) }}" class="block text-center text-sm text-gray-500 hover:text-orange-500">Clear filters</a>
        </form>
    </aside>

    <!-- Products/Listings grid -->
    <div class="md:col-span-3">
        <div class="flex items-center justify-between mb-4">
            <h1 class="text-xl font-bold text-gray-800">{{ $category->name }}</h1>
            <span class="text-sm text-gray-500">{{ $items->total() }} results</span>
        </div>

        @if($category->type === 'ecommerce')
        <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
            @forelse($items as $product)
            @include('partials.product-card', ['product' => $product])
            @empty
            <p class="col-span-3 text-center text-gray-400 py-14">No products found.</p>
            @endforelse
        </div>
        @else
        <div class="space-y-4">
            @forelse($items as $listing)
            <a href="{{ route('listings.show', $listing->slug) }}"
                class="flex gap-4 bg-white rounded-xl border p-4 hover:shadow-md transition-all">
                @if($listing->images->count())
                <img src="{{ Storage::url($listing->images->first()->image_path) }}" class="w-24 h-24 object-cover rounded-lg flex-shrink-0">
                @else
                <div class="w-24 h-24 bg-gray-100 rounded-lg flex items-center justify-center text-3xl flex-shrink-0">🏪</div>
                @endif
                <div class="flex-1 min-w-0">
                    <h3 class="font-semibold text-gray-800 truncate">{{ $listing->business_name }}</h3>
                    <p class="text-sm text-gray-500 mt-1">{{ $listing->address }}, {{ $listing->city }}</p>
                    @if($listing->reviews_avg_rating)
                    <div class="flex items-center gap-1 mt-1">
                        <span class="text-yellow-400 text-sm">★</span>
                        <span class="text-sm font-medium">{{ number_format($listing->reviews_avg_rating, 1) }}</span>
                        <span class="text-xs text-gray-400">({{ $listing->reviews_count }} reviews)</span>
                    </div>
                    @endif
                    @if($listing->phone)
                    <p class="text-sm text-orange-500 mt-1">📞 {{ $listing->phone }}</p>
                    @endif
                </div>
            </a>
            @empty
            <p class="text-center text-gray-400 py-14">No listings found.</p>
            @endforelse
        </div>
        @endif

        <div class="mt-6">{{ $items->withQueryString()->links() }}</div>
    </div>
</div>
@endsection