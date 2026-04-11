<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Franchise extends Model
{
    protected $fillable = [
        'franchise_name',
        'franchise_owner',
        'franchise_location',
        'franchise_phone',
        'franchise_email',
        'franchise_type',
        'franchise_start_date',
        'franchise_status',
        'franchise_revenue',
        'franchise_expenses',
        'franchise_profit',
    ];
}
