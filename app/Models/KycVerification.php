<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KycVerification extends Model
{
    protected $fillable = ['user_id', 'full_name', 'kyc_status', 'approved_date'];

    protected function casts(): array
    {
        return ['approved_date' => 'datetime'];
    }
}
