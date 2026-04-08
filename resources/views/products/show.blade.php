@extends('layouts.app')
@section('title', $product->name)

@section('content')
{{-- Breadcrumb --}}
<nav class="flex items-center gap-2 text-sm text-surface-400 mb-6">
    <a href="{{ route('home') }}" class="hover:text-brand-500 transition-colors">Home</a>
    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
    </svg>
    <a href="{{ route('categories.show', $product->category->slug) }}" class="hover:text-brand-500 transition-colors">{{ $product->category->name }}</a>
    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
    </svg>
    <span class="text-surface-700 font-medium truncate">{{ $product->name }}</span>
</nav>

<div class="grid md:grid-cols-2 gap-8 lg:gap-12 mb-12" data-animate>
    {{-- Images --}}
    <div x-data="{ active: 0 }">
        @if($product->images->count())
        <div class="aspect-square rounded-3xl overflow-hidden bg-surface-100 mb-4 shadow-card">
            @foreach($product->images as $i => $img)
            <img x-show="active === {{ $i }}"
                x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
                src="{{ Storage::url($img->image_path) }}" class="w-full h-full object-cover" alt="{{ $product->name }}">
            @endforeach
        </div>
        @if($product->images->count() > 1)
        <div class="flex gap-2.5 overflow-x-auto pb-1">
            @foreach($product->images as $i => $img)
            <button @click="active = {{ $i }}"
                :class="active === {{ $i }} ? 'ring-2 ring-brand-400 ring-offset-2' : 'ring-1 ring-surface-200'"
                class="w-18 h-18 flex-shrink-0 rounded-xl overflow-hidden transition-all duration-200">
                <img src="{{ Storage::url($img->image_path) }}" class="w-full h-full object-cover">
            </button>
            @endforeach
        </div>
        @endif
        @else
        <div class="aspect-square rounded-3xl bg-surface-100 flex items-center justify-center">
            <svg class="w-24 h-24 text-surface-200" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
            </svg>
        </div>
        @endif
    </div>

    {{-- Product info --}}
    <div>
        <h1 class="font-display text-2xl lg:text-3xl font-bold text-surface-900 mb-3">{{ $product->name }}</h1>

        @if($product->reviews->count())
        <div class="flex items-center gap-3 mb-4">
            <div class="flex items-center gap-0.5">
                @for($i = 1; $i <= 5; $i++)
                    <svg class="w-5 h-5 {{ $i <= round($product->reviews->avg('rating')) ? 'text-amber-400' : 'text-surface-200' }}" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
                    @endfor
            </div>
            <span class="text-sm text-surface-500">({{ $product->reviews->count() }} reviews)</span>
        </div>
        @endif

        <div class="flex items-baseline gap-3 mb-5">
            <span class="text-3xl font-bold text-brand-600">₹{{ number_format($product->effective_price, 2) }}</span>
            @if($product->sale_price)
            <span class="text-lg text-surface-400 line-through">₹{{ number_format($product->price, 2) }}</span>
            <span class="badge-success text-sm">
                {{ round((($product->price - $product->sale_price) / $product->price) * 100) }}% off
            </span>
            @endif
        </div>

        <p class="text-surface-600 mb-6 leading-relaxed">{{ $product->description }}</p>

        @if($product->stock_qty > 0)
        <div class="flex items-center gap-2 mb-5">
            <svg class="w-5 h-5 text-emerald-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span class="text-sm text-emerald-600 font-medium">In Stock ({{ $product->stock_qty }} left)</span>
        </div>

        <div class="flex gap-3" x-data="{ qty: 1 }">
            <div class="flex items-center border border-surface-200 rounded-xl overflow-hidden bg-white">
                <button @click="qty = Math.max(1, qty - 1)" class="px-4 py-3 text-surface-500 hover:bg-surface-50 transition-colors font-medium">−</button>
                <span x-text="qty" class="px-4 py-3 font-semibold text-surface-800 w-14 text-center"></span>
                <button @click="qty = Math.min({{ $product->stock_qty }}, qty + 1)" class="px-4 py-3 text-surface-500 hover:bg-surface-50 transition-colors font-medium">+</button>
            </div>
            @auth
            <button @click="addToCart({{ $product->id }}, qty)" class="btn-primary flex-1 flex items-center justify-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
                </svg>
                Add to Cart
            </button>
            <button @click="toggleWishlist({{ $product->id }}, $el)"
                class="p-3 rounded-xl border transition-all duration-200 {{ $wishlisted ? 'text-red-500 border-red-300 bg-red-50' : 'text-surface-400 border-surface-200 hover:border-red-300 hover:text-red-500 hover:bg-red-50' }}">
                <svg class="w-5 h-5" fill="{{ $wishlisted ? 'currentColor' : 'none' }}" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                </svg>
            </button>
            @else
            <a href="{{ route('login') }}" class="btn-primary flex-1 text-center">Login to Buy</a>
            @endauth
        </div>
        @else
        <div class="flex items-center gap-2 text-red-500">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
            </svg>
            <span class="text-sm font-medium">Out of Stock</span>
        </div>
        @endif
    </div>
