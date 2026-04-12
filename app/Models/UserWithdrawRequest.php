<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserWithdrawRequest extends Model
{
    protected $fillable = [
        'user_id',
        'request_no',
        'amount',
        'status',
        'remarks',
    ];

    protected function casts(): array
    {
        return [
            'amount' => 'decimal:2',
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
