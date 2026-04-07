<?php

namespace App\Http\Controllers;

use App\Models\Ad;
use Illuminate\Http\RedirectResponse;

class AdController extends Controller
{
    public function click(Ad $ad): RedirectResponse
    {
        $ad->increment('clicks');
        return redirect($ad->link_url ?? url('/'));
    }
}
