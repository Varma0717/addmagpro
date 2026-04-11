<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PinSystem extends Model
{
    protected $fillable = ['user_id', 'total_pins'];
}
