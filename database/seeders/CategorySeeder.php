<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        $ecommerce = [
            ['name' => 'Groceries',        'icon' => '🛒'],
            ['name' => 'Electronics',      'icon' => '📱'],
            ['name' => 'Fashion',          'icon' => '👗'],
            ['name' => 'Home & Living',    'icon' => '🏠'],
            ['name' => 'Health & Beauty',  'icon' => '💊'],
            ['name' => 'Sports & Fitness', 'icon' => '🏋️'],
        ];

        $services = [
            ['name' => 'Real Estate',   'icon' => '🏢'],
            ['name' => 'Jobs',          'icon' => '💼'],
            ['name' => 'Repairs',       'icon' => '🔧'],
            ['name' => 'PG / Hostel',   'icon' => '🛏️'],
            ['name' => 'Gym & Fitness', 'icon' => '💪'],
            ['name' => 'Loans',         'icon' => '💰'],
            ['name' => 'Education',     'icon' => '🎓'],
        ];

        foreach ($ecommerce as $cat) {
            Category::updateOrCreate(
                ['slug' => Str::slug($cat['name'])],
                ['name' => $cat['name'], 'icon' => $cat['icon'], 'type' => 'ecommerce', 'is_active' => true]
            );
        }

        foreach ($services as $cat) {
            Category::updateOrCreate(
                ['slug' => Str::slug($cat['name'])],
                ['name' => $cat['name'], 'icon' => $cat['icon'], 'type' => 'service', 'is_active' => true]
            );
        }
    }
}
