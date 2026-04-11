@extends('layouts.app')
@section('title', 'My Cart')

@section('content')
<div class="max-w-5xl mx-auto">
    <h1 class="page-title mb-8">
        <svg class="w-8 h-8 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
        </svg>
        My Cart
    </h1>

    @if($cartItems->isEmpty())
    <div class="card text-center py-20">
        <svg class="w-16 h-16 text-surface-300 mx-auto mb-4" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
        </svg>
        <p class="text-surface-500 text-lg mb-2">Your cart is empty</p>
        <a href="{{ route('categories.index') }}" class="btn-primary mt-4 inline-flex">Start Shopping</a>
    </div>
    @else
    <div class="grid lg:grid-cols-3 gap-6">
        {{-- Cart Items --}}
        <div class="lg:col-span-2 space-y-3" id="cart-items">
            @foreach($cartItems as $item)
            <div class="card-hover p-4 flex gap-4" id="item-{{ $item->id }}">
                @php $img = $item->product->images->first(); @endphp
                @if($img)
                <img src="{{ imageUrl($img->image_path) }}" class="w-20 h-20 object-cover rounded-xl flex-shrink-0" alt="">
                @else
                <div class="w-20 h-20 bg-surface-100 rounded-xl flex items-center justify-center flex-shrink-0">
                    <svg class="w-8 h-8 text-surface-300" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5m8.25 3v6.75m0 0-3-3m3 3 3-3M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
                    </svg>
                </div>
                @endif
                <div class="flex-1 min-w-0">
                    <h3 class="font-semibold text-surface-800 truncate">{{ $item->product->name }}</h3>
                    <p class="text-brand-600 font-bold mt-1">₹{{ number_format($item->product->effective_price, 2) }}</p>
                    <div class="flex items-center gap-3 mt-2">
                        <div class="flex items-center border border-surface-200 rounded-xl overflow-hidden">
                            <button onclick="updateQty({{ $item->id }}, {{ max(1, $item->quantity - 1) }})"
                                class="px-3 py-1.5 text-surface-600 hover:bg-surface-50 transition">−</button>
                            <span id="qty-{{ $item->id }}" class="px-3 py-1.5 font-semibold text-sm bg-surface-50">{{ $item->quantity }}</span>
                            <button onclick="updateQty({{ $item->id }}, {{ $item->quantity + 1 }})"
                                class="px-3 py-1.5 text-surface-600 hover:bg-surface-50 transition">+</button>
                        </div>
                        <button onclick="removeItem({{ $item->id }})" class="text-sm text-red-500 hover:text-red-700 font-medium transition">
                            <svg class="w-4 h-4 inline -mt-0.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                            </svg>
                            Remove
                        </button>
                    </div>
                </div>
                <div class="text-right">
                    <span id="subtotal-{{ $item->id }}" class="font-bold text-surface-800">₹{{ number_format($item->subtotal, 2) }}</span>
                </div>
            </div>
            @endforeach
        </div>

        {{-- Order Summary --}}
        <div class="space-y-4">
            <div class="card p-6 sticky top-24">
                <h2 class="font-bold text-surface-800 text-lg mb-4 flex items-center gap-2">
                    <svg class="w-5 h-5 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 14.25l6-6m4.5-3.493V21.75l-3.75-1.5-3.75 1.5-3.75-1.5-3.75 1.5V4.757c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0 1 11.186 0c1.1.128 1.907 1.077 1.907 2.185Z" />
                    </svg>
                    Order Summary
                </h2>

                {{-- Coupon --}}
                <div class="flex gap-2 mb-4">
                    <input id="coupon-input" type="text" placeholder="Coupon code"
                        class="input flex-1 text-sm uppercase" />
                    <button onclick="applyCoupon()" class="btn-secondary text-sm px-4">Apply</button>
                </div>
                <p id="coupon-msg" class="text-xs mb-3 hidden"></p>

                <div class="space-y-2.5 text-sm border-t border-surface-100 pt-4">
                    <div class="flex justify-between"><span class="text-surface-500">Subtotal</span><span id="summary-subtotal" class="font-medium">₹{{ number_format($total, 2) }}</span></div>
                    <div class="flex justify-between text-emerald-600 hidden" id="discount-row">
                        <span>Discount</span><span id="summary-discount">—</span>
                    </div>
                    <div class="flex justify-between font-bold text-lg border-t border-surface-100 pt-3 mt-3">
                        <span>Total</span><span id="summary-total" class="text-brand-600">₹{{ number_format($total, 2) }}</span>
                    </div>
                </div>

                <a href="{{ route('checkout.index') }}" class="btn-primary w-full justify-center mt-5 py-3 text-base">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 0 0 2.25-2.25V6.75A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25v10.5A2.25 2.25 0 0 0 4.5 19.5Z" />
                    </svg>
                    Proceed to Checkout
                </a>
            </div>
        </div>
    </div>
    @endif
</div>
@endsection

@push('scripts')
<script>
    const cartBaseUrl = "{{ url('/cart') }}";
    const cartCouponUrl = "{{ route('cart.validate-coupon') }}";

    function updateQty(itemId, qty) {
        fetch(`${cartBaseUrl}/${itemId}`, {
                method: 'PATCH',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                },
                body: JSON.stringify({
                    quantity: qty
                })
            })
            .then(r => r.json())
            .then(d => {
                if (d.removed) {
                    document.getElementById('item-' + itemId)?.remove();
                } else {
                    document.getElementById('qty-' + itemId).textContent = qty;
                    document.getElementById('subtotal-' + itemId).textContent = '₹' + d.subtotal;
                    document.getElementById('summary-subtotal').textContent = '₹' + d.total;
                    document.getElementById('summary-total').textContent = '₹' + d.total;
                }
            });
    }

    function removeItem(itemId) {
        fetch(`${cartBaseUrl}/${itemId}`, {
                method: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Accept': 'application/json'
                }
            })
            .then(r => r.json())
            .then(d => {
                document.getElementById('item-' + itemId)?.remove();
                document.getElementById('summary-subtotal').textContent = '₹' + d.total;
                document.getElementById('summary-total').textContent = '₹' + d.total;
            });
    }

    function applyCoupon() {
        const code = document.getElementById('coupon-input').value;
        fetch(cartCouponUrl, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                },
                body: JSON.stringify({
                    code
                })
            })
            .then(r => r.json())
            .then(d => {
                const msg = document.getElementById('coupon-msg');
                msg.classList.remove('hidden');
                if (d.valid) {
                    msg.className = 'text-xs mb-3 text-emerald-600';
                    msg.textContent = d.message;
                    document.getElementById('discount-row').classList.remove('hidden');
                    document.getElementById('summary-discount').textContent = '−₹' + d.discount;
                    document.getElementById('summary-total').textContent = '₹' + d.final_total;
                    sessionStorage.setItem('coupon_code', code);
                } else {
                    msg.className = 'text-xs mb-3 text-red-500';
                    msg.textContent = d.message;
                }
            });
    }
</script>
@endpush