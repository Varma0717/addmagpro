@extends('layouts.app')
@section('title', 'All Categories')

@section('content')
<h1 class="text-2xl font-bold text-gray-800 mb-6">Browse Categories</h1>

<h2 class="text-lg font-semibold text-gray-700 mb-4">Ecommerce</h2>
<div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4 mb-10">
    @foreach($ecomCategories as $cat)
    <a href="{{ route('categories.show', $cat->slug) }}"
        class="flex flex-col items-center gap-2 p-4 bg-white rounded-xl border hover:border-orange-400 hover:shadow-sm transition-all group">
        @if($cat->image)
        <img src="{{ Storage::url($cat->image) }}" class="w-14 h-14 object-cover rounded-lg">
        @else
        <div class="w-14 h-14 bg-orange-100 rounded-lg flex items-center justify-center text-3xl">🛍️</div>
        @endif
        <span class="text-sm text-center font-medium text-gray-700 group-hover:text-orange-600">{{ $cat->name }}</span>
    </a>
    @endforeach
</div>

<h2 class="text-lg font-semibold text-gray-700 mb-4">Local Services</h2>
<div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
    @foreach($serviceCategories as $cat)
    <a href="{{ route('categories.show', $cat->slug) }}"
        class="flex flex-col items-center gap-2 p-4 bg-white rounded-xl border hover:border-orange-400 hover:shadow-sm transition-all group">
        @if($cat->image)
        <img src="{{ Storage::url($cat->image) }}" class="w-14 h-14 object-cover rounded-lg">
        @else
        <div class="w-14 h-14 bg-blue-100 rounded-lg flex items-center justify-center text-3xl">🏪</div>
        @endif
        <span class="text-sm text-center font-medium text-gray-700 group-hover:text-orange-600">{{ $cat->name }}</span>
    </a>
    @endforeach
</div>
@endsection