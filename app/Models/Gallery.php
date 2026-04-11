<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Gallery extends Model
{
    protected $fillable = ['gallery_name', 'gallery_url', 'gallery_image'];
}
