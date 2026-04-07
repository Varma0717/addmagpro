@extends('layouts.app')
@section('title', 'Checkout')

@section('content')
<h1 class="text-2xl font-bold text-gray-800 mb-6">Checkout</h1>

<div class="grid lg:grid-cols-3 gap-8" x-data="checkout()">
    <!-- Left: Address + Payment -->
    <div class="lg:col-span-2 space-y-6">

        <!-- Shipping address -->
        <div class="bg-white rounded-xl border p-6">
            <h2 class="font-semibold text-gray-700 mb-4">Shipping Address</h2>
            <div class="grid md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                    <input x-model="address.name" value="{{ auth()->user()->name }}" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Phone</label>
                    <input x-model="address.phone" value="{{ auth()->user()->phone }}" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div class="md:col-span-2">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Address</label>
                    <input x-model="address.address" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">City</label>
                    <input x-model="address.city" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">State</label>
                    <input x-model="address.state" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Pincode</label>
                    <input x-model="address.pincode" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
            </div>
        </div>

        <!-- Coupon -->
        <div class="bg-white rounded-xl border p-5">
            <h2 class="font-semibold text-gray-700 mb-3">Coupon</h2>
            <div class="flex gap-2">
                <input x-model="couponCode" type="text" placeholder="Enter coupon code"
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400 uppercase">
                <button @click="validateCoupon()" class="px-4 py-2 bg-gray-800 text-white rounded-lg text-sm hover:bg-gray-700">Apply</button>
            </div>
            <p x-show="couponMsg" x-text="couponMsg" :class="couponValid ? 'text-green-600' : 'text-red-500'" class="text-xs mt-2"></p>
        </div>

        <!-- Wallet -->
        @if(auth()->user()->wallet_balance > 0)
        <div class="bg-white rounded-xl border p-5">
            <label class="flex items-center gap-3 cursor-pointer">
                <input type="checkbox" x-model="useWallet" class="w-4 h-4 text-orange-500">
                <div>
                    <p class="font-medium text-gray-700">Use Wallet Balance</p>
                    <p class="text-sm text-green-600">Available: ₹{{ number_format(auth()->user()->wallet_balance, 2) }}</p>
                </div>
            </label>
        </div>
        @endif

        <!-- Payment method -->
        <div class="bg-white rounded-xl border p-5">
            <h2 class="font-semibold text-gray-700 mb-3">Payment Method</h2>
            <div class="space-y-2">
                <label class="flex items-center gap-3 cursor-pointer">
                    <input type="radio" x-model="paymentMethod" value="razorpay" class="text-orange-500">
                    <span class="font-medium text-gray-700">Pay Online (Razorpay — UPI, Cards, NetBanking)</span>
                </label>
                <label class="flex items-center gap-3 cursor-pointer">
                    <input type="radio" x-model="paymentMethod" value="cod" class="text-orange-500">
                    <span class="font-medium text-gray-700">Cash on Delivery (COD)</span>
                </label>
                <label class="flex items-center gap-3 cursor-pointer" x-show="walletCoversAll">
                    <input type="radio" x-model="paymentMethod" value="wallet" class="text-orange-500">
                    <span class="font-medium text-gray-700">Pay fully from Wallet</span>
                </label>
            </div>
        </div>
    </div>

    <!-- Right: Order summary -->
    <div class="space-y-4">
        <div class="bg-white rounded-xl border p-5">
            <h2 class="font-semibold text-gray-700 mb-4">Order Summary</h2>
            <div class="space-y-3 text-sm">
                @foreach($cartItems as $item)
                <div class="flex justify-between">
                    <span class="text-gray-600 truncate pr-2">{{ $item->product->name }} ×{{ $item->quantity }}</span>
                    <span class="font-medium whitespace-nowrap">₹{{ number_format($item->subtotal, 2) }}</span>
                </div>
                @endforeach
            </div>
            <hr class="my-3">
            <div class="text-sm space-y-2">
                <div class="flex justify-between"><span class="text-gray-500">Subtotal</span><span>₹{{ number_format($subtotal, 2) }}</span></div>
                <div class="flex justify-between text-green-600" x-show="discount > 0">
                    <span>Coupon Discount</span><span>−₹<span x-text="discount.toFixed(2)"></span></span>
                </div>
                <div class="flex justify-between text-blue-600" x-show="useWallet && walletDeduction > 0">
                    <span>Wallet Used</span><span>−₹<span x-text="walletDeduction.toFixed(2)"></span></span>
                </div>
                <div class="flex justify-between font-bold text-base border-t pt-2">
                    <span>Total</span>
                    <span>₹<span x-text="finalTotal.toFixed(2)"></span></span>
                </div>
            </div>

            <button @click="placeOrder()"
                :disabled="loading"
                class="mt-4 w-full py-3 bg-orange-500 text-white rounded-xl font-bold hover:bg-orange-600 disabled:opacity-60">
                <span x-show="!loading">Place Order</span>
                <span x-show="loading">Processing…</span>
            </button>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    function checkout() {
        return {
            address: {
                name: '',
                phone: '',
                address: '',
                city: '',
                state: '',
                pincode: ''
            },
            paymentMethod: 'razorpay',
            couponCode: sessionStorage.getItem('coupon_code') || '',
            couponMsg: '',
            couponValid: false,
            discount: 0,
            useWallet: false,
            loading: false,
            subtotal: {
                {
                    $subtotal
                }
            },
            walletBalance: {
                {
                    auth() - > user() - > wallet_balance
                }
            },

            get walletDeduction() {
                if (!this.useWallet) return 0;
                return Math.min(this.walletBalance, this.subtotal - this.discount);
            },
            get finalTotal() {
                return Math.max(0, this.subtotal - this.discount - this.walletDeduction);
            },
            get walletCoversAll() {
                return this.walletBalance >= (this.subtotal - this.discount);
            },

            validateCoupon() {
                fetch('/cart/validate-coupon', {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                        },
                        body: JSON.stringify({
                            code: this.couponCode
                        })
                    })
                    .then(r => r.json())
                    .then(d => {
                        this.couponValid = d.valid;
                        this.couponMsg = d.message;
                        this.discount = d.valid ? parseFloat(d.discount) : 0;
                    });
            },

            placeOrder() {
                if (!this.address.name || !this.address.address || !this.address.city || !this.address.pincode) {
                    alert('Please fill in all address fields.');
                    return;
                }
                this.loading = true;

                const payload = {
                    address: this.address,
                    payment_method: this.paymentMethod,
                    coupon_code: this.couponValid ? this.couponCode : null,
                    use_wallet: this.useWallet,
                };

                if (this.paymentMethod === 'razorpay') {
                    this.handleRazorpay(payload);
                } else {
                    this.submitOrder({
                        ...payload,
                        razorpay_payment_id: null,
                        razorpay_order_id: null,
                        razorpay_signature: null
                    });
                }
            },

            handleRazorpay(payload) {
                fetch('{{ route("checkout.razorpay.create") }}', {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                        },
                        body: JSON.stringify(payload)
                    })
                    .then(r => r.json())
                    .then(d => {
                        if (!d.order_id) {
                            alert(d.message || 'Error');
                            this.loading = false;
                            return;
                        }
                        const rzp = new Razorpay({
                            key: d.key,
                            amount: d.amount,
                            currency: 'INR',
                            order_id: d.order_id,
                            name: 'AdMagPro',
                            description: 'Order Payment',
                            handler: (response) => {
                                this.submitOrder({
                                    ...payload,
                                    ...response
                                });
                            },
                            modal: {
                                ondismiss: () => {
                                    this.loading = false;
                                }
                            }
                        });
                        rzp.open();
                    });
            },

            submitOrder(payload) {
                fetch('{{ route("checkout.place-order") }}', {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                        },
                        body: JSON.stringify(payload)
                    })
                    .then(r => r.json())
                    .then(d => {
                        if (d.success) {
                            sessionStorage.removeItem('coupon_code');
                            window.location.href = d.redirect;
                        } else {
                            alert(d.message || 'Order failed. Please try again.');
                            this.loading = false;
                        }
                    });
            }
        }
    }
</script>
@endpush