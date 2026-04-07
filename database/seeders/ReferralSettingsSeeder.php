<?php

namespace Database\Seeders;

use App\Models\ReferralSetting;
use Illuminate\Database\Seeder;

class ReferralSettingsSeeder extends Seeder
{
    public function run(): void
    {
        ReferralSetting::updateOrCreate(
            ['event' => 'signup'],
            ['referrer_amount' => 50.00, 'referee_amount' => 25.00, 'is_active' => true]
        );

        ReferralSetting::updateOrCreate(
            ['event' => 'first_purchase'],
            ['referrer_amount' => 100.00, 'referee_amount' => 0.00, 'is_active' => true]
        );
    }
}
