<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AdminUserSeeder extends Seeder
{
    public function run(): void
    {
        User::updateOrCreate(
            ['email' => 'admin@admagpro.com'],
            [
                'name'          => 'Admin',
                'phone'         => '9999999999',
                'password'      => Hash::make('Admin@12345'),
                'role'          => 'admin',
                'referral_code' => strtoupper(Str::random(8)),
                'is_active'     => true,
                'email_verified_at' => now(),
            ]
        );
    }
}
