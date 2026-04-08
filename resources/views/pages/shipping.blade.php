@extends('layouts.app')
@section('title', 'Shipping & Delivery Policy')

@section('content')
<div class="max-w-4xl mx-auto">
    <nav class="flex items-center gap-2 text-sm text-surface-400 mb-6">
        <a href="{{ route('home') }}" class="hover:text-brand-500">Home</a>
        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5"/></svg>
        <span class="text-surface-600">Shipping & Delivery Policy</span>
    </nav>

    <div class="bg-white rounded-2xl shadow-soft border border-surface-100 p-8 md:p-12">
        <h1 class="font-display text-3xl font-bold text-surface-900 mb-6">Shipping & Delivery Policy</h1>

        <div class="prose prose-surface max-w-none text-surface-600 leading-relaxed">
            <p>Shipping is not applicable for business.</p>
        </div>
    </div>
</div>
@endsection
