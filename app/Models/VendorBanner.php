<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VendorBanner extends Model
{
    protected $fillable = ['vendor_id', 'image_url'];

    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }
}
