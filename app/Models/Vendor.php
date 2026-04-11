<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    protected $fillable = [
        'vendor_name',
        'vendor_phone',
        'vendor_email',
        'password',
        'business_name',
        'business_type',
        'business_address',
        'business_location',
        'reference_id',
        'reference_by',
        'profile_image',
        'pancard_number',
        'gst_number',
        'commission_percentage',
        'bank_name',
        'account_number',
        'ifsc',
        'status',
        'vendor_wallet',
    ];

    protected $hidden = ['password'];

    public function brands()
    {
        return $this->hasMany(Brand::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function vendorBanners()
    {
        return $this->hasMany(VendorBanner::class);
    }

    public function withdrawRequests()
    {
        return $this->hasMany(VendorWithdrawRequest::class);
    }
}
