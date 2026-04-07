<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $fillable = [
        'order_id',
        'product_id',
        'product_name',
        'quantity',
        'unit_price',
        'discount_price',
    ];

    protected function casts(): array
    {
        return [
            'quantity'       => 'integer',
            'unit_price'     => 'decimal:2',
            'discount_price' => 'decimal:2',
        ];
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class)->withDefault();
    }

    public function getEffectivePriceAttribute(): float
    {
        return $this->discount_price ?? $this->unit_price;
    }

    public function getLineSubtotalAttribute(): float
    {
        return $this->effective_price * $this->quantity;
    }
}
