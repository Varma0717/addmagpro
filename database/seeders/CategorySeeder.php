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
            ['name' => 'Groceries',          'icon' => '🛒', 'sort_order' => 1],
            ['name' => 'Electronics',        'icon' => '📱', 'sort_order' => 2],
            ['name' => 'Fashion',            'icon' => '👗', 'sort_order' => 3],
            ['name' => 'Home & Living',      'icon' => '🏠', 'sort_order' => 4],
            ['name' => 'Health & Beauty',    'icon' => '💊', 'sort_order' => 5],
            ['name' => 'Sports & Fitness',   'icon' => '🏋️', 'sort_order' => 6],
            ['name' => 'Nutrition Health',   'icon' => '🥗', 'sort_order' => 7],
            ['name' => 'BIOENERGY',          'icon' => '🔋', 'sort_order' => 8],
            ['name' => 'Personal Care',      'icon' => '🧴', 'sort_order' => 9],
            ['name' => 'Men Fashion',        'icon' => '👔', 'sort_order' => 10],
            ['name' => 'Books',              'icon' => '📚', 'sort_order' => 11],
            ['name' => 'Furniture',          'icon' => '🛋️', 'sort_order' => 12],
            ['name' => 'Shoes',              'icon' => '👟', 'sort_order' => 13],
            ['name' => 'Electric Vehicles',  'icon' => '🔌', 'sort_order' => 14],
            ['name' => 'Stationery',         'icon' => '✏️', 'sort_order' => 15],
        ];

        $services = [
            ['name' => 'Real Estate',        'icon' => '🏢', 'sort_order' => 1],
            ['name' => 'Jobs',               'icon' => '💼', 'sort_order' => 2],
            ['name' => 'Repairs',            'icon' => '🔧', 'sort_order' => 3],
            ['name' => 'PG / Hostel',        'icon' => '🛏️', 'sort_order' => 4],
            ['name' => 'Gym & Fitness',      'icon' => '💪', 'sort_order' => 5],
            ['name' => 'Loans',              'icon' => '💰', 'sort_order' => 6],
            ['name' => 'Education',          'icon' => '🎓', 'sort_order' => 7],
            ['name' => 'Ads & Classifieds',  'icon' => '📢', 'sort_order' => 8],
            ['name' => 'Life Insurance',     'icon' => '🛡️', 'sort_order' => 9],
            ['name' => 'Care Health',        'icon' => '❤️', 'sort_order' => 10],
            ['name' => 'Discount Vendors',   'icon' => '🏷️', 'sort_order' => 11],
        ];

        foreach ($ecommerce as $cat) {
            Category::updateOrCreate(
                ['slug' => Str::slug($cat['name'])],
                ['name' => $cat['name'], 'icon' => $cat['icon'], 'type' => 'ecommerce', 'is_active' => true, 'sort_order' => $cat['sort_order']]
            );
        }

        foreach ($services as $cat) {
            Category::updateOrCreate(
                ['slug' => Str::slug($cat['name'])],
                ['name' => $cat['name'], 'icon' => $cat['icon'], 'type' => 'service', 'is_active' => true, 'sort_order' => $cat['sort_order']]
            );
        }
    }
}
