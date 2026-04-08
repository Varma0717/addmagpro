<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

class MigrateOldSiteData extends Command
{
    protected $signature = 'app:migrate-old-data
                            {--connection=old_addmagpro : Source database connection name}
                            {--tables=all : Comma-separated list: categories,products,users,orders,listings,banners,ads,coupons,wallet,referrals}
                            {--dry-run : Preview what would be migrated without writing}
                            {--batch-size=500 : Chunk size for batch processing}
                            {--force : Skip confirmation prompts}';

    protected $description = 'Migrate data from the old addmagpro.com database into the new schema';

    private $connection;
    private $dryRun;
    private $batchSize;
    private $idMaps = [];

    public function handle(): int
    {
        $this->connection = $this->option('connection');
        $this->dryRun = $this->option('dry-run');
        $this->batchSize = (int) $this->option('batch-size');

        // Test connection
        try {
            $old = DB::connection($this->connection);
            $old->getPdo();
        } catch (\Exception $e) {
            $this->error("Cannot connect: " . $e->getMessage());
            $this->warn('Set OLD_DB_* env vars. Run php artisan app:inspect-old-db first.');
            return self::FAILURE;
        }

        $dbName = $old->getDatabaseName();
        $this->info("Source database: {$dbName}" . ($this->dryRun ? ' [DRY RUN]' : ''));
        $this->newLine();

        // Discover old tables
        $oldTables = collect($old->select(
            'SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = ?', [$dbName]
        ))->pluck('TABLE_NAME')->toArray();

        $this->info('Old database has ' . count($oldTables) . ' tables: ' . implode(', ', $oldTables));
        $this->newLine();

        if (!$this->dryRun && !$this->option('force')) {
            if (!$this->confirm('This will insert data into the new database. Continue?')) {
                return self::SUCCESS;
            }
        }

        // Determine which tables to migrate
        $requestedTables = $this->option('tables') === 'all'
            ? ['categories', 'products', 'users', 'orders', 'listings', 'banners', 'ads', 'coupons', 'wallet', 'referrals']
            : explode(',', $this->option('tables'));

        $migrators = [
            'categories' => 'migrateCategories',
            'products'   => 'migrateProducts',
            'users'      => 'migrateUsers',
            'listings'   => 'migrateListings',
            'orders'     => 'migrateOrders',
            'banners'    => 'migrateBanners',
            'ads'        => 'migrateAds',
            'coupons'    => 'migrateCoupons',
            'wallet'     => 'migrateWalletTransactions',
            'referrals'  => 'migrateReferrals',
        ];

        foreach ($requestedTables as $table) {
            $table = trim($table);
            if (!isset($migrators[$table])) {
                $this->warn("Unknown migration target: {$table}");
                continue;
            }
            $this->{$migrators[$table]}($old, $oldTables);
        }

        $this->newLine();
        $this->info('Migration ' . ($this->dryRun ? 'preview' : '') . ' complete!');

        return self::SUCCESS;
    }

    // ─── Categories ──────────────────────────────────────────────────────

    private function migrateCategories($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['categories', 'category', 'tbl_categories', 'tbl_category']);
        if (!$sourceTable) {
            $this->warn('⏭ Categories: no matching source table found');
            return;
        }

        $this->info("▸ Migrating categories from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $rows = $old->table($sourceTable)->get();

        $bar = $this->output->createProgressBar($rows->count());
        $count = 0;

        foreach ($rows as $row) {
            $row = (array) $row;
            $data = [
                'name'       => $this->mapColumn($row, $columns, ['name', 'category_name', 'cat_name', 'title']),
                'slug'       => Str::slug($this->mapColumn($row, $columns, ['slug', 'name', 'category_name', 'cat_name', 'title'])),
                'type'       => $this->mapColumn($row, $columns, ['type', 'category_type', 'cat_type']) ?: 'ecommerce',
                'icon'       => $this->mapColumn($row, $columns, ['icon', 'category_icon', 'cat_icon']),
                'image'      => $this->mapColumn($row, $columns, ['image', 'category_image', 'cat_image', 'img']),
                'parent_id'  => $this->mapColumn($row, $columns, ['parent_id', 'parent_category_id']),
                'sort_order' => $this->mapColumn($row, $columns, ['sort_order', 'order', 'position', 'display_order']) ?: 0,
                'is_active'  => $this->mapBool($row, $columns, ['is_active', 'status', 'active'], true),
            ];

            if (!$data['name']) {
                $bar->advance();
                continue;
            }

            $oldId = $this->mapColumn($row, $columns, ['id', 'category_id', 'cat_id']);

            if (!$this->dryRun) {
                $record = DB::table('categories')->updateOrInsert(
                    ['slug' => $data['slug']],
                    array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                );
                $newId = DB::table('categories')->where('slug', $data['slug'])->value('id');
                $this->idMaps['categories'][$oldId] = $newId;
            }

            $count++;
            $bar->advance();
        }

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} categories " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    // ─── Products ────────────────────────────────────────────────────────

