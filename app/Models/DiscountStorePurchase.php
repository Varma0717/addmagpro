<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DiscountStorePurchase extends Model
{
    protected $fillable = [
        'vendor_id',
        'customer_id',
        'store_name',
        'purchase_amount',
        'discount_margin',
        'total_amount',
        'vendor_commision',
    ];
}
