<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'user_id',
        'order_number',
        'status',
        'subtotal',
        'discount_amount',
        'coupon_id',
        'wallet_amount_used',
        'total',
        'shipping_address',
        'payment_method',
        'payment_status',
        'razorpay_order_id',
        'razorpay_payment_id',
    ];

    protected function casts(): array
    {
        return [
            'subtotal'           => 'decimal:2',
            'discount_amount'    => 'decimal:2',
            'wallet_amount_used' => 'decimal:2',
            'total'              => 'decimal:2',
            'shipping_address'   => 'array',
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function coupon()
    {
        return $this->belongsTo(Coupon::class);
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }
}
