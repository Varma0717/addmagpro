<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    protected $fillable = ['state_name'];

    public function districts()
    {
        return $this->hasMany(District::class);
    }
}
