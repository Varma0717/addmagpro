<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $fillable = ['brand_name', 'vendor_id', 'image'];

    public function vendor()
    {
        return $this->belongsTo(Vendor::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
