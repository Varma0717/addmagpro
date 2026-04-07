<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\WalletTransaction;
use App\Services\WalletService;
use Illuminate\Http\Request;

class WalletController extends Controller
{
    public function __construct(private readonly WalletService $walletService) {}

    public function index(Request $request)
    {
        $transactions = WalletTransaction::with('user')
            ->when($request->type, fn($q) => $q->where('type', $request->type))
            ->latest()
            ->paginate(30);

        return view('admin.wallet.index', compact('transactions'));
    }

    public function credit(Request $request)
    {
        $request->validate([
            'user_id'     => 'required|exists:users,id',
            'amount'      => 'required|numeric|min:1',
            'description' => 'required|string|max:255',
        ]);

        $user = User::findOrFail($request->user_id);
        $this->walletService->credit($user, $request->amount, $request->description);

        return back()->with('success', "₹{$request->amount} credited to {$user->name}.");
    }
}
