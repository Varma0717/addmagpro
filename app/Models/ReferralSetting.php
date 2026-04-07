<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReferralSetting extends Model
{
    protected $fillable = ['event', 'referrer_amount', 'referee_amount', 'is_active'];

    protected function casts(): array
    {
        return [
            'referrer_amount' => 'decimal:2',
            'referee_amount'  => 'decimal:2',
            'is_active'       => 'boolean',
        ];
    }
}
