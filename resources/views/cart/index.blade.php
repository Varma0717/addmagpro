@extends('layouts.app')
@section('title', 'My Cart')

@section('content')
<h1 class="text-2xl font-bold text-gray-800 mb-6">My Cart</h1>

@if($cartItems->isEmpty())
<div class="text-center py-20 bg-white rounded-2xl border">
    <p class="text-6xl mb-4">🛒</p>
    <p class="text-gray-500 text-lg mb-2">Your cart is empty</p>
    <a href="{{ route('categories.index') }}" class="mt-4 inline-block px-6 py-2.5 bg-orange-500 text-white rounded-xl hover:bg-orange-600">Start Shopping</a>
</div>
@else
<div class="grid lg:grid-cols-3 gap-6" x-data="cart()">
    <!-- Cart items -->
    <div class="lg:col-span-2 space-y-3" id="cart-items">
        @foreach($cartItems as $item)
        <div class="bg-white rounded-xl border p-4 flex gap-4" id="item-{{ $item->id }}">
            @php $img = $item->product->images->first(); @endphp
            @if($img)
            <img src="{{ Storage::url($img->image_path) }}" class="w-20 h-20 object-cover rounded-lg flex-shrink-0">
            @else
            <div class="w-20 h-20 bg-gray-100 rounded-lg flex items-center justify-center text-3xl flex-shrink-0">📦</div>
            @endif
            <div class="flex-1 min-w-0">
                <h3 class="font-medium text-gray-800 truncate">{{ $item->product->name }}</h3>
                <p class="text-orange-600 font-bold mt-1">₹{{ number_format($item->product->effective_price, 2) }}</p>
                <div class="flex items-center gap-3 mt-2">
                    <div class="flex items-center border border-gray-300 rounded-lg overflow-hidden">
                        <button onclick="updateQty({{ $item->id }}, {{ max(1, $item->quantity - 1) }})"
                            class="px-3 py-1 text-gray-600 hover:bg-gray-100">−</button>
                        <span id="qty-{{ $item->id }}" class="px-3 py-1 font-medium">{{ $item->quantity }}</span>
                        <button onclick="updateQty({{ $item->id }}, {{ $item->quantity + 1 }})"
                            class="px-3 py-1 text-gray-600 hover:bg-gray-100">+</button>
                    </div>
                    <button onclick="removeItem({{ $item->id }})" class="text-sm text-red-500 hover:underline">Remove</button>
                </div>
            </div>
            <div class="text-right">
                <span id="subtotal-{{ $item->id }}" class="font-bold text-gray-800">₹{{ number_format($item->subtotal, 2) }}</span>
            </div>
        </div>
        @endforeach
    </div>

    <!-- Order summary -->
    <div class="space-y-4">
        <div class="bg-white rounded-xl border p-5">
            <h2 class="font-semibold text-gray-700 mb-4">Order Summary</h2>

            <!-- Coupon -->
            <div class="flex gap-2 mb-4">
                <input id="coupon-input" type="text" placeholder="Coupon code"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400 uppercase">
                <button onclick="applyCoupon()" class="px-4 py-2 bg-gray-800 text-white rounded-lg text-sm hover:bg-gray-700">Apply</button>
            </div>
            <p id="coupon-msg" class="text-xs mb-3 hidden"></p>

            <div class="space-y-2 text-sm border-t pt-3">
                <div class="flex justify-between"><span class="text-gray-500">Subtotal</span><span id="summary-subtotal">₹{{ number_format($total, 2) }}</span></div>
                <div class="flex justify-between text-green-600 hidden" id="discount-row">
                    <span>Discount</span><span id="summary-discount">—</span>
                </div>
                <div class="flex justify-between font-bold text-base border-t pt-2 mt-2">
                    <span>Total</span><span id="summary-total">₹{{ number_format($total, 2) }}</span>
                </div>
            </div>

            <a href="{{ route('checkout.index') }}" class="mt-4 block w-full text-center py-3 bg-orange-500 text-white rounded-xl font-medium hover:bg-orange-600">
                Proceed to Checkout
            </a>
        </div>
    </div>
</div>
@endif
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
                    msg.className = 'text-xs mb-3 text-green-600';
                    msg.textContent = d.message;
                    document.getElementById('discount-row').classList.remove('hidden');
                    document.getElementById('summary-discount').textContent = '−₹' + d.discount;
                    document.getElementById('summary-total').textContent = '₹' + d.final_total;
                    // Store coupon in session via hidden form or URL param
                    sessionStorage.setItem('coupon_code', code);
                } else {
                    msg.className = 'text-xs mb-3 text-red-500';
                    msg.textContent = d.message;
                }
            });
    }
</script>
@endpush