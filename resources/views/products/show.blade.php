@extends('layouts.app')
@section('title', $product->name)

@section('content')
<div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
    <a href="{{ route('home') }}" class="hover:text-orange-500">Home</a>
    <span>/</span>
    <a href="{{ route('categories.show', $product->category->slug) }}" class="hover:text-orange-500">{{ $product->category->name }}</a>
    <span>/</span>
    <span class="text-gray-800">{{ $product->name }}</span>
</div>

<div class="grid md:grid-cols-2 gap-8 mb-10">
    <!-- Images -->
    <div x-data="{ active: 0 }">
        @if($product->images->count())
        <div class="aspect-square rounded-2xl overflow-hidden bg-gray-100 mb-3">
            @foreach($product->images as $i => $img)
            <img x-show="active === {{ $i }}" src="{{ Storage::url($img->image_path) }}"
                class="w-full h-full object-cover" alt="{{ $product->name }}">
            @endforeach
        </div>
        @if($product->images->count() > 1)
        <div class="flex gap-2 overflow-x-auto">
            @foreach($product->images as $i => $img)
            <button @click="active = {{ $i }}"
                :class="active === {{ $i }} ? 'ring-2 ring-orange-400' : ''"
                class="w-16 h-16 flex-shrink-0 rounded-lg overflow-hidden border">
                <img src="{{ Storage::url($img->image_path) }}" class="w-full h-full object-cover">
            </button>
            @endforeach
        </div>
        @endif
        @else
        <div class="aspect-square rounded-2xl bg-gray-100 flex items-center justify-center text-7xl">📦</div>
        @endif
    </div>

    <!-- Product info -->
    <div>
        <h1 class="text-2xl font-bold text-gray-900 mb-2">{{ $product->name }}</h1>

        @if($product->reviews->count())
        <div class="flex items-center gap-2 mb-3">
            <div class="flex text-yellow-400">
                @for($i = 1; $i <= 5; $i++)
                    <span>{{ $i <= round($product->reviews->avg('rating')) ? '★' : '☆' }}</span>
                    @endfor
            </div>
            <span class="text-sm text-gray-500">({{ $product->reviews->count() }} reviews)</span>
        </div>
        @endif

        <div class="flex items-baseline gap-3 mb-4">
            <span class="text-3xl font-bold text-orange-600">₹{{ number_format($product->effective_price, 2) }}</span>
            @if($product->sale_price)
            <span class="text-lg text-gray-400 line-through">₹{{ number_format($product->price, 2) }}</span>
            <span class="px-2 py-1 bg-green-100 text-green-700 text-sm rounded-full font-medium">
                {{ round((($product->price - $product->sale_price) / $product->price) * 100) }}% off
            </span>
            @endif
        </div>

        <p class="text-gray-600 mb-6 leading-relaxed">{{ $product->description }}</p>

        @if($product->stock_qty > 0)
        <p class="text-sm text-green-600 font-medium mb-4">✓ In Stock ({{ $product->stock_qty }} left)</p>

        <div class="flex gap-3" x-data="{ qty: 1 }">
            <div class="flex items-center border border-gray-300 rounded-lg overflow-hidden">
                <button @click="qty = Math.max(1, qty - 1)" class="px-3 py-2 text-gray-600 hover:bg-gray-100">−</button>
                <span x-text="qty" class="px-4 py-2 font-medium w-12 text-center"></span>
                <button @click="qty = Math.min({{ $product->stock_qty }}, qty + 1)" class="px-3 py-2 text-gray-600 hover:bg-gray-100">+</button>
            </div>
            @auth
            <button @click="addToCart({{ $product->id }}, qty)"
                class="flex-1 py-2 bg-orange-500 text-white rounded-lg font-medium hover:bg-orange-600">
                Add to Cart
            </button>
            <button @click="toggleWishlist({{ $product->id }}, $el)"
                class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-red-50 hover:border-red-400 text-gray-600 hover:text-red-500 {{ $wishlisted ? 'text-red-500 border-red-400 bg-red-50' : '' }}">
                ♥
            </button>
            @else
            <a href="{{ route('login') }}" class="flex-1 py-2 text-center bg-orange-500 text-white rounded-lg font-medium hover:bg-orange-600">
                Login to Buy
            </a>
            @endauth
        </div>
        @else
        <p class="text-sm text-red-500 font-medium">Out of Stock</p>
        @endif
    </div>
</div>

<!-- Reviews -->
<div class="mb-10">
    <h2 class="text-lg font-bold text-gray-800 mb-4">Customer Reviews</h2>

    @auth
    <form method="POST" action="{{ route('products.review', $product->slug) }}" class="bg-white rounded-xl border p-5 mb-6">
        @csrf
        <h3 class="font-medium text-gray-700 mb-3">Write a Review</h3>
        <div class="flex gap-2 mb-3" x-data="{ rating: 0 }">
            @for($i = 1; $i <= 5; $i++)
                <button type="button" @click="rating = {{ $i }}"
                :class="rating >= {{ $i }} ? 'text-yellow-400' : 'text-gray-300'"
                class="text-2xl transition-colors">★</button>
                <input type="hidden" name="rating" :value="rating">
                @endfor
        </div>
        <textarea name="comment" rows="3" placeholder="Share your experience…"
            class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400 mb-3"></textarea>
        <button class="px-5 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">Submit Review</button>
    </form>
    @endauth

    <div class="space-y-4">
        @forelse($product->reviews as $review)
        <div class="bg-white rounded-xl border p-4">
            <div class="flex items-center gap-3 mb-2">
                <div class="w-8 h-8 rounded-full bg-orange-100 text-orange-600 font-bold text-sm flex items-center justify-center">
                    {{ strtoupper(substr($review->user->name ?? 'U', 0, 1)) }}
                </div>
                <div>
                    <p class="text-sm font-medium">{{ $review->user->name ?? 'User' }}</p>
                    <div class="text-yellow-400 text-xs">{{ str_repeat('★', $review->rating) }}{{ str_repeat('☆', 5 - $review->rating) }}</div>
                </div>
                <span class="ml-auto text-xs text-gray-400">{{ $review->created_at->diffForHumans() }}</span>
            </div>
            <p class="text-sm text-gray-600">{{ $review->comment }}</p>
        </div>
        @empty
        <p class="text-gray-400 text-sm">No reviews yet. Be the first!</p>
        @endforelse
    </div>
</div>

<!-- Related products -->
@if($relatedProducts->count())
<div>
    <h2 class="text-lg font-bold text-gray-800 mb-4">You May Also Like</h2>
    <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4">
        @foreach($relatedProducts as $rp)
        @include('partials.product-card', ['product' => $rp])
        @endforeach
    </div>
</div>
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
                    btn.classList.add('text-red-500', 'border-red-400', 'bg-red-50');
                } else {
                    btn.classList.remove('text-red-500', 'border-red-400', 'bg-red-50');
                }
            });
    }
</script>
@endpush