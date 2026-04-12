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
        $password = env('ADMIN_DEFAULT_PASSWORD', 'ChangeMe@123');

        User::updateOrCreate(
            ['phone' => '9999999999'],
            [
                'name'          => 'Admin',
                'email'         => 'admin@admagpro.com',
                'phone'         => '9999999999',
                'password'      => Hash::make($password),
                'role'          => 'admin',
                'referral_code' => strtoupper(Str::random(8)),
                'is_active'     => true,
                'email_verified_at' => now(),
            ]
        );
    }
}
