<?php

namespace Database\Seeders;

use App\Models\Banner;
use Illuminate\Database\Seeder;

class BannerSeeder extends Seeder
{
    public function run(): void
    {
        $banners = [
            [
                'title'      => 'Welcome to AddMagPro',
                'subtitle'   => 'Your one-stop shop for products, services & more',
                'placement'  => 'homepage_carousel',
                'sort_order' => 1,
                'is_active'  => true,
                'link_type'  => 'url',
                'link_value' => '/categories',
            ],
            [
                'title'      => '100% Cashback Products',
                'subtitle'   => 'Shop now and get amazing cashback rewards',
                'placement'  => 'homepage_carousel',
                'sort_order' => 2,
                'is_active'  => true,
                'link_type'  => 'url',
                'link_value' => '/categories',
            ],
            [
                'title'      => 'Register Your Business',
                'subtitle'   => 'Reach thousands of customers through our platform',
                'placement'  => 'homepage_carousel',
                'sort_order' => 3,
                'is_active'  => true,
                'link_type'  => 'url',
                'link_value' => '/register',
            ],
            [
                'title'      => 'Special Offers on Groceries',
                'subtitle'   => 'Get the best deals on daily essentials',
                'placement'  => 'homepage_mid',
                'sort_order' => 1,
                'is_active'  => true,
                'link_type'  => 'url',
                'link_value' => '/category/groceries',
            ],
        ];

        foreach ($banners as $banner) {
            Banner::updateOrCreate(
                ['title' => $banner['title'], 'placement' => $banner['placement']],
                $banner
            );
        }

        $this->command->info('Seeded ' . count($banners) . ' banners.');
    }
}
