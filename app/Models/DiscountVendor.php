<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DiscountVendor extends Model
{
    protected $fillable = [
        'user_id',
        'member_name',
        'member_phone',
        'shop_name',
        'gst_number',
        'shop_description',
        'address',
        'location',
        'banner_image',
        'state',
        'district',
        'pincode',
        'bank_name',
        'account_name',
        'ifsc_code',
        'discount_margin',
        'withdrawal_amount',
    ];
}
