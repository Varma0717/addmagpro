@extends('layouts.account')
@section('page_title', 'Wishlist')
@section('title', 'My Wishlist')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-5 flex items-center gap-2">
    <svg class="w-6 h-6 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" />
    </svg>
    My Wishlist
</h2>

@if($wishlists->isEmpty())
<div class="card text-center py-16">
    <svg class="w-14 h-14 text-surface-300 mx-auto mb-3" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" />
    </svg>
    <p class="text-surface-500">Your wishlist is empty.</p>
    <a href="{{ route('categories.index') }}" class="btn-primary mt-4 inline-flex">Browse Products</a>
</div>
@else
<div class="grid grid-cols-2 md:grid-cols-3 gap-4">
    @foreach($items as $w)
    @include('partials.product-card', ['product' => $w->product])
    @endforeach
</div>
@endif
@endsection