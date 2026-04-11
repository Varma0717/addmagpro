<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WithdrawalRequest extends Model
{
    protected $fillable = ['user_id', 'amount', 'currency', 'payment_method', 'request_date', 'status', 'completion_date'];

    protected function casts(): array
    {
        return [
            'amount'          => 'decimal:2',
            'request_date'    => 'datetime',
            'completion_date' => 'datetime',
        ];
    }
}
