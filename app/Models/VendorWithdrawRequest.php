<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VendorWithdrawRequest extends Model
{
    protected $fillable = ['vendor_id', 'user_id', 'vendor_name', 'mobile_number', 'withdraw_amount', 'status'];

    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }
}
