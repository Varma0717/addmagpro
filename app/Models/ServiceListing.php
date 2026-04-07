<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServiceListing extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'category_id',
        'business_name',
        'slug',
        'description',
        'address',
        'city',
        'phone',
        'whatsapp',
        'website_url',
        'latitude',
        'longitude',
        'is_approved',
        'is_featured',
    ];

    protected function casts(): array
    {
        return [
            'latitude'    => 'float',
            'longitude'   => 'float',
            'is_approved' => 'boolean',
            'is_featured' => 'boolean',
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function images()
    {
        return $this->hasMany(ListingImage::class, 'listing_id');
    }

    public function reviews()
    {
        return $this->morphMany(Review::class, 'reviewable');
    }

    public function scopeApproved($query)
    {
        return $query->where('is_approved', true);
    }

    public function scopeFeatured($query)
    {
        return $query->where('is_featured', true);
    }
}
