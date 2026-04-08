@extends('layouts.app')
@section('title', 'All Categories')

@section('content')
<div class="mb-8" data-animate>
    <h1 class="page-title">Browse Categories</h1>
    <p class="text-surface-500 mt-1">Explore products and local services near you</p>
</div>

<section class="mb-12" data-animate>
    <h2 class="section-title mb-5">Ecommerce</h2>
    <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
        @foreach($ecomCategories as $cat)
        <a href="{{ route('categories.show', $cat->slug) }}"
            class="flex flex-col items-center gap-3 p-5 bg-white rounded-2xl border border-surface-100 hover:border-brand-300 hover:shadow-soft transition-all duration-300 group">
            @if($cat->image)
            <img src="{{ Storage::url($cat->image) }}" alt="{{ $cat->name }}" class="w-16 h-16 object-cover rounded-xl group-hover:scale-110 transition-transform duration-300">
            @else
            <div class="w-16 h-16 bg-brand-50 rounded-xl flex items-center justify-center">
                <svg class="w-8 h-8 text-brand-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z" />
                </svg>
            </div>
            @endif
            <span class="text-sm text-center font-medium text-surface-700 group-hover:text-brand-600 transition-colors">{{ $cat->name }}</span>
        </a>
        @endforeach
    </div>
</section>

<section data-animate>
    <h2 class="section-title mb-5">Local Services</h2>
    <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
        @foreach($serviceCategories as $cat)
        <a href="{{ route('categories.show', $cat->slug) }}"
            class="flex flex-col items-center gap-3 p-5 bg-white rounded-2xl border border-surface-100 hover:border-blue-300 hover:shadow-soft transition-all duration-300 group">
            @if($cat->image)
            <img src="{{ Storage::url($cat->image) }}" alt="{{ $cat->name }}" class="w-16 h-16 object-cover rounded-xl group-hover:scale-110 transition-transform duration-300">
            @else
            <div class="w-16 h-16 bg-blue-50 rounded-xl flex items-center justify-center">
                <svg class="w-8 h-8 text-blue-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z" />
                </svg>
            </div>
            @endif
            <span class="text-sm text-center font-medium text-surface-700 group-hover:text-blue-600 transition-colors">{{ $cat->name }}</span>
        </a>
        @endforeach
    </div>
</section>
@endsection