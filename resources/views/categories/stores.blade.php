@extends('layouts.app')
@section('title', 'Stores Directory — AddMagPro')

@section('content')
<div class="mb-8" data-animate>
    <h1 class="page-title">Stores</h1>
    <p class="text-surface-500 mt-1">Find the best local stores near you</p>
</div>

{{-- Search --}}
<div class="mb-8" data-animate>
    <form action="{{ route('categories.stores') }}" method="GET" class="relative max-w-lg">
        <input type="text" name="q" value="{{ $search ?? '' }}" placeholder="Search stores..."
            class="w-full pl-11 pr-4 py-3 rounded-xl border border-surface-200 bg-white focus:border-brand-400 focus:ring-2 focus:ring-brand-100 text-sm transition-all">
        <svg class="absolute left-3.5 top-1/2 -translate-y-1/2 w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"/>
        </svg>
    </form>
</div>

@if($stores->isEmpty())
<div class="text-center py-16">
    <svg class="w-16 h-16 text-surface-300 mx-auto mb-4" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z"/>
    </svg>
    <p class="text-surface-500 text-lg">No stores found{{ $search ? ' for "' . $search . '"' : '' }}.</p>
</div>
@else
<div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4" data-animate>
    @foreach($stores as $store)
    <a href="{{ route('categories.show', $store->slug) }}"
        class="group block bg-white rounded-2xl border border-surface-100 hover:border-brand-300 hover:shadow-soft transition-all duration-300 overflow-hidden">
        <div class="aspect-[4/3] overflow-hidden bg-gradient-to-br from-brand-50 to-brand-100 flex items-center justify-center">
            @if($store->image)
            <img src="{{ imageUrl($store->image) }}" alt="{{ $store->name }}"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
            @else
            <svg class="w-12 h-12 text-brand-300" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 01.75-.75h3a.75.75 0 01.75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349m-16.5 11.65V9.35m0 0a3.001 3.001 0 003.75-.615A2.993 2.993 0 009.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 002.25 1.016c.896 0 1.7-.393 2.25-1.016a3.001 3.001 0 003.75.614m-16.5 0a3.004 3.004 0 01-.621-4.72L4.318 3.44A1.5 1.5 0 015.378 3h13.243a1.5 1.5 0 011.06.44l1.19 1.189a3 3 0 01-.621 4.72m-13.5 8.65h3.75a.75.75 0 00.75-.75V13.5a.75.75 0 00-.75-.75H6.75a.75.75 0 00-.75.75v3.75c0 .415.336.75.75.75z"/>
            </svg>
            @endif
        </div>
        <div class="p-3 text-center">
            <h3 class="text-sm font-semibold text-surface-800 group-hover:text-brand-600 transition-colors truncate">{{ $store->name }}</h3>
        </div>
    </a>
    @endforeach
</div>
@endif
@endsection
