@extends('layouts.account')
@section('page_title', 'Wallet')
@section('title', 'My Wallet')

@section('account_content')
<h2 class="text-xl font-bold text-gray-800 mb-4">My Wallet</h2>

<!-- Balance card -->
<div class="bg-gradient-to-r from-orange-500 to-orange-400 text-white rounded-2xl p-6 mb-6">
    <p class="text-sm opacity-80">Available Balance</p>
    <p class="text-4xl font-bold mt-1">₹{{ number_format(auth()->user()->wallet_balance, 2) }}</p>
    <p class="text-sm opacity-70 mt-2">Use at checkout to pay for orders.</p>
</div>

<!-- Top up button -->
<div class="bg-white rounded-xl border p-5 mb-6" x-data="walletTopup()">
    <h3 class="font-semibold text-gray-700 mb-3">Add Money to Wallet</h3>
    <div class="flex gap-3 flex-wrap mb-4">
        @foreach([100, 200, 500, 1000, 2000] as $amt)
        <button @click="amount = {{ $amt }}"
            :class="amount === {{ $amt }} ? 'border-orange-500 text-orange-600 bg-orange-50' : 'border-gray-300 text-gray-600'"
            class="px-4 py-2 border rounded-lg text-sm font-medium">₹{{ $amt }}</button>
        @endforeach
    </div>
    <div class="flex gap-3">
        <input x-model="amount" type="number" min="10" step="10" placeholder="Custom amount"
            class="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
        <button @click="topup()" :disabled="loading || !amount" class="px-5 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600 disabled:opacity-60">
            <span x-show="!loading">Add Money</span>
            <span x-show="loading">Processing…</span>
        </button>
    </div>
</div>

<!-- Transactions -->
<div class="bg-white rounded-xl border overflow-hidden">
    <div class="px-5 py-4 border-b font-semibold text-gray-700">Transaction History</div>
    @if($transactions->isEmpty())
    <p class="px-5 py-8 text-center text-gray-400">No transactions yet.</p>
    @else
    <div class="divide-y">
        @foreach($transactions as $tx)
        <div class="flex items-center gap-4 px-5 py-3">
            <div class="w-8 h-8 rounded-full flex items-center justify-center text-sm
                        {{ $tx->type === 'credit' ? 'bg-green-100 text-green-600' : 'bg-red-100 text-red-600' }}">
                {{ $tx->type === 'credit' ? '+' : '−' }}
            </div>
            <div class="flex-1">
                <p class="text-sm font-medium text-gray-800">{{ $tx->description }}</p>
                <p class="text-xs text-gray-400">{{ $tx->created_at->format('d M Y, h:i A') }}</p>
            </div>
            <p class="font-bold {{ $tx->type === 'credit' ? 'text-green-600' : 'text-red-600' }}">
                {{ $tx->type === 'credit' ? '+' : '−' }}₹{{ number_format($tx->amount, 2) }}
            </p>
        </div>
        @endforeach
    </div>
    <div class="px-5 py-4 border-t">{{ $transactions->links() }}</div>
    @endif
</div>
@endsection

@push('scripts')
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    function walletTopup() {
        return {
            amount: null,
            loading: false,
            topup() {
                if (!this.amount || this.amount < 10) {
                    alert('Minimum ₹10');
                    return;
                }
                this.loading = true;
                fetch('{{ route("account.wallet.topup.create") }}', {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                        },
                        body: JSON.stringify({
                            amount: this.amount
                        })
                    })
                    .then(r => r.json())
                    .then(d => {
                        const rzp = new Razorpay({
                            key: d.key,
                            amount: d.amount,
                            currency: 'INR',
                            order_id: d.order_id,
                            name: 'AdMagPro Wallet',
                            description: 'Wallet Top-Up',
                            handler: (response) => {
                                fetch('{{ route("account.wallet.topup.verify") }}', {
                                        method: 'POST',
                                        headers: {
                                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                                            'Content-Type': 'application/json',
                                            'Accept': 'application/json',
                                        },
                                        body: JSON.stringify({
                                            ...response,
                                            amount: this.amount
                                        })
                                    })
                                    .then(r => r.json())
                                    .then(d => {
                                        if (d.success) window.location.reload();
                                        else alert('Verification failed');
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
            }
        }
    }
</script>
@endpush