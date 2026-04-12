<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\UserWithdrawRequest;
use App\Models\WalletTransaction;
use App\Services\RazorpayService;
use App\Services\WalletService;
use App\Support\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class WalletController extends Controller
{
    use ApiResponse;

    public function __construct(
        private readonly WalletService $walletService,
        private readonly RazorpayService $razorpay,
    ) {}

    public function show(Request $request)
    {
        $user = $request->user();
        $perPage = min((int) $request->integer('per_page', 20), 50);

        $transactions = WalletTransaction::query()
            ->where('user_id', $user->id)
            ->latest()
            ->paginate($perPage)
            ->withQueryString();

        $withdrawRequests = UserWithdrawRequest::query()
            ->where('user_id', $user->id)
            ->latest()
            ->take(5)
            ->get();

        return $this->success([
            'balance' => round((float) $user->wallet_balance, 2),
            'preset_amounts' => [100, 200, 500, 1000, 2000],
            'transactions' => $transactions->getCollection()->map(function (WalletTransaction $transaction): array {
                return [
                    'id' => $transaction->id,
                    'type' => $transaction->type,
                    'amount' => round((float) $transaction->amount, 2),
                    'description' => $transaction->description,
                    'reference_type' => $transaction->reference_type,
                    'balance_after' => round((float) $transaction->balance_after, 2),
                    'created_at' => $transaction->created_at,
                ];
            })->values(),
            'recent_withdraw_requests' => $withdrawRequests->map(function (UserWithdrawRequest $withdrawRequest): array {
                return [
                    'id' => $withdrawRequest->id,
                    'request_no' => $withdrawRequest->request_no,
                    'amount' => round((float) $withdrawRequest->amount, 2),
                    'status' => $withdrawRequest->status,
                    'remarks' => $withdrawRequest->remarks,
                    'created_at' => $withdrawRequest->created_at,
                ];
            })->values(),
        ], 'Wallet fetched', 200, [
            'pagination' => [
                'current_page' => $transactions->currentPage(),
                'last_page' => $transactions->lastPage(),
                'per_page' => $transactions->perPage(),
                'total' => $transactions->total(),
            ],
        ]);
    }

    public function createTopup(Request $request)
    {
        $validated = $request->validate([
            'amount' => ['required', 'integer', 'min:10', 'max:50000'],
        ]);

        $order = $this->razorpay->createOrder($validated['amount'] * 100, 'INR', ['purpose' => 'wallet_topup']);

        return $this->success([
            'order_id' => $order['id'],
            'amount' => $order['amount'],
            'currency' => $order['currency'],
            'key_id' => $this->razorpay->getKeyId(),
        ], 'Wallet top-up order created');
    }

    public function verifyTopup(Request $request)
    {
        $validated = $request->validate([
            'razorpay_order_id' => ['required', 'string'],
            'razorpay_payment_id' => ['required', 'string'],
            'razorpay_signature' => ['required', 'string'],
            'amount' => ['required', 'integer', 'min:10'],
        ]);

        $valid = $this->razorpay->verifyPaymentSignature(
            $validated['razorpay_order_id'],
            $validated['razorpay_payment_id'],
            $validated['razorpay_signature']
        );

        if (!$valid) {
            return $this->error('Payment verification failed.', 422);
        }

        $this->walletService->credit(
            $request->user(),
            (float) $validated['amount'],
            'Wallet top-up',
            'razorpay',
            null,
        );

        return $this->success([
            'balance' => round((float) $request->user()->fresh()->wallet_balance, 2),
        ], 'Wallet topped up successfully');
    }

    public function withdrawRequests(Request $request)
    {
        $perPage = min((int) $request->integer('per_page', 20), 50);
        $withdrawRequests = UserWithdrawRequest::query()
            ->where('user_id', $request->user()->id)
            ->latest()
            ->paginate($perPage)
            ->withQueryString();

        return $this->success(
            $withdrawRequests->getCollection()->map(function (UserWithdrawRequest $withdrawRequest): array {
                return [
                    'id' => $withdrawRequest->id,
                    'request_no' => $withdrawRequest->request_no,
                    'amount' => round((float) $withdrawRequest->amount, 2),
                    'status' => $withdrawRequest->status,
                    'remarks' => $withdrawRequest->remarks,
                    'created_at' => $withdrawRequest->created_at,
                ];
            })->values(),
            'Withdraw requests fetched',
            200,
            [
                'pagination' => [
                    'current_page' => $withdrawRequests->currentPage(),
                    'last_page' => $withdrawRequests->lastPage(),
                    'per_page' => $withdrawRequests->perPage(),
                    'total' => $withdrawRequests->total(),
                ],
            ]
        );
    }

    public function storeWithdrawRequest(Request $request)
    {
        $user = $request->user();
        $validated = $request->validate([
            'amount' => ['required', 'numeric', 'min:100'],
            'remarks' => ['nullable', 'string', 'max:255'],
        ]);

        if ((float) $validated['amount'] > (float) $user->wallet_balance) {
            return $this->error('Withdraw amount cannot exceed wallet balance.', 422, [
                'amount' => ['Withdraw amount cannot exceed wallet balance.'],
            ]);
        }

        $withdrawRequest = UserWithdrawRequest::query()->create([
            'user_id' => $user->id,
            'request_no' => 'WDR-' . strtoupper(Str::random(8)),
            'amount' => $validated['amount'],
            'status' => 'pending',
            'remarks' => $validated['remarks'] ?? null,
        ]);

        return $this->success([
            'id' => $withdrawRequest->id,
            'request_no' => $withdrawRequest->request_no,
            'amount' => round((float) $withdrawRequest->amount, 2),
            'status' => $withdrawRequest->status,
            'remarks' => $withdrawRequest->remarks,
            'created_at' => $withdrawRequest->created_at,
        ], 'Withdraw request submitted successfully', 201);
    }
}
