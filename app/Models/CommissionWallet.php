<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CommissionWallet extends Model
{
    protected $fillable = ['user_id', 'balance', 'purchase_income'];
}
