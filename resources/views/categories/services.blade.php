@extends('layouts.app')
@section('title', 'Services Directory — AddMagPro')

@section('content')
<div class="mb-8" data-animate>
    <h1 class="page-title">Services</h1>
    <p class="text-surface-500 mt-1">Find trusted local service providers near you</p>
</div>

{{-- Search --}}
<div class="mb-8" data-animate>
    <form action="{{ route('categories.services') }}" method="GET" class="relative max-w-lg">
        <input type="text" name="q" value="{{ $search ?? '' }}" placeholder="Search services..."
            class="w-full pl-11 pr-4 py-3 rounded-xl border border-surface-200 bg-white focus:border-blue-400 focus:ring-2 focus:ring-blue-100 text-sm transition-all">
        <svg class="absolute left-3.5 top-1/2 -translate-y-1/2 w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"/>
        </svg>
    </form>
</div>

@if($services->isEmpty())
<div class="text-center py-16">
    <svg class="w-16 h-16 text-surface-300 mx-auto mb-4" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M11.42 15.17l-5.1-5.1a7.065 7.065 0 010-9.99 7.065 7.065 0 019.99 0 7.065 7.065 0 010 9.99l-5.1 5.1a.75.75 0 01-1.06 0z"/>
    </svg>
    <p class="text-surface-500 text-lg">No services found{{ $search ? ' for "' . $search . '"' : '' }}.</p>
</div>
@else
<div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4" data-animate>
    @foreach($services as $service)
    <a href="{{ route('categories.show', $service->slug) }}"
        class="group block bg-white rounded-2xl border border-surface-100 hover:border-blue-300 hover:shadow-soft transition-all duration-300 overflow-hidden">
        <div class="aspect-[4/3] overflow-hidden bg-gradient-to-br from-blue-50 to-blue-100 flex items-center justify-center">
            @if($service->image)
            <img src="{{ Storage::url($service->image) }}" alt="{{ $service->name }}"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
            @else
            <svg class="w-12 h-12 text-blue-300" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M11.42 15.17l-5.1-5.1m0 0a7.002 7.002 0 019.9 0m-9.9 0a7.002 7.002 0 000 9.9m9.9-9.9a7.002 7.002 0 010 9.9M9.227 9.227L5.09 5.09M15.17 15.17l4.138 4.138"/>
            </svg>
            @endif
        </div>
        <div class="p-3 text-center">
            <h3 class="text-sm font-semibold text-surface-800 group-hover:text-blue-600 transition-colors truncate">{{ $service->name }}</h3>
        </div>
    </a>
    @endforeach
</div>
@endif
@endsection