    private function migrateProducts($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['products', 'product', 'tbl_products', 'tbl_product']);
        if (!$sourceTable) {
            $this->warn('⏭ Products: no matching source table found');
            return;
        }

        $this->info("▸ Migrating products from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);

        $total = $old->table($sourceTable)->count();
        $bar = $this->output->createProgressBar($total);
        $count = 0;

        $old->table($sourceTable)->orderBy(
            $this->findColumnMatch($columns, ['id', 'product_id', 'prod_id']) ?? 'id'
        )->chunk($this->batchSize, function ($rows) use ($columns, $old, $oldTables, $bar, &$count) {

            foreach ($rows as $row) {
                $row = (array) $row;
                $oldCatId = $this->mapColumn($row, $columns, ['category_id', 'cat_id', 'category']);
                $newCatId = $this->idMaps['categories'][$oldCatId] ?? null;

                // If no category mapping yet, try to find by name
                if (!$newCatId && $oldCatId) {
                    $newCatId = DB::table('categories')->where('id', $oldCatId)->value('id');
                }

                $name = $this->mapColumn($row, $columns, ['name', 'product_name', 'title', 'prod_name']);
                if (!$name) {
                    $bar->advance();
                    continue;
                }

                $data = [
                    'name'              => $name,
                    'slug'              => Str::slug($name) . '-' . Str::random(4),
                    'category_id'       => $newCatId,
                    'description'       => $this->mapColumn($row, $columns, ['description', 'product_description', 'desc', 'details']),
                    'short_description' => $this->mapColumn($row, $columns, ['short_description', 'short_desc', 'summary', 'excerpt']),
                    'price'             => (float) ($this->mapColumn($row, $columns, ['price', 'product_price', 'amount', 'mrp', 'regular_price']) ?: 0),
                    'discount_price'    => $this->mapColumn($row, $columns, ['discount_price', 'sale_price', 'offer_price', 'special_price']),
                    'stock'             => (int) ($this->mapColumn($row, $columns, ['stock', 'quantity', 'qty', 'stock_quantity']) ?: 0),
                    'is_featured'       => $this->mapBool($row, $columns, ['is_featured', 'featured', 'is_popular']),
                    'is_active'         => $this->mapBool($row, $columns, ['is_active', 'status', 'active', 'is_published'], true),
                    'meta_title'        => $this->mapColumn($row, $columns, ['meta_title', 'seo_title']),
                    'meta_description'  => $this->mapColumn($row, $columns, ['meta_description', 'seo_description']),
                ];

                $oldId = $this->mapColumn($row, $columns, ['id', 'product_id', 'prod_id']);

                if (!$this->dryRun) {
                    $newId = DB::table('products')->insertGetId(
                        array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                    );
                    $this->idMaps['products'][$oldId] = $newId;

                    // Migrate product images
                    $this->migrateProductImages($old, $oldTables, $oldId, $newId, $row, $columns);
                }

                $count++;
                $bar->advance();
            }
        });

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} products " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    private function migrateProductImages($old, array $oldTables, $oldProductId, int $newProductId, array $productRow, array $productColumns): void
    {
        // Check for separate images table
        $imgTable = $this->findTable($oldTables, ['product_images', 'product_image', 'tbl_product_images', 'prod_images']);

        if ($imgTable) {
            $imgColumns = $this->getColumnNames($old, $imgTable);
            $pidCol = $this->findColumnMatch($imgColumns, ['product_id', 'prod_id', 'pid']);

            if ($pidCol) {
                $images = $old->table($imgTable)->where($pidCol, $oldProductId)->get();
                foreach ($images as $idx => $img) {
                    $img = (array) $img;
                    DB::table('product_images')->insert([
                        'product_id' => $newProductId,
                        'image_path' => $this->mapColumn($img, $imgColumns, ['image_path', 'image', 'path', 'filename', 'file', 'url', 'img']),
                        'sort_order' => $this->mapColumn($img, $imgColumns, ['sort_order', 'order', 'position']) ?? $idx,
                        'is_primary' => $idx === 0,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
                return;
            }
        }

        // Fallback: check for image column in products table itself
        $imgPath = $this->mapColumn($productRow, $productColumns, ['image', 'product_image', 'thumbnail', 'main_image', 'img']);
        if ($imgPath) {
            DB::table('product_images')->insert([
                'product_id' => $newProductId,
                'image_path' => $imgPath,
                'sort_order' => 0,
                'is_primary' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }

    // ─── Users ───────────────────────────────────────────────────────────

    private function migrateUsers($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['users', 'user', 'tbl_users', 'tbl_user', 'members', 'customers']);
        if (!$sourceTable) {
            $this->warn('⏭ Users: no matching source table found');
            return;
        }

        $this->info("▸ Migrating users from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $total = $old->table($sourceTable)->count();
        $bar = $this->output->createProgressBar($total);
        $count = 0;

        $old->table($sourceTable)->orderBy(
            $this->findColumnMatch($columns, ['id', 'user_id']) ?? 'id'
        )->chunk($this->batchSize, function ($rows) use ($columns, $bar, &$count) {

            foreach ($rows as $row) {
                $row = (array) $row;

                $email = $this->mapColumn($row, $columns, ['email', 'user_email', 'email_id', 'email_address']);
                $phone = $this->mapColumn($row, $columns, ['phone', 'mobile', 'phone_number', 'mobile_number', 'contact', 'mobile_no']);
                $name = $this->mapColumn($row, $columns, ['name', 'user_name', 'username', 'full_name', 'first_name']);

                if (!$email && !$phone) {
                    $bar->advance();
                    continue;
                }

                // Build unique email - some old sites use phone as login
                if (!$email && $phone) {
                    $email = $phone . '@addmagpro.local';
                }

                $data = [
                    'name'              => $name ?: 'User',
                    'email'             => $email,
                    'phone'             => $phone,
                    'password'          => $this->mapColumn($row, $columns, ['password', 'passwd', 'user_password']) ?: bcrypt('ChangeMe@123'),
                    'referral_code'     => $this->mapColumn($row, $columns, ['referral_code', 'refer_code', 'ref_code']) ?: strtoupper(Str::random(8)),
                    'wallet_balance'    => (float) ($this->mapColumn($row, $columns, ['wallet_balance', 'wallet', 'balance', 'wallet_amount']) ?: 0),
                    'role'              => $this->mapRole($row, $columns),
                    'is_active'         => $this->mapBool($row, $columns, ['is_active', 'status', 'active'], true),
                    'email_verified_at' => now(),
                ];

                $oldId = $this->mapColumn($row, $columns, ['id', 'user_id', 'member_id']);

                if (!$this->dryRun) {
                    $existing = DB::table('users')->where('email', $data['email'])->first();
                    if ($existing) {
                        $this->idMaps['users'][$oldId] = $existing->id;
                    } else {
                        $newId = DB::table('users')->insertGetId(
                            array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                        );
                        $this->idMaps['users'][$oldId] = $newId;
                    }
                }

                $count++;
                $bar->advance();
            }
        });

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} users " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    // ─── Service Listings ────────────────────────────────────────────────

    private function migrateListings($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, [
            'service_listings', 'listings', 'services', 'tbl_services',
            'tbl_listings', 'vendors', 'shops', 'stores', 'tbl_vendors', 'tbl_shops'
        ]);
        if (!$sourceTable) {
            $this->warn('⏭ Listings: no matching source table found');
            return;
        }

        $this->info("▸ Migrating service listings from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $total = $old->table($sourceTable)->count();
        $bar = $this->output->createProgressBar($total);
        $count = 0;

        $old->table($sourceTable)->orderBy(
            $this->findColumnMatch($columns, ['id', 'listing_id', 'service_id', 'vendor_id', 'shop_id']) ?? 'id'
        )->chunk($this->batchSize, function ($rows) use ($columns, $old, $oldTables, $bar, &$count) {

            foreach ($rows as $row) {
                $row = (array) $row;

                $businessName = $this->mapColumn($row, $columns, [
                    'business_name', 'name', 'shop_name', 'store_name', 'vendor_name', 'title', 'service_name'
                ]);

                if (!$businessName) {
                    $bar->advance();
                    continue;
                }

                $oldUserId = $this->mapColumn($row, $columns, ['user_id', 'vendor_id', 'owner_id', 'member_id']);
                $oldCatId = $this->mapColumn($row, $columns, ['category_id', 'cat_id', 'service_category_id']);

                $data = [
                    'user_id'       => $this->idMaps['users'][$oldUserId] ?? null,
                    'category_id'   => $this->idMaps['categories'][$oldCatId] ?? null,
                    'business_name' => $businessName,
                    'slug'          => Str::slug($businessName) . '-' . Str::random(4),
                    'description'   => $this->mapColumn($row, $columns, ['description', 'details', 'about', 'service_description']),
                    'address'       => $this->mapColumn($row, $columns, ['address', 'location', 'full_address', 'street_address']),
                    'city'          => $this->mapColumn($row, $columns, ['city', 'town', 'location_city']),
                    'phone'         => $this->mapColumn($row, $columns, ['phone', 'mobile', 'contact', 'contact_number', 'phone_number']),
                    'whatsapp'      => $this->mapColumn($row, $columns, ['whatsapp', 'whatsapp_number', 'wa_number']),
                    'website_url'   => $this->mapColumn($row, $columns, ['website_url', 'website', 'url', 'web']),
                    'latitude'      => $this->mapColumn($row, $columns, ['latitude', 'lat']),
                    'longitude'     => $this->mapColumn($row, $columns, ['longitude', 'lng', 'lon', 'long']),
                    'is_approved'   => $this->mapBool($row, $columns, ['is_approved', 'approved', 'status'], true),
                    'is_featured'   => $this->mapBool($row, $columns, ['is_featured', 'featured']),
                ];

                $oldId = $this->mapColumn($row, $columns, ['id', 'listing_id', 'service_id', 'vendor_id', 'shop_id']);

                if (!$this->dryRun) {
                    $newId = DB::table('service_listings')->insertGetId(
                        array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                    );
                    $this->idMaps['listings'][$oldId] = $newId;

                    // Migrate listing images
                    $this->migrateListingImages($old, $oldTables, $oldId, $newId);
                }

                $count++;
                $bar->advance();
            }
        });

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} listings " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    private function migrateListingImages($old, array $oldTables, $oldListingId, int $newListingId): void
    {
        $imgTable = $this->findTable($oldTables, ['listing_images', 'service_images', 'vendor_images', 'shop_images', 'tbl_listing_images']);
        if (!$imgTable) return;

        $imgColumns = $this->getColumnNames($old, $imgTable);
        $fkCol = $this->findColumnMatch($imgColumns, ['listing_id', 'service_id', 'vendor_id', 'shop_id']);
        if (!$fkCol) return;

        $images = $old->table($imgTable)->where($fkCol, $oldListingId)->get();
        foreach ($images as $img) {
            $img = (array) $img;
            DB::table('listing_images')->insert([
                'listing_id' => $newListingId,
                'image_path' => $this->mapColumn($img, $imgColumns, ['image_path', 'image', 'path', 'filename', 'file', 'url', 'img']),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }

    // ─── Orders ──────────────────────────────────────────────────────────

    private function migrateOrders($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['orders', 'order', 'tbl_orders', 'tbl_order']);
        if (!$sourceTable) {
            $this->warn('⏭ Orders: no matching source table found');
            return;
        }

        $this->info("▸ Migrating orders from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $total = $old->table($sourceTable)->count();
        $bar = $this->output->createProgressBar($total);
        $count = 0;

        $old->table($sourceTable)->orderBy(
            $this->findColumnMatch($columns, ['id', 'order_id']) ?? 'id'
        )->chunk($this->batchSize, function ($rows) use ($columns, $old, $oldTables, $bar, &$count) {

            foreach ($rows as $row) {
                $row = (array) $row;

                $oldUserId = $this->mapColumn($row, $columns, ['user_id', 'customer_id', 'member_id']);

                $data = [
                    'user_id'            => $this->idMaps['users'][$oldUserId] ?? null,
                    'order_number'       => $this->mapColumn($row, $columns, ['order_number', 'order_no', 'invoice_number', 'reference']) ?: 'ORD-' . strtoupper(Str::random(8)),
                    'status'             => $this->mapOrderStatus($row, $columns),
                    'subtotal'           => (float) ($this->mapColumn($row, $columns, ['subtotal', 'sub_total']) ?: 0),
                    'discount_amount'    => (float) ($this->mapColumn($row, $columns, ['discount_amount', 'discount', 'discount_total']) ?: 0),
                    'wallet_amount_used' => (float) ($this->mapColumn($row, $columns, ['wallet_amount_used', 'wallet_used', 'wallet_amount', 'wallet_deducted']) ?: 0),
                    'total'              => (float) ($this->mapColumn($row, $columns, ['total', 'grand_total', 'order_total', 'amount', 'total_amount']) ?: 0),
                    'shipping_address'   => $this->mapColumn($row, $columns, ['shipping_address', 'address', 'delivery_address']),
                    'payment_method'     => $this->mapColumn($row, $columns, ['payment_method', 'payment_type', 'pay_method']) ?: 'cod',
                    'payment_status'     => $this->mapColumn($row, $columns, ['payment_status', 'pay_status']) ?: 'pending',
                    'razorpay_order_id'  => $this->mapColumn($row, $columns, ['razorpay_order_id', 'rp_order_id']),
                    'razorpay_payment_id' => $this->mapColumn($row, $columns, ['razorpay_payment_id', 'rp_payment_id', 'transaction_id']),
                ];

                // Ensure shipping_address is JSON
                if ($data['shipping_address'] && !is_array(json_decode($data['shipping_address'], true))) {
                    $data['shipping_address'] = json_encode(['raw' => $data['shipping_address']]);
                }

                $oldId = $this->mapColumn($row, $columns, ['id', 'order_id']);

                if (!$this->dryRun) {
                    $newId = DB::table('orders')->insertGetId(
                        array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                    );
                    $this->idMaps['orders'][$oldId] = $newId;

                    // Migrate order items
                    $this->migrateOrderItems($old, $oldTables, $oldId, $newId);
                }

                $count++;
                $bar->advance();
            }
        });

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} orders " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    private function migrateOrderItems($old, array $oldTables, $oldOrderId, int $newOrderId): void
    {
        $itemTable = $this->findTable($oldTables, ['order_items', 'order_details', 'tbl_order_items', 'order_products']);
        if (!$itemTable) return;

        $itemColumns = $this->getColumnNames($old, $itemTable);
        $fkCol = $this->findColumnMatch($itemColumns, ['order_id', 'ord_id']);
        if (!$fkCol) return;

        $items = $old->table($itemTable)->where($fkCol, $oldOrderId)->get();
        foreach ($items as $item) {
            $item = (array) $item;

            $oldProductId = $this->mapColumn($item, $itemColumns, ['product_id', 'prod_id', 'pid']);

            DB::table('order_items')->insert([
                'order_id'       => $newOrderId,
                'product_id'     => $this->idMaps['products'][$oldProductId] ?? null,
                'product_name'   => $this->mapColumn($item, $itemColumns, ['product_name', 'name', 'title', 'item_name']) ?: 'Unknown Product',
                'quantity'       => (int) ($this->mapColumn($item, $itemColumns, ['quantity', 'qty']) ?: 1),
                'unit_price'     => (float) ($this->mapColumn($item, $itemColumns, ['unit_price', 'price', 'amount', 'item_price']) ?: 0),
                'discount_price' => $this->mapColumn($item, $itemColumns, ['discount_price', 'sale_price', 'offer_price']),
                'created_at'     => now(),
                'updated_at'     => now(),
            ]);
        }
    }

    // ─── Banners ─────────────────────────────────────────────────────────

    private function migrateBanners($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['banners', 'banner', 'tbl_banners', 'sliders', 'tbl_sliders']);
        if (!$sourceTable) {
            $this->warn('⏭ Banners: no matching source table found');
            return;
        }

        $this->info("▸ Migrating banners from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $rows = $old->table($sourceTable)->get();
        $bar = $this->output->createProgressBar($rows->count());
        $count = 0;

        foreach ($rows as $row) {
            $row = (array) $row;

            $data = [
                'title'      => $this->mapColumn($row, $columns, ['title', 'banner_title', 'name', 'heading']),
                'subtitle'   => $this->mapColumn($row, $columns, ['subtitle', 'sub_title', 'description', 'text']),
                'image'      => $this->mapColumn($row, $columns, ['image', 'banner_image', 'img', 'image_path', 'file']),
                'link_type'  => 'url',
                'link_value' => $this->mapColumn($row, $columns, ['link', 'url', 'link_url', 'redirect_url', 'link_value']),
                'placement'  => $this->mapColumn($row, $columns, ['placement', 'position', 'location', 'type']) ?: 'homepage_carousel',
                'sort_order' => (int) ($this->mapColumn($row, $columns, ['sort_order', 'order', 'position', 'display_order']) ?: 0),
                'is_active'  => $this->mapBool($row, $columns, ['is_active', 'status', 'active'], true),
                'start_date' => $this->mapColumn($row, $columns, ['start_date', 'from_date']),
                'end_date'   => $this->mapColumn($row, $columns, ['end_date', 'to_date', 'expiry_date']),
            ];

            if (!$this->dryRun) {
                DB::table('banners')->insert(
                    array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                );
            }

            $count++;
            $bar->advance();
        }

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} banners " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    // ─── Ads ─────────────────────────────────────────────────────────────

    private function migrateAds($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['ads', 'ad', 'tbl_ads', 'advertisements', 'tbl_advertisements']);
        if (!$sourceTable) {
            $this->warn('⏭ Ads: no matching source table found');
            return;
        }

        $this->info("▸ Migrating ads from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $rows = $old->table($sourceTable)->get();
        $bar = $this->output->createProgressBar($rows->count());
        $count = 0;

        foreach ($rows as $row) {
            $row = (array) $row;

            $data = [
                'title'      => $this->mapColumn($row, $columns, ['title', 'ad_title', 'name']),
                'image'      => $this->mapColumn($row, $columns, ['image', 'ad_image', 'img', 'image_path']),
                'link_url'   => $this->mapColumn($row, $columns, ['link_url', 'url', 'link', 'redirect_url']),
                'placement'  => $this->mapColumn($row, $columns, ['placement', 'position', 'location']) ?: 'homepage',
                'clicks'     => (int) ($this->mapColumn($row, $columns, ['clicks', 'click_count']) ?: 0),
                'impressions' => (int) ($this->mapColumn($row, $columns, ['impressions', 'views', 'view_count']) ?: 0),
                'is_active'  => $this->mapBool($row, $columns, ['is_active', 'status', 'active'], true),
                'start_date' => $this->mapColumn($row, $columns, ['start_date', 'from_date']),
                'end_date'   => $this->mapColumn($row, $columns, ['end_date', 'to_date', 'expiry_date']),
            ];

            if (!$this->dryRun) {
                DB::table('ads')->insert(
                    array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                );
            }

            $count++;
            $bar->advance();
        }

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} ads " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    // ─── Coupons ─────────────────────────────────────────────────────────

    private function migrateCoupons($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['coupons', 'coupon', 'tbl_coupons', 'discount_codes', 'promo_codes']);
        if (!$sourceTable) {
            $this->warn('⏭ Coupons: no matching source table found');
            return;
        }

        $this->info("▸ Migrating coupons from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $rows = $old->table($sourceTable)->get();
        $bar = $this->output->createProgressBar($rows->count());
        $count = 0;

        foreach ($rows as $row) {
            $row = (array) $row;

            $code = $this->mapColumn($row, $columns, ['code', 'coupon_code', 'promo_code']);
            if (!$code) {
                $bar->advance();
                continue;
            }

            $data = [
                'code'              => strtoupper($code),
                'name'              => $this->mapColumn($row, $columns, ['name', 'coupon_name', 'title', 'description']) ?: $code,
                'type'              => $this->mapColumn($row, $columns, ['type', 'discount_type', 'coupon_type']) ?: 'percentage',
                'value'             => (float) ($this->mapColumn($row, $columns, ['value', 'amount', 'discount', 'discount_value', 'discount_amount']) ?: 0),
                'min_order_amount'  => $this->mapColumn($row, $columns, ['min_order_amount', 'min_amount', 'min_cart_value']),
                'max_discount_amount' => $this->mapColumn($row, $columns, ['max_discount_amount', 'max_discount', 'max_amount']),
                'usage_limit'       => $this->mapColumn($row, $columns, ['usage_limit', 'max_usage', 'limit']),
                'used_count'        => (int) ($this->mapColumn($row, $columns, ['used_count', 'usage_count', 'times_used']) ?: 0),
                'is_active'         => $this->mapBool($row, $columns, ['is_active', 'status', 'active'], true),
                'expires_at'        => $this->mapColumn($row, $columns, ['expires_at', 'expiry_date', 'end_date', 'valid_till']),
            ];

            if (!$this->dryRun) {
                DB::table('coupons')->updateOrInsert(
                    ['code' => $data['code']],
                    array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                );
            }

            $count++;
            $bar->advance();
        }

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} coupons " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    // ─── Wallet Transactions ─────────────────────────────────────────────

    private function migrateWalletTransactions($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['wallet_transactions', 'wallet_transaction', 'tbl_wallet_transactions', 'transactions', 'wallet_history']);
        if (!$sourceTable) {
            $this->warn('⏭ Wallet Transactions: no matching source table found');
            return;
        }

        $this->info("▸ Migrating wallet transactions from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $total = $old->table($sourceTable)->count();
        $bar = $this->output->createProgressBar($total);
        $count = 0;

        $old->table($sourceTable)->orderBy(
            $this->findColumnMatch($columns, ['id', 'transaction_id']) ?? 'id'
        )->chunk($this->batchSize, function ($rows) use ($columns, $bar, &$count) {

            foreach ($rows as $row) {
                $row = (array) $row;
                $oldUserId = $this->mapColumn($row, $columns, ['user_id', 'member_id', 'customer_id']);

                $data = [
                    'user_id'        => $this->idMaps['users'][$oldUserId] ?? null,
                    'type'           => $this->mapColumn($row, $columns, ['type', 'transaction_type', 'txn_type']) ?: 'credit',
                    'amount'         => (float) ($this->mapColumn($row, $columns, ['amount', 'transaction_amount', 'txn_amount']) ?: 0),
                    'description'    => $this->mapColumn($row, $columns, ['description', 'remark', 'remarks', 'note', 'narration']),
                    'reference_type' => $this->mapColumn($row, $columns, ['reference_type', 'ref_type']),
                    'reference_id'   => $this->mapColumn($row, $columns, ['reference_id', 'ref_id']),
                    'balance_after'  => (float) ($this->mapColumn($row, $columns, ['balance_after', 'closing_balance', 'balance']) ?: 0),
                ];

                if (!$this->dryRun && $data['user_id']) {
                    DB::table('wallet_transactions')->insert(
                        array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                    );
                }

                $count++;
                $bar->advance();
            }
        });

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} wallet transactions " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    // ─── Referrals ───────────────────────────────────────────────────────

    private function migrateReferrals($old, array $oldTables): void
    {
        $sourceTable = $this->findTable($oldTables, ['referrals', 'referral', 'tbl_referrals', 'referral_history']);
        if (!$sourceTable) {
            $this->warn('⏭ Referrals: no matching source table found');
            return;
        }

        $this->info("▸ Migrating referrals from '{$sourceTable}'...");
        $columns = $this->getColumnNames($old, $sourceTable);
        $rows = $old->table($sourceTable)->get();
        $bar = $this->output->createProgressBar($rows->count());
        $count = 0;

        foreach ($rows as $row) {
            $row = (array) $row;

            $oldReferrerId = $this->mapColumn($row, $columns, ['referrer_id', 'referred_by', 'parent_id', 'sponsor_id']);
            $oldReferredId = $this->mapColumn($row, $columns, ['referred_id', 'user_id', 'child_id', 'member_id']);

            $data = [
                'referrer_id'          => $this->idMaps['users'][$oldReferrerId] ?? null,
                'referred_id'          => $this->idMaps['users'][$oldReferredId] ?? null,
                'status'               => $this->mapColumn($row, $columns, ['status']) ?: 'active',
                'signup_reward_given'  => $this->mapBool($row, $columns, ['signup_reward_given', 'signup_bonus_given']),
                'purchase_reward_given' => $this->mapBool($row, $columns, ['purchase_reward_given', 'purchase_bonus_given']),
            ];

            if (!$this->dryRun && $data['referrer_id'] && $data['referred_id']) {
                DB::table('referrals')->updateOrInsert(
                    ['referred_id' => $data['referred_id']],
                    array_merge($data, ['created_at' => now(), 'updated_at' => now()])
                );
            }

            $count++;
            $bar->advance();
        }

        $bar->finish();
        $this->newLine();
        $this->info("  ✓ {$count} referrals " . ($this->dryRun ? 'would be' : '') . " migrated");
    }

    // ═══════════════════════════════════════════════════════════════════════
    //  HELPER METHODS
    // ═══════════════════════════════════════════════════════════════════════

    /**
     * Find a matching table name from the old database.
     */
    private function findTable(array $oldTables, array $candidates): ?string
    {
        foreach ($candidates as $candidate) {
            if (in_array($candidate, $oldTables, true)) {
                return $candidate;
            }
        }
        // Fuzzy match
        foreach ($candidates as $candidate) {
            foreach ($oldTables as $table) {
                if (str_contains(strtolower($table), strtolower($candidate))) {
                    return $table;
                }
            }
        }
        return null;
    }

    /**
     * Get all column names for a table.
     */
    private function getColumnNames($db, string $table): array
    {
        return collect($db->select(
            'SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?',
            [$db->getDatabaseName(), $table]
        ))->pluck('COLUMN_NAME')->toArray();
    }

    /**
     * Find the first matching column from a list of candidates.
     */
    private function findColumnMatch(array $columns, array $candidates): ?string
    {
        foreach ($candidates as $candidate) {
            if (in_array($candidate, $columns, true)) {
                return $candidate;
            }
        }
        return null;
    }

    /**
     * Get a value from the row using column name candidates.
     */
    private function mapColumn(array $row, array $columns, array $candidates): mixed
    {
        $col = $this->findColumnMatch($columns, $candidates);
        return $col ? ($row[$col] ?? null) : null;
    }

    /**
     * Map a boolean value from common patterns (1/0, yes/no, active/inactive).
     */
    private function mapBool(array $row, array $columns, array $candidates, bool $default = false): bool
    {
        $value = $this->mapColumn($row, $columns, $candidates);
        if ($value === null) return $default;
        if (is_bool($value)) return $value;
        if (is_numeric($value)) return (bool) $value;
        $value = strtolower((string) $value);
        return in_array($value, ['1', 'true', 'yes', 'active', 'approved', 'published']);
    }

    /**
     * Map user role from common patterns.
     */
    private function mapRole(array $row, array $columns): string
    {
        $role = $this->mapColumn($row, $columns, ['role', 'user_type', 'user_role', 'type', 'account_type']);
        if (!$role) return 'user';

        $role = strtolower((string) $role);
        if (in_array($role, ['admin', 'administrator', 'super_admin', 'superadmin'])) {
            return 'admin';
        }
        return 'user';
    }

    /**
     * Map order status from common patterns.
     */
    private function mapOrderStatus(array $row, array $columns): string
    {
        $status = $this->mapColumn($row, $columns, ['status', 'order_status']);
        if (!$status) return 'pending';

        $status = strtolower((string) $status);
        $map = [
            'pending'     => 'pending',
            'confirmed'   => 'confirmed',
            'processing'  => 'processing',
            'shipped'     => 'shipped',
            'delivered'   => 'delivered',
            'cancelled'   => 'cancelled',
            'canceled'    => 'cancelled',
            'completed'   => 'delivered',
            'complete'    => 'delivered',
            'paid'        => 'confirmed',
            'failed'      => 'cancelled',
            'refunded'    => 'cancelled',
        ];

        return $map[$status] ?? 'pending';
    }
}
