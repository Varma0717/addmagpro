<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Referral extends Model
{
    protected $fillable = [
        'referrer_id',
        'referred_id',
        'status',
        'signup_reward_given',
        'purchase_reward_given',
    ];

    protected function casts(): array
    {
        return [
            'signup_reward_given'   => 'boolean',
            'purchase_reward_given' => 'boolean',
        ];
    }

    public function referrer()
    {
        return $this->belongsTo(User::class, 'referrer_id');
    }

    public function referred()
    {
        return $this->belongsTo(User::class, 'referred_id');
    }
}
