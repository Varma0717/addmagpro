<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\WalletTransaction;
use App\Services\RazorpayService;
use App\Services\WalletService;
use Illuminate\Http\Request;

class WalletController extends Controller
{
    public function __construct(
        private readonly WalletService $walletService,
        private readonly RazorpayService $razorpay,
    ) {}

    public function index()
    {
        $user         = auth()->user();
        $transactions = WalletTransaction::where('user_id', $user->id)->latest()->paginate(20);

        return view('account.wallet', compact('user', 'transactions'));
    }

    public function transactions()
    {
        $transactions = WalletTransaction::where('user_id', auth()->id())->latest()->paginate(20);

        return view('account.transactions', compact('transactions'));
    }

    public function createTopup(Request $request)
    {
        $request->validate(['amount' => 'required|integer|min:10|max:50000']);

        $amountInPaise = $request->amount * 100;
        $order = $this->razorpay->createOrder($amountInPaise, 'INR', ['purpose' => 'wallet_topup']);

        return response()->json([
            'order_id' => $order['id'],
            'amount'   => $order['amount'],
            'currency' => $order['currency'],
            'key_id'   => $this->razorpay->getKeyId(),
        ]);
    }

    public function verifyTopup(Request $request)
    {
        $request->validate([
            'razorpay_order_id'   => 'required|string',
            'razorpay_payment_id' => 'required|string',
            'razorpay_signature'  => 'required|string',
            'amount'              => 'required|integer|min:10',
        ]);

        $valid = $this->razorpay->verifyPaymentSignature(
            $request->razorpay_order_id,
            $request->razorpay_payment_id,
            $request->razorpay_signature
        );

        if (!$valid) return back()->with('error', 'Payment verification failed.');

        $user = auth()->user();
        $this->walletService->credit($user, $request->amount, 'Wallet top-up', 'razorpay', null);

        return back()->with('success', "₹{$request->amount} added to your wallet.");
    }
}
