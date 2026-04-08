<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $groceries = Category::where('slug', 'groceries')->first();

        if (!$groceries) {
            $this->command->warn('Groceries category not found. Run CategorySeeder first.');
            return;
        }

        $products = [
            [
                'name'              => 'CALENDER',
                'price'             => 25000.00,
                'stock'             => 50,
                'short_description' => 'Premium quality calendar for your home and office.',
                'description'       => 'High-quality printed calendar with beautiful designs. Perfect for home, office, and gifting purposes. Features all major holidays and festivals.',
                'is_featured'       => true,
            ],
            [
                'name'              => 'UPMA RAVVA',
                'price'             => 80.00,
                'stock'             => 200,
                'short_description' => 'Premium quality Upma Ravva for daily cooking.',
                'description'       => 'Fresh and premium quality Upma Ravva (Semolina/Rava), perfect for making delicious upma, idli, and other South Indian dishes. Sourced from the finest wheat.',
                'is_featured'       => true,
            ],
            [
                'name'              => 'SUJI RAVVA / BOMBAY',
                'price'             => 80.00,
                'stock'             => 200,
                'short_description' => 'Fine Suji Ravva (Bombay Rava) for cooking.',
                'description'       => 'Premium Suji Ravva also known as Bombay Rava. Ideal for making rava dosa, upma, halwa, and various other dishes. Fine texture and superior quality.',
                'is_featured'       => true,
            ],
            [
                'name'              => 'ATUKULU',
                'price'             => 65.00,
                'stock'             => 200,
                'short_description' => 'Traditional Atukulu (Flattened Rice/Poha).',
                'description'       => 'High-quality Atukulu (Flattened Rice / Poha). A versatile ingredient for making poha, chivda, and various breakfast and snack recipes. Light and nutritious.',
                'is_featured'       => true,
            ],
            [
                'name'              => 'RAGULU',
                'price'             => 70.00,
                'stock'             => 200,
                'short_description' => 'Nutritious Ragulu (Finger Millet/Ragi).',
                'description'       => 'Organic Ragulu (Ragi / Finger Millet). Rich in calcium, iron, and fiber. Perfect for making ragi malt, ragi mudde, ragi dosa, and other healthy recipes.',
                'is_featured'       => true,
            ],
            [
                'name'              => 'PUTNALU',
                'price'             => 90.00,
                'stock'             => 200,
                'short_description' => 'Roasted Putnalu (Roasted Bengal Gram).',
                'description'       => 'Freshly roasted Putnalu (Roasted Bengal Gram / Bhuna Chana). A healthy and protein-rich snack. Can be used in various recipes and chutneys.',
                'is_featured'       => true,
            ],
            [
                'name'              => 'PESARLU',
                'price'             => 105.00,
                'stock'             => 200,
                'short_description' => 'Premium Pesarlu (Green Gram / Moong Dal).',
                'description'       => 'High-quality Pesarlu (Green Gram / Moong). Perfect for making pesarattu, dal, sprouts, and various healthy recipes. Rich in protein and nutrients.',
                'is_featured'       => true,
            ],
        ];

        // Map product names to scraped image files
        $imageMap = [
            'CALENDER'           => 'scraped/products/6969f12e0dca5.addmagpro Products  (2).png',
            'UPMA RAVVA'         => 'scraped/products/6969f1ba9408c.addmagpro Products .png',
            'SUJI RAVVA / BOMBAY'=> 'scraped/products/69243c730bcf7.SUJI BOMBAY RAVVA.jpeg',
            'ATUKULU'            => 'scraped/products/69b0f91fb1268.thin atukulu.jpeg',
            'RAGULU'             => 'scraped/products/69b0f8c2b9998.millet ragulu.jpeg',
            'PUTNALU'            => 'scraped/products/69b0f7f8b229d.putnalu.jpeg',
            'PESARLU'            => 'scraped/products/69b0f7ab21499.pesallu.jpeg',
        ];

        foreach ($products as $product) {
            $created = Product::updateOrCreate(
                ['slug' => Str::slug($product['name'])],
                array_merge($product, [
                    'slug'        => Str::slug($product['name']),
                    'category_id' => $groceries->id,
                    'is_active'   => true,
                ])
            );

            // Attach scraped image if available
            if (isset($imageMap[$product['name']])) {
                ProductImage::updateOrCreate(
                    ['product_id' => $created->id, 'is_primary' => true],
                    [
                        'image_path' => $imageMap[$product['name']],
                        'sort_order' => 1,
                        'is_primary' => true,
                    ]
                );
            }
        }

        $this->command->info('Seeded ' . count($products) . ' products in Groceries category.');
    }
}
