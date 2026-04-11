<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserCommissionWallet extends Model
{
    protected $fillable = ['user_id', 'back_two_back', 'pool_commission', 'cashback'];
}
