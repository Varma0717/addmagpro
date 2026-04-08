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
                'image'      => 'scraped/banners/66422901440ac.server_mainslider4.png',
                'placement'  => 'homepage_carousel',
                'sort_order' => 1,
                'is_active'  => true,
                'link_type'  => 'url',
                'link_value' => '/categories',
            ],
            [
                'title'      => '100% Cashback Products',
                'subtitle'   => 'Shop now and get amazing cashback rewards',
                'image'      => 'scraped/banners/6656f46a71a68.vendor_banner_common.jpg',
                'placement'  => 'homepage_carousel',
                'sort_order' => 2,
                'is_active'  => true,
                'link_type'  => 'url',
                'link_value' => '/categories',
            ],
            [
                'title'      => 'Register Your Business',
                'subtitle'   => 'Reach thousands of customers through our platform',
                'image'      => 'scraped/banners/6656fa35a4849.main_banner2.png',
                'placement'  => 'homepage_carousel',
                'sort_order' => 3,
                'is_active'  => true,
                'link_type'  => 'url',
                'link_value' => '/register',
            ],
            [
                'title'      => 'Special Offers on Groceries',
                'subtitle'   => 'Get the best deals on daily essentials',
                'image'      => 'scraped/banners/6642291671991.server_mainslider5.png',
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
