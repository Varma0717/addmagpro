<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $fillable = [
        'code',
        'name',
        'type',
        'value',
        'min_order_amount',
        'max_discount_amount',
        'usage_limit',
        'used_count',
        'is_active',
        'expires_at',
    ];

    protected function casts(): array
    {
        return [
            'value'               => 'decimal:2',
            'min_order_amount'    => 'decimal:2',
            'max_discount_amount' => 'decimal:2',
            'usage_limit'         => 'integer',
            'used_count'          => 'integer',
            'is_active'           => 'boolean',
            'expires_at'          => 'datetime',
        ];
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'user_coupons')->withPivot('used_at')->withTimestamps();
    }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function isValid(): bool
    {
        if (!$this->is_active) return false;
        if ($this->expires_at && $this->expires_at->isPast()) return false;
        if ($this->usage_limit && $this->used_count >= $this->usage_limit) return false;
        return true;
    }

    public function computeDiscount(float $orderAmount): float
    {
        if ($orderAmount < $this->min_order_amount) return 0;

        $discount = $this->type === 'percentage'
            ? ($orderAmount * $this->value / 100)
            : $this->value;

        if ($this->max_discount_amount) {
            $discount = min($discount, $this->max_discount_amount);
        }

        return round($discount, 2);
    }
}
