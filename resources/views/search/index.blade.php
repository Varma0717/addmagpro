@extends('layouts.app')
@section('title', 'Search: ' . request('q'))

@section('content')
<h1 class="text-xl font-bold text-gray-800 mb-2">Search results for "<span class="text-orange-600">{{ request('q') }}</span>"</h1>
<p class="text-sm text-gray-500 mb-6">{{ $products->count() }} products &bull; {{ $listings->count() }} services</p>

@if($products->count())
<h2 class="text-lg font-semibold text-gray-700 mb-4">Products</h2>
<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4 mb-10">
    @foreach($products as $product)
    @include('partials.product-card', ['product' => $product])
    @endforeach
</div>
@endif

@if($listings->count())
<h2 class="text-lg font-semibold text-gray-700 mb-4">Services & Businesses</h2>
<div class="space-y-3">
    @foreach($listings as $listing)
    <a href="{{ route('listings.show', $listing->slug) }}"
        class="flex gap-4 bg-white rounded-xl border p-4 hover:shadow-md transition-all">
        @if($listing->images->count())
        <img src="{{ Storage::url($listing->images->first()->image_path) }}" class="w-20 h-20 object-cover rounded-lg flex-shrink-0">
        @else
        <div class="w-20 h-20 bg-gray-100 rounded-lg flex items-center justify-center text-2xl flex-shrink-0">🏪</div>
        @endif
        <div>
            <h3 class="font-semibold text-gray-800">{{ $listing->business_name }}</h3>
            <p class="text-sm text-gray-500">{{ $listing->category->name }} &bull; {{ $listing->city }}</p>
            @if($listing->phone)
            <p class="text-sm text-orange-500 mt-1">{{ $listing->phone }}</p>
            @endif
        </div>
    </a>
    @endforeach
</div>
@endif

@if($products->isEmpty() && $listings->isEmpty())
<div class="text-center py-20">
    <p class="text-5xl mb-4">🔍</p>
    <p class="text-gray-500">No results found for "{{ request('q') }}".</p>
    <p class="text-sm text-gray-400 mt-2">Try different keywords or browse categories.</p>
    <a href="{{ route('categories.index') }}" class="mt-4 inline-block px-5 py-2 bg-orange-500 text-white rounded-xl text-sm hover:bg-orange-600">Browse Categories</a>
</div>
@endif
@endsection