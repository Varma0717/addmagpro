<?php

namespace App\Services;

use App\Models\User;
use App\Models\WalletTransaction;
use Illuminate\Support\Facades\DB;

class WalletService
{
    public function credit(User $user, float $amount, string $description, ?string $referenceType = null, ?int $referenceId = null): WalletTransaction
    {
        return DB::transaction(function () use ($user, $amount, $description, $referenceType, $referenceId) {
            $user->increment('wallet_balance', $amount);
            $user->refresh();

            return WalletTransaction::create([
                'user_id'        => $user->id,
                'type'           => 'credit',
                'amount'         => $amount,
                'description'    => $description,
                'reference_type' => $referenceType,
                'reference_id'   => $referenceId,
                'balance_after'  => $user->wallet_balance,
            ]);
        });
    }

    public function debit(User $user, float $amount, string $description, ?string $referenceType = null, ?int $referenceId = null): WalletTransaction
    {
        return DB::transaction(function () use ($user, $amount, $description, $referenceType, $referenceId) {
            if ($user->wallet_balance < $amount) {
                throw new \RuntimeException('Insufficient wallet balance.');
            }

            $user->decrement('wallet_balance', $amount);
            $user->refresh();

            return WalletTransaction::create([
                'user_id'        => $user->id,
                'type'           => 'debit',
                'amount'         => $amount,
                'description'    => $description,
                'reference_type' => $referenceType,
                'reference_id'   => $referenceId,
                'balance_after'  => $user->wallet_balance,
            ]);
        });
    }
}
