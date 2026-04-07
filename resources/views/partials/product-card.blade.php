<a href="{{ route('products.show', $product->slug) }}"
    class="bg-white rounded-xl border hover:shadow-md transition-all group overflow-hidden block">
    @php $img = $product->images->first(); @endphp
    <div class="aspect-square overflow-hidden bg-gray-100">
        @if($img)
        <img src="{{ Storage::url($img->image_path) }}" alt="{{ $product->name }}"
            class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300">
        @else
        <div class="w-full h-full flex items-center justify-center text-4xl">📦</div>
        @endif
    </div>
    <div class="p-3">
        <p class="text-sm font-medium text-gray-800 truncate group-hover:text-orange-600">{{ $product->name }}</p>
        <div class="flex items-center gap-2 mt-1">
            <span class="text-base font-bold text-orange-600">₹{{ number_format($product->effective_price, 0) }}</span>
            @if($product->sale_price)
            <span class="text-xs text-gray-400 line-through">₹{{ number_format($product->price, 0) }}</span>
            <span class="text-xs text-green-600 font-medium">
                {{ round((($product->price - $product->sale_price) / $product->price) * 100) }}% off
            </span>
            @endif
        </div>
        @if($product->reviews_avg_rating)
        <div class="flex items-center gap-1 mt-1">
            <span class="text-yellow-400 text-xs">★</span>
            <span class="text-xs text-gray-500">{{ number_format($product->reviews_avg_rating, 1) }}</span>
        </div>
        @endif
    </div>
</a>