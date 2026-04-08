@extends('layouts.account')
@section('page_title', 'Wallet')
@section('title', 'My Wallet')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-5 flex items-center gap-2">
    <svg class="w-6 h-6 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 0 0-2.25-2.25H15a3 3 0 1 1-6 0H5.25A2.25 2.25 0 0 0 3 12m18 0v6a2.25 2.25 0 0 1-2.25 2.25H5.25A2.25 2.25 0 0 1 3 18v-6m18 0V9M3 12V9m18 0a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 9m18 0V6a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 6v3" />
    </svg>
    My Wallet
</h2>

{{-- Balance Card --}}
<div class="bg-gradient-to-br from-brand-500 via-brand-600 to-brand-700 text-white rounded-2xl p-7 mb-6 shadow-glow relative overflow-hidden">
    <div class="absolute top-0 right-0 w-40 h-40 bg-white/5 rounded-full -translate-y-1/2 translate-x-1/2"></div>
    <div class="absolute bottom-0 left-0 w-24 h-24 bg-white/5 rounded-full translate-y-1/2 -translate-x-1/2"></div>
    <p class="text-sm opacity-80 flex items-center gap-1.5">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 0 0-2.25-2.25H15a3 3 0 1 1-6 0H5.25A2.25 2.25 0 0 0 3 12m18 0v6a2.25 2.25 0 0 1-2.25 2.25H5.25A2.25 2.25 0 0 1 3 18v-6m18 0V9M3 12V9m18 0a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 9m18 0V6a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 6v3" />
        </svg>
        Available Balance
    </p>
    <p class="text-4xl font-bold font-display mt-2 relative">₹{{ number_format(auth()->user()->wallet_balance, 2) }}</p>
    <p class="text-sm opacity-70 mt-2">Use at checkout to pay for orders.</p>
</div>

{{-- Top Up --}}
<div class="card p-6 mb-6" x-data="walletTopup()">
    <h3 class="font-semibold text-surface-800 mb-4 flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
        </svg>
        Add Money to Wallet
    </h3>
    <div class="flex gap-2.5 flex-wrap mb-4">
        @foreach([100, 200, 500, 1000, 2000] as $amt)
        <button @click="amount = {{ $amt }}"
            :class="amount === {{ $amt }} ? 'border-brand-500 text-brand-600 bg-brand-50 ring-1 ring-brand-200' : 'border-surface-200 text-surface-600 hover:border-surface-300'"
            class="px-4 py-2.5 border rounded-xl text-sm font-semibold transition-all">₹{{ $amt }}</button>
        @endforeach
    </div>
    <div class="flex gap-3">
        <input x-model="amount" type="number" min="10" step="10" placeholder="Custom amount"
            class="input flex-1 text-sm" />
        <button @click="topup()" :disabled="loading || !amount" class="btn-primary px-6 disabled:opacity-60">
            <span x-show="!loading">Add Money</span>
            <span x-show="loading">Processing…</span>
        </button>
    </div>
</div>

{{-- Transactions --}}
<div class="card overflow-hidden">
    <div class="px-6 py-4 border-b border-surface-100 font-semibold text-surface-700 flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3 7.5 7.5 3m0 0L12 7.5M7.5 3v13.5m13.5 0L16.5 21m0 0L12 16.5m4.5 4.5V7.5" />
        </svg>
        Transaction History
    </div>
    @if($transactions->isEmpty())
    <div class="px-6 py-12 text-center">
        <svg class="w-10 h-10 text-surface-300 mx-auto mb-2" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3 7.5 7.5 3m0 0L12 7.5M7.5 3v13.5m13.5 0L16.5 21m0 0L12 16.5m4.5 4.5V7.5" />
        </svg>
        <p class="text-surface-400">No transactions yet.</p>
    </div>
    @else
    <div class="divide-y divide-surface-100">
        @foreach($transactions as $tx)
        <div class="flex items-center gap-4 px-6 py-4">
            <div class="w-9 h-9 rounded-full flex items-center justify-center text-sm font-bold
                        {{ $tx->type === 'credit' ? 'bg-emerald-100 text-emerald-600' : 'bg-red-100 text-red-600' }}">
                @if($tx->type === 'credit')
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 10.5 12 3m0 0 7.5 7.5M12 3v18" />
                </svg>
                @else
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 13.5 12 21m0 0-7.5-7.5M12 21V3" />
                </svg>
                @endif
            </div>
            <div class="flex-1">
                <p class="text-sm font-semibold text-surface-800">{{ $tx->description }}</p>
                <p class="text-xs text-surface-400 mt-0.5">{{ $tx->created_at->format('d M Y, h:i A') }}</p>
            </div>
            <p class="font-bold {{ $tx->type === 'credit' ? 'text-emerald-600' : 'text-red-600' }}">
                {{ $tx->type === 'credit' ? '+' : '−' }}₹{{ number_format($tx->amount, 2) }}
            </p>
        </div>
        @endforeach
    </div>
    <div class="px-6 py-4 border-t border-surface-100">{{ $transactions->links() }}</div>
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