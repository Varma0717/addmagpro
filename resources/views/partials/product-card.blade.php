<a href="{{ route('products.show', $product->slug) }}"
    class="card-hover group block overflow-hidden">
    @php $img = $product->images->first(); @endphp
    <div class="aspect-square overflow-hidden bg-surface-100 relative">
        @if($img)
        <img src="{{ imageUrl($img->image_path) }}" alt="{{ $product->name }}"
            class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
        @else
        <div class="w-full h-full flex items-center justify-center">
            <svg class="w-12 h-12 text-surface-300" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
            </svg>
        </div>
        @endif
        @if($product->sale_price)
        <span class="absolute top-2.5 left-2.5 bg-red-500 text-white text-[10px] font-bold px-2 py-0.5 rounded-full">
            -{{ round((($product->price - $product->sale_price) / $product->price) * 100) }}%
        </span>
        @endif
    </div>
    <div class="p-3.5">
        <p class="text-sm font-medium text-surface-800 truncate group-hover:text-brand-600 transition-colors">{{ $product->name }}</p>
        <div class="flex items-center gap-2 mt-1.5">
            <span class="text-base font-bold text-brand-600">₹{{ number_format($product->effective_price, 0) }}</span>
            @if($product->sale_price)
            <span class="text-xs text-surface-400 line-through">₹{{ number_format($product->price, 0) }}</span>
            @endif
        </div>
        @if($product->reviews_avg_rating)
        <div class="flex items-center gap-1 mt-1.5">
            <div class="flex items-center gap-0.5">
                @for($s = 1; $s <= 5; $s++)
                    <svg class="w-3 h-3 {{ $s <= round($product->reviews_avg_rating) ? 'text-amber-400' : 'text-surface-200' }}" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
                    @endfor
            </div>
            <span class="text-xs text-surface-400">{{ number_format($product->reviews_avg_rating, 1) }}</span>
        </div>
        @endif
    </div>
</a>