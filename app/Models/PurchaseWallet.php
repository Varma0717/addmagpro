<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PurchaseWallet extends Model
{
    protected $fillable = ['user_id', 'balance'];
}
