@extends('layouts.account')
@section('page_title', 'Wishlist')
@section('title', 'My Wishlist')

@section('account_content')
<h2 class="text-xl font-bold text-gray-800 mb-4">My Wishlist</h2>

@if($wishlists->isEmpty())
<div class="bg-white rounded-xl border py-16 text-center">
    <p class="text-5xl mb-3">♥</p>
    <p class="text-gray-500">Your wishlist is empty.</p>
    <a href="{{ route('categories.index') }}" class="mt-4 inline-block px-5 py-2 bg-orange-500 text-white rounded-xl text-sm">Browse Products</a>
</div>
@else
<div class="grid grid-cols-2 md:grid-cols-3 gap-4">
    @foreach($items as $w)
    @include('partials.product-card', ['product' => $w->product])
    @endforeach
</div>
@endif
@endsection