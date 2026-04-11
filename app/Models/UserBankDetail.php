<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserBankDetail extends Model
{
    protected $fillable = ['user_id', 'user_name', 'bank_name', 'account_number', 'ifsc', 'pancard_number'];
}
