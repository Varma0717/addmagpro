<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminWallet extends Model
{
    protected $fillable = ['back_two_back', 'charity', 'monthly_pool', 'company'];
}