</div>

{{-- Reviews --}}
<section class="mb-12" data-animate>
    <h2 class="section-title mb-5">Customer Reviews</h2>

    @auth
    <form method="POST" action="{{ route('products.review', $product->slug) }}" class="card p-6 mb-6">
        @csrf
        <h3 class="font-semibold text-surface-800 mb-4">Write a Review</h3>
        <div class="flex gap-1.5 mb-4" x-data="{ rating: 0 }">
            @for($i = 1; $i <= 5; $i++)
                <button type="button" @click="rating = {{ $i }}"
                :class="rating >= {{ $i }} ? 'text-amber-400 scale-110' : 'text-surface-200'"
                class="text-3xl transition-all duration-200 hover:scale-110">
                <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                </svg>
                </button>
                <input type="hidden" name="rating" :value="rating">
                @endfor
        </div>
        <textarea name="comment" rows="3" placeholder="Share your experience…" class="input mb-4"></textarea>
        <button class="btn-primary">Submit Review</button>
    </form>
    @endauth

    <div class="space-y-4">
        @forelse($product->reviews as $review)
        <div class="card p-5">
            <div class="flex items-center gap-3 mb-3">
                <div class="w-9 h-9 rounded-full bg-gradient-to-br from-brand-400 to-brand-600 text-white font-bold text-sm flex items-center justify-center">
                    {{ strtoupper(substr($review->user->name ?? 'U', 0, 1)) }}
                </div>
                <div>
                    <p class="text-sm font-semibold text-surface-800">{{ $review->user->name ?? 'User' }}</p>
                    <div class="flex items-center gap-0.5 mt-0.5">
                        @for($s = 1; $s <= 5; $s++)
                            <svg class="w-3 h-3 {{ $s <= $review->rating ? 'text-amber-400' : 'text-surface-200' }}" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
                            @endfor
                    </div>
                </div>
                <span class="ml-auto text-xs text-surface-400">{{ $review->created_at->diffForHumans() }}</span>
            </div>
            <p class="text-sm text-surface-600 leading-relaxed">{{ $review->comment }}</p>
        </div>
        @empty
        <p class="text-surface-400 text-sm text-center py-8">No reviews yet. Be the first!</p>
        @endforelse
    </div>
</section>

{{-- Related products --}}
@if($relatedProducts->count())
<section data-animate>
    <h2 class="section-title mb-5">You May Also Like</h2>
    <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4 lg:gap-5">
        @foreach($relatedProducts as $rp)
        @include('partials.product-card', ['product' => $rp])
        @endforeach
    </div>
</section>
@endif

@endsection

@push('scripts')
<script>
    function addToCart(productId, qty) {
        fetch('{{ route("cart.add") }}', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                },
                body: JSON.stringify({
                    product_id: productId,
                    quantity: qty
                })
            })
            .then(r => r.json())
            .then(d => {
                if (d.success) alert(d.message || 'Added to cart!');
                else alert(d.message || 'Error adding to cart.');
            });
    }

    function toggleWishlist(productId, btn) {
        fetch('{{ route("account.wishlist.toggle") }}', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                },
                body: JSON.stringify({
                    product_id: productId
                })
            })
            .then(r => r.json())
            .then(d => {
                if (d.added) {
                    btn.classList.add('text-red-500', 'border-red-300', 'bg-red-50');
                    btn.querySelector('svg').setAttribute('fill', 'currentColor');
                } else {
                    btn.classList.remove('text-red-500', 'border-red-300', 'bg-red-50');
                    btn.querySelector('svg').setAttribute('fill', 'none');
                }
            });
    }
</script>
@endpush