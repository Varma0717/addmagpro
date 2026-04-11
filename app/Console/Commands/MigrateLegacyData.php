<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

class MigrateLegacyData extends Command
{
    protected $signature = 'migrate:legacy
                            {--step= : Run a specific step (1-13)}
                            {--dry-run : Show what would be migrated without inserting}';

    protected $description = 'Migrate data from legacy_* tables into the new Laravel schema';

    private int $chunkSize = 500;
    private array $userIdMap = [];    // legacy service_id => new user id
    private array $vendorIdMap = [];  // legacy vendor_id => new vendor id
    private array $categoryIdMap = []; // legacy category id => new category id
    private array $brandIdMap = [];   // legacy brand id => new brand id
    private array $productIdMap = []; // legacy product_id => new product id

    public function handle(): int
    {
        $step = $this->option('step');
        $dryRun = $this->option('dry-run');

        if ($dryRun) {
            $this->warn('DRY RUN MODE — no data will be written.');
        }

        $steps = [
            1  => 'migrateUsers',
            2  => 'migrateVendors',
            3  => 'migrateCategories',
            4  => 'migrateBrands',
            5  => 'migrateProducts',
            6  => 'migrateServiceListings',
            7  => 'migrateOrders',
            8  => 'migrateCartAndWishlist',
            9  => 'migrateBannersAndGalleries',
            10 => 'migrateCoupons',
            11 => 'migrateWallets',
            12 => 'migrateRemainingTables',
            13 => 'postProcessReferrals',
        ];

        if ($step) {
            $step = (int) $step;
            if (!isset($steps[$step])) {
                $this->error("Invalid step: {$step}. Valid: 1-13.");
                return 1;
            }
            // Build ID maps from already-migrated data when running a single step
            $this->rebuildIdMaps();
            $this->info("Running step {$step}: {$steps[$step]}");
            $this->{$steps[$step]}($dryRun);
        } else {
            foreach ($steps as $num => $method) {
                $this->info("=== Step {$num}/13: {$method} ===");
                $this->{$method}($dryRun);
                $this->newLine();
            }
        }

        $this->info('Legacy data migration complete.');
        return 0;
    }

    // ──────────────────────────────────────────────────
    // Step 1: Users  (legacy_service_users + legacy_admins → users)
    // ──────────────────────────────────────────────────
    private function migrateUsers(bool $dryRun): void
    {
        // Migrate admin users first
        if ($this->legacyTableExists('legacy_admins')) {
            $admins = DB::table('legacy_admins')->get();
            $this->info("  Admins to migrate: {$admins->count()}");

            if (!$dryRun) {
                foreach ($admins as $admin) {
                    $id = DB::table('users')->insertGetId([
                        'name'              => $admin->name,
                        'email'             => $admin->email,
                        'phone'             => null,
                        'avatar'            => $admin->image,
                        'email_verified_at' => $this->sanitizeDate($admin->email_verified_at),
                        'password'          => $admin->password,
                        'role'              => 'admin',
                        'is_active'         => true,
                        'created_at'        => $this->sanitizeDate($admin->created_at, now()),
                        'updated_at'        => $this->sanitizeDate($admin->updated_at, now()),
                    ]);
                    $this->info("    Admin '{$admin->name}' → user #{$id}");
                }
            }
        }

        // Migrate service users
        if (!$this->legacyTableExists('legacy_service_users')) {
            $this->warn('  legacy_service_users not found, skipping.');
            return;
        }

        $total = DB::table('legacy_service_users')->count();
        $this->info("  Service users to migrate: {$total}");

        if ($dryRun) return;

        $bar = $this->output->createProgressBar($total);
        DB::table('legacy_service_users')->orderBy('service_id')->chunk($this->chunkSize, function ($users) use ($bar) {
            foreach ($users as $user) {
                $phone = trim($user->member_phone);
                $email = $phone ? "{$phone}@addmagpro.com" : "user{$user->service_id}@addmagpro.com";

                // Deduplicate email
                $baseEmail = $email;
                $counter = 1;
                while (DB::table('users')->where('email', $email)->exists()) {
                    $email = str_replace('@', "+{$counter}@", $baseEmail);
                    $counter++;
                }

                $newId = DB::table('users')->insertGetId([
                    'name'          => $user->member_name ?? 'User ' . $user->service_id,
                    'email'         => $email,
                    'phone'         => $phone ?: null,
                    'avatar'        => $user->user_profile_pic,
                    'password'      => $user->password ?: Hash::make(Str::random(16)),
                    'referral_code' => $user->referral_id ?: null,
                    'wallet_balance' => 0, // will be computed in wallet step
                    'role'          => 'user',
                    'is_active'     => true,
                    'created_at'    => $this->sanitizeDate($user->created_at, $this->sanitizeDate($user->joined_date, now())),
                    'updated_at'    => now(),
                ]);

                $this->userIdMap[$user->service_id] = $newId;
                $bar->advance();
            }
        });
        $bar->finish();
        $this->newLine();
        $this->info("  Migrated {$total} users.");
    }

    // ──────────────────────────────────────────────────
    // Step 2: Vendors
    // ──────────────────────────────────────────────────
    private function migrateVendors(bool $dryRun): void
    {
        if (!$this->legacyTableExists('legacy_vendors')) {
            $this->warn('  legacy_vendors not found, skipping.');
            return;
        }

        $vendors = DB::table('legacy_vendors')->get();
        $this->info("  Vendors to migrate: {$vendors->count()}");
        if ($dryRun) return;

        foreach ($vendors as $v) {
            $newId = DB::table('vendors')->insertGetId([
                'vendor_name'           => $v->vendor_name,
                'vendor_phone'          => $v->vendor_phone,
                'vendor_email'          => $v->vendor_email,
                'password'              => $v->password ?: null,
                'business_name'         => $v->business_name,
                'business_type'         => $v->business_type,
                'business_address'      => $v->business_address,
                'business_location'     => $v->business_location,
                'reference_id'          => $v->reference_id,
                'reference_by'          => $v->reference_by,
                'profile_image'         => $v->profile_image,
                'pancard_number'        => $v->pancard_number,
                'gst_number'            => $v->gst_number,
                'commission_percentage' => $v->commission_percentage,
                'bank_name'             => $v->bank_name,
                'account_number'        => $v->account_number,
                'ifsc'                  => $v->ifsc,
                'status'                => $v->status ?? 'Pending',
                'vendor_wallet'         => $v->vendor_wallet ?? 0,
                'created_at'            => $this->sanitizeDate($v->created_at, now()),
                'updated_at'            => now(),
            ]);
            $this->vendorIdMap[$v->vendor_id] = $newId;
        }
        $this->info("  Migrated {$vendors->count()} vendors.");
    }

    // ──────────────────────────────────────────────────
    // Step 3: Categories (legacy_categories + legacy_services + legacy_stores + legacy_classifieds → categories)
    // ──────────────────────────────────────────────────
    private function migrateCategories(bool $dryRun): void
    {
        $count = 0;

        // Ecommerce categories
        if ($this->legacyTableExists('legacy_categories')) {
            $cats = DB::table('legacy_categories')->get();
            $this->info("  E-commerce categories: {$cats->count()}");
            if (!$dryRun) {
                foreach ($cats as $cat) {
                    $name = $cat->CategoryName;
                    $newId = DB::table('categories')->insertGetId([
                        'name'      => $name,
                        'slug'      => $this->uniqueSlug('categories', $name),
                        'type'      => 'ecommerce',
                        'image'     => $cat->ImageURL,
                        'is_active' => true,
                        'created_at' => $this->sanitizeDate($cat->CreatedAt, now()),
                        'updated_at' => now(),
                    ]);
                    $this->categoryIdMap[$cat->id] = $newId;
                    $count++;
                }
            }
        }

        // Services as service categories
        if ($this->legacyTableExists('legacy_services')) {
            $services = DB::table('legacy_services')->get();
            $this->info("  Service categories: {$services->count()}");
            if (!$dryRun) {
                foreach ($services as $svc) {
                    DB::table('categories')->insert([
                        'name'      => $svc->service_name,
                        'slug'      => $this->uniqueSlug('categories', $svc->service_name),
                        'type'      => 'service',
                        'image'     => $svc->service_image,
                        'is_active' => true,
                        'created_at' => $this->sanitizeDate($svc->created_at, now()),
                        'updated_at' => now(),
                    ]);
                    $count++;
                }
            }
        }

        // Stores as service categories
        if ($this->legacyTableExists('legacy_stores')) {
            $stores = DB::table('legacy_stores')->get();
            $this->info("  Store categories: {$stores->count()}");
            if (!$dryRun) {
                foreach ($stores as $store) {
                    DB::table('categories')->insert([
                        'name'      => $store->StoreName,
                        'slug'      => $this->uniqueSlug('categories', $store->StoreName),
                        'type'      => 'service',
                        'image'     => $store->store_image,
                        'is_active' => true,
                        'created_at' => $this->sanitizeDate($store->created_at, now()),
                        'updated_at' => now(),
                    ]);
                    $count++;
                }
            }
        }

        // Classifieds as service categories
        if ($this->legacyTableExists('legacy_classifieds')) {
            $classifieds = DB::table('legacy_classifieds')->get();
            $this->info("  Classified categories: {$classifieds->count()}");
            if (!$dryRun) {
                foreach ($classifieds as $cl) {
                    DB::table('categories')->insert([
                        'name'      => $cl->classified_name,
                        'slug'      => $this->uniqueSlug('categories', $cl->classified_name),
                        'type'      => 'service',
                        'image'     => $cl->classified_image,
                        'is_active' => true,
                        'created_at' => $this->sanitizeDate($cl->created_at, now()),
                        'updated_at' => now(),
                    ]);
                    $count++;
                }
            }
        }

        $this->info("  Total categories migrated: {$count}");
    }

    // ──────────────────────────────────────────────────
    // Step 4: Brands
    // ──────────────────────────────────────────────────
    private function migrateBrands(bool $dryRun): void
    {
        if (!$this->legacyTableExists('legacy_brands')) {
            $this->warn('  legacy_brands not found, skipping.');
            return;
        }

        $brands = DB::table('legacy_brands')->get();
        $this->info("  Brands to migrate: {$brands->count()}");
        if ($dryRun) return;

        foreach ($brands as $b) {
            $newId = DB::table('brands')->insertGetId([
                'brand_name'  => $b->brand_name,
                'vendor_id'   => $this->vendorIdMap[$b->vendor_id] ?? null,
                'image'       => $b->ImageURL,
                'created_at'  => $this->sanitizeDate($b->created_at, now()),
                'updated_at'  => now(),
            ]);
            $this->brandIdMap[$b->id] = $newId;
        }
        $this->info("  Migrated {$brands->count()} brands.");
    }

    // ──────────────────────────────────────────────────
    // Step 5: Products + Product Images
    // ──────────────────────────────────────────────────
    private function migrateProducts(bool $dryRun): void
    {
        if (!$this->legacyTableExists('legacy_products_list')) {
            $this->warn('  legacy_products_list not found, skipping.');
            return;
        }

        $total = DB::table('legacy_products_list')->count();
        $this->info("  Products to migrate: {$total}");
        if ($dryRun) return;

        $bar = $this->output->createProgressBar($total);
        DB::table('legacy_products_list')->orderBy('product_id')->chunk($this->chunkSize, function ($products) use ($bar) {
            foreach ($products as $p) {
                $categoryId = $this->categoryIdMap[$p->category_id] ?? null;

                // Skip if category doesn't exist — can't have product without category
                if (!$categoryId) {
                    $bar->advance();
                    continue;
                }

                $newId = DB::table('products')->insertGetId([
                    'name'              => $p->product_name,
                    'slug'              => $this->uniqueSlug('products', $p->product_name),
                    'category_id'       => $categoryId,
                    'brand_id'          => $this->brandIdMap[$p->brand_id] ?? null,
                    'vendor_id'         => $this->vendorIdMap[$p->vendor_id] ?? null,
                    'description'       => $p->product_description,
                    'price'             => $p->unit_price ?? 0,
                    'discount_price'    => $p->purchase_price > 0 ? $p->purchase_price : null,
                    'stock'             => 100, // Legacy has no stock — default
                    'is_active'         => true,
                    'created_at'        => $this->sanitizeDate($p->created_at, now()),
                    'updated_at'        => now(),
                ]);

                $this->productIdMap[$p->product_id] = $newId;

                // Import product image
                if ($p->product_images) {
                    DB::table('product_images')->insert([
                        'product_id' => $newId,
                        'image_path' => $p->product_images,
                        'sort_order' => 0,
                        'is_primary' => true,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }

                $bar->advance();
            }
        });
        $bar->finish();
        $this->newLine();
        $this->info("  Migrated products.");
    }

    // ──────────────────────────────────────────────────
    // Step 6: Service Listings (legacy_business_listing_users → service_listings)
    // ──────────────────────────────────────────────────
    private function migrateServiceListings(bool $dryRun): void
    {
        if (!$this->legacyTableExists('legacy_business_listing_users')) {
            $this->warn('  legacy_business_listing_users not found, skipping.');
            return;
        }

        $listings = DB::table('legacy_business_listing_users')->get();
        $this->info("  Service listings to migrate: {$listings->count()}");
        if ($dryRun) return;

        foreach ($listings as $bl) {
            $userId = $this->userIdMap[$bl->service_user_id] ?? null;
            if (!$userId) continue;

            // Find or pick a service category
            $categoryId = DB::table('categories')
                ->where('type', 'service')
                ->value('id');

            if (!$categoryId) continue;

            DB::table('service_listings')->insert([
                'user_id'       => $userId,
                'category_id'   => $categoryId,
                'business_name' => $bl->member_name ?? 'Business ' . $bl->user_id,
                'slug'          => $this->uniqueSlug('service_listings', $bl->member_name ?? 'business-' . $bl->user_id),
                'description'   => $bl->description,
                'address'       => $bl->address,
                'city'          => $bl->district,
                'phone'         => $bl->member_phone,
                'is_approved'   => ($bl->status ?? '0') === '1',
                'created_at'    => $this->sanitizeDate($bl->enrolled_date, now()),
                'updated_at'    => now(),
            ]);
        }
        $this->info("  Migrated {$listings->count()} service listings.");
    }

    // ──────────────────────────────────────────────────
    // Step 7: Orders (legacy_customer_ordered_products → orders + order_items)
    // ──────────────────────────────────────────────────
    private function migrateOrders(bool $dryRun): void
    {
        if (!$this->legacyTableExists('legacy_customer_ordered_products')) {
            $this->warn('  legacy_customer_ordered_products not found, skipping.');
            return;
        }

        $orders = DB::table('legacy_customer_ordered_products')->get();
        $this->info("  Orders to migrate: {$orders->count()}");
        if ($dryRun) return;

        foreach ($orders as $o) {
            $userId = $this->userIdMap[$o->user_id] ?? null;
            if (!$userId) continue;

            $statusMap = [
                'Packing'   => 'processing',
                'Shipping'  => 'shipped',
                'Delivered' => 'delivered',
            ];

            $shippingAddress = json_encode([
                'name'    => $o->first_name,
                'email'   => $o->email,
                'phone'   => $o->mobile_no,
                'address' => $o->address,
                'city'    => $o->city,
                'state'   => $o->state,
                'zip'     => $o->zip_code,
            ]);

            $orderId = DB::table('orders')->insertGetId([
                'user_id'          => $userId,
                'order_number'     => 'LEGACY-' . str_pad($o->id, 6, '0', STR_PAD_LEFT),
                'status'           => $statusMap[$o->status] ?? 'pending',
                'subtotal'         => $o->total_amount ?? 0,
                'discount_amount'  => 0,
                'wallet_amount_used' => 0,
                'total'            => $o->total_amount ?? 0,
                'shipping_address' => $shippingAddress,
                'payment_method'   => 'cod',
                'payment_status'   => ($o->confirmation_status == 0) ? 'paid' : 'pending',
                'created_at'       => $this->sanitizeDate($o->ordered_date, now()),
                'updated_at'       => now(),
            ]);

            // Parse the JSON ordered products
            $products = json_decode($o->oredered_products ?? '[]', true);
            if (is_array($products)) {
                foreach ($products as $item) {
                    $productName = $item['product_name'] ?? $item['name'] ?? 'Unknown Product';
                    $quantity    = $item['quantity'] ?? $item['qty'] ?? 1;
                    $unitPrice   = $item['unit_price'] ?? $item['price'] ?? 0;
                    $productId   = isset($item['product_id']) ? ($this->productIdMap[$item['product_id']] ?? null) : null;

                    DB::table('order_items')->insert([
                        'order_id'     => $orderId,
                        'product_id'   => $productId,
                        'product_name' => $productName,
                        'quantity'     => $quantity,
                        'unit_price'   => $unitPrice,
                        'created_at'   => now(),
                        'updated_at'   => now(),
                    ]);
                }
            }
        }
        $this->info("  Migrated {$orders->count()} orders.");
    }

    // ──────────────────────────────────────────────────
    // Step 8: Cart & Wishlist
    // ──────────────────────────────────────────────────
    private function migrateCartAndWishlist(bool $dryRun): void
    {
        // Cart
        if ($this->legacyTableExists('legacy_cart_products')) {
            $carts = DB::table('legacy_cart_products')->get();
            $this->info("  Cart items to migrate: {$carts->count()}");
            if (!$dryRun) {
                $migrated = 0;
                foreach ($carts as $c) {
                    $userId    = $this->userIdMap[$c->service_user_id] ?? null;
                    $productId = $this->productIdMap[$c->product_id] ?? null;
                    if (!$userId || !$productId) continue;

                    // Skip duplicates
                    $exists = DB::table('cart_items')
                        ->where('user_id', $userId)
                        ->where('product_id', $productId)
                        ->exists();
                    if ($exists) continue;

                    DB::table('cart_items')->insert([
                        'user_id'    => $userId,
                        'product_id' => $productId,
                        'quantity'   => $c->quantity ?? 1,
                        'created_at' => $this->sanitizeDate($c->created_at, now()),
                        'updated_at' => now(),
                    ]);
                    $migrated++;
                }
                $this->info("  Migrated {$migrated} cart items.");
            }
        }

        // Wishlist
        if ($this->legacyTableExists('legacy_wishlist_products')) {
            $wishlists = DB::table('legacy_wishlist_products')->get();
            $this->info("  Wishlist items to migrate: {$wishlists->count()}");
            if (!$dryRun) {
                $migrated = 0;
                foreach ($wishlists as $w) {
                    $userId    = $this->userIdMap[$w->service_user_id] ?? null;
                    $productId = $this->productIdMap[$w->product_id] ?? null;
                    if (!$userId || !$productId) continue;

                    $exists = DB::table('wishlists')
                        ->where('user_id', $userId)
                        ->where('product_id', $productId)
                        ->exists();
                    if ($exists) continue;

                    DB::table('wishlists')->insert([
                        'user_id'    => $userId,
                        'product_id' => $productId,
                        'created_at' => $this->sanitizeDate($w->created_at, now()),
                        'updated_at' => now(),
                    ]);
                    $migrated++;
                }
                $this->info("  Migrated {$migrated} wishlist items.");
            }
        }
    }

    // ──────────────────────────────────────────────────
    // Step 9: Banners, Ads, Galleries
    // ──────────────────────────────────────────────────
    private function migrateBannersAndGalleries(bool $dryRun): void
    {
        // Banners → banners table
        if ($this->legacyTableExists('legacy_banners')) {
            $banners = DB::table('legacy_banners')->get();
            $this->info("  Banners: {$banners->count()}");
            if (!$dryRun) {
                foreach ($banners as $b) {
                    $placement = ($b->type === 'MainSlider') ? 'homepage_carousel' : 'homepage_mid';
                    DB::table('banners')->insert([
                        'title'      => $b->banner_name,
                        'image'      => $b->banner_image,
                        'link_type'  => 'url',
                        'link_value' => $b->banner_url,
                        'placement'  => $placement,
                        'is_active'  => true,
                        'created_at' => $this->sanitizeDate($b->created_at, now()),
                        'updated_at' => now(),
                    ]);
                }
            }
        }

        // Ads banners → ads table
        if ($this->legacyTableExists('legacy_ads_banners')) {
            $ads = DB::table('legacy_ads_banners')->get();
            $this->info("  Ad banners: {$ads->count()}");
            if (!$dryRun) {
                foreach ($ads as $a) {
                    DB::table('ads')->insert([
                        'title'     => $a->ads_banner_name,
                        'image'     => $a->ads_banner_image,
                        'link_url'  => $a->ads_banner_url,
                        'placement' => 'homepage',
                        'is_active' => true,
                        'created_at' => $this->sanitizeDate($a->created_at, now()),
                        'updated_at' => now(),
                    ]);
                }
            }
        }

        // Event banners
        if ($this->legacyTableExists('legacy_events_banners')) {
            $events = DB::table('legacy_events_banners')->get();
            $this->info("  Event banners: {$events->count()}");
            if (!$dryRun) {
                foreach ($events as $e) {
                    DB::table('event_banners')->insert([
                        'event_banner_name'  => $e->event_banner_name,
                        'event_banner_image' => $e->event_banner_image,
                        'created_at'         => $this->sanitizeDate($e->created_at, now()),
                        'updated_at'         => now(),
                    ]);
                }
            }
        }

        // Galleries
        if ($this->legacyTableExists('legacy_gallery')) {
            $galleries = DB::table('legacy_gallery')->get();
            $this->info("  Gallery items: {$galleries->count()}");
            if (!$dryRun) {
                foreach ($galleries as $g) {
                    DB::table('galleries')->insert([
                        'gallery_name'  => $g->gallery_name,
                        'gallery_url'   => $g->gallery_url,
                        'gallery_image' => $g->gallery_image,
                        'created_at'    => $this->sanitizeDate($g->created_at, now()),
                        'updated_at'    => now(),
                    ]);
                }
            }
        }

        // Gadget galleries
        if ($this->legacyTableExists('legacy_gadget_gallery')) {
            $gadgets = DB::table('legacy_gadget_gallery')->get();
            $this->info("  Gadget gallery items: {$gadgets->count()}");
            if (!$dryRun) {
                foreach ($gadgets as $g) {
                    DB::table('gadget_galleries')->insert([
                        'gadget_gallery_name'  => $g->gadget_gallery_name,
                        'gadget_gallery_url'   => $g->gadget_gallery_url,
                        'gadget_gallery_image' => $g->gadget_gallery_image,
                        'created_at'           => $this->sanitizeDate($g->created_at, now()),
                        'updated_at'           => now(),
                    ]);
                }
            }
        }

        // Speciality store images
        if ($this->legacyTableExists('legacy_speciality_store_images')) {
            $stores = DB::table('legacy_speciality_store_images')->get();
            $this->info("  Speciality store images: {$stores->count()}");
            if (!$dryRun) {
                foreach ($stores as $s) {
                    DB::table('speciality_store_images')->insert([
                        'store_name'  => $s->store_name,
                        'store_image' => $s->store_image,
                        'created_at'  => $this->sanitizeDate($s->created_at, now()),
                        'updated_at'  => now(),
                    ]);
                }
            }
        }

        // Vendor banners
        if ($this->legacyTableExists('legacy_vendor_banners')) {
            $vBanners = DB::table('legacy_vendor_banners')->get();
            $this->info("  Vendor banners: {$vBanners->count()}");
            if (!$dryRun) {
                foreach ($vBanners as $vb) {
                    $vendorId = $this->vendorIdMap[$vb->vendor_id] ?? null;
                    if (!$vendorId) continue;
                    DB::table('vendor_banners')->insert([
                        'vendor_id'  => $vendorId,
                        'image_url'  => $vb->ImageURL,
                        'created_at' => $this->sanitizeDate($vb->created_at, now()),
                        'updated_at' => now(),
                    ]);
                }
            }
        }
    }

    // ──────────────────────────────────────────────────
    // Step 10: Coupons
    // ──────────────────────────────────────────────────
    private function migrateCoupons(bool $dryRun): void
    {
        if (!$this->legacyTableExists('legacy_user_coupon_codes')) {
            $this->warn('  legacy_user_coupon_codes not found, skipping.');
            return;
        }

        $coupons = DB::table('legacy_user_coupon_codes')->get();
        $this->info("  Coupon records: {$coupons->count()}");
        if ($dryRun) return;

        $couponMap = []; // coupon_code => new coupon id
        foreach ($coupons as $c) {
            $code = $c->coupon_code;

            // Create coupon if not already created
            if (!isset($couponMap[$code])) {
                $couponId = DB::table('coupons')->insertGetId([
                    'code'       => $code,
                    'name'       => 'Legacy Coupon: ' . $code,
                    'type'       => 'fixed',
                    'value'      => 0, // Legacy has no value info
                    'is_active'  => ($c->status === 'Active'),
                    'created_at' => $this->sanitizeDate($c->created_at, now()),
                    'updated_at' => now(),
                ]);
                $couponMap[$code] = $couponId;
            }

            // Link user to coupon
            $userId = $this->userIdMap[$c->user_id] ?? null;
            if ($userId) {
                $exists = DB::table('user_coupons')
                    ->where('user_id', $userId)
                    ->where('coupon_id', $couponMap[$code])
                    ->exists();
                if (!$exists) {
                    DB::table('user_coupons')->insert([
                        'user_id'    => $userId,
                        'coupon_id'  => $couponMap[$code],
                        'used_at'    => ($c->status === 'Expired') ? $this->sanitizeDate($c->created_at, now()) : null,
                        'created_at' => $this->sanitizeDate($c->created_at, now()),
                        'updated_at' => now(),
                    ]);
                }
            }
        }
        $this->info("  Created " . count($couponMap) . " unique coupons, linked to users.");
    }

    // ──────────────────────────────────────────────────
    // Step 11: Wallets (7 legacy wallet tables → new wallet tables + wallet_transactions)
    // ──────────────────────────────────────────────────
    private function migrateWallets(bool $dryRun): void
    {
        // Admin wallets
        if ($this->legacyTableExists('legacy_admin_wallets')) {
            $adminWallets = DB::table('legacy_admin_wallets')->get();
            $this->info("  Admin wallet entries: {$adminWallets->count()}");
            if (!$dryRun) {
                foreach ($adminWallets as $aw) {
                    DB::table('admin_wallets')->insert([
                        'back_two_back' => $aw->back_two_back ?? 0,
                        'charity'       => $aw->charity ?? 0,
                        'monthly_pool'  => $aw->monthly_pool ?? 0,
                        'company'       => $aw->company ?? 0,
                        'created_at'    => $this->sanitizeDate($aw->created_at, now()),
                        'updated_at'    => now(),
                    ]);
                }
            }
        }

        // Commission wallets (large — use chunking)
        if ($this->legacyTableExists('legacy_commission_wallet')) {
            $total = DB::table('legacy_commission_wallet')->count();
            $this->info("  Commission wallet entries: {$total}");
            if (!$dryRun) {
                $bar = $this->output->createProgressBar($total);
                DB::table('legacy_commission_wallet')->orderBy('wallet_id')->chunk($this->chunkSize, function ($rows) use ($bar) {
                    $batch = [];
                    foreach ($rows as $r) {
                        $batch[] = [
                            'user_id'         => $r->user_id,
                            'balance'         => $r->balance ?? 0,
                            'purchase_income' => $r->purchase_income ?? 0,
                            'created_at'      => $this->sanitizeDate($r->created_at, now()),
                            'updated_at'      => now(),
                        ];
                        $bar->advance();
                    }
                    DB::table('commission_wallets')->insert($batch);
                });
                $bar->finish();
                $this->newLine();
            }
        }

        // B2B wallets
        $this->migrateSimpleWallet('legacy_backtwoback_wallet', 'b2b_wallets', $dryRun);

        // Pool commission wallets
        $this->migrateSimpleWallet('legacy_pool_commision_wallet', 'pool_commission_wallets', $dryRun);

        // Product wallets
        $this->migrateSimpleWallet('legacy_product_wallet', 'product_wallets', $dryRun);

        // Purchase wallets
        $this->migrateSimpleWallet('legacy_purchase_wallet', 'purchase_wallets', $dryRun);

        // Reward wallets
        $this->migrateSimpleWallet('legacy_reward_wallet', 'reward_wallets', $dryRun);

        // User commission wallets
        if ($this->legacyTableExists('legacy_users_commission_wallets')) {
            $ucw = DB::table('legacy_users_commission_wallets')->get();
            $this->info("  User commission wallet entries: {$ucw->count()}");
            if (!$dryRun) {
                foreach ($ucw as $r) {
                    DB::table('user_commission_wallets')->insert([
                        'user_id'         => $r->user_id,
                        'back_two_back'   => $r->back_two_back ?? 0,
                        'pool_commission' => $r->pool_commission ?? 0,
                        'cashback'        => $r->cashback ?? 0,
                        'created_at'      => $this->sanitizeDate($r->created_at, now()),
                        'updated_at'      => now(),
                    ]);
                }
            }
        }

        // Compute user wallet_balance from all wallet types
        if (!$dryRun) {
            $this->info('  Computing aggregate wallet balances for users...');
            $this->computeUserWalletBalances();
        }
    }

    private function migrateSimpleWallet(string $legacyTable, string $newTable, bool $dryRun): void
    {
        if (!$this->legacyTableExists($legacyTable)) return;
        $rows = DB::table($legacyTable)->get();
        $this->info("  {$legacyTable}: {$rows->count()} entries");
        if ($dryRun) return;
        foreach ($rows as $r) {
            DB::table($newTable)->insert([
                'user_id'    => $r->user_id,
                'balance'    => $r->balance ?? 0,
                'created_at' => $this->sanitizeDate($r->created_at, now()),
                'updated_at' => now(),
            ]);
        }
    }

    private function computeUserWalletBalances(): void
    {
        // Sum latest balance per user from commission_wallets
        $balances = DB::table('commission_wallets')
            ->select('user_id', DB::raw('SUM(balance) as total'))
            ->groupBy('user_id')
            ->get();

        foreach ($balances as $b) {
            $userId = $this->userIdMap[$b->user_id] ?? null;
            if (!$userId) continue;

            DB::table('users')
                ->where('id', $userId)
                ->update(['wallet_balance' => $b->total]);

            // Create a wallet transaction record
            DB::table('wallet_transactions')->insert([
                'user_id'       => $userId,
                'type'          => 'credit',
                'amount'        => abs($b->total),
                'description'   => 'Legacy migration: commission wallet balance',
                'balance_after' => $b->total,
                'created_at'    => now(),
                'updated_at'    => now(),
            ]);
        }
    }

    // ──────────────────────────────────────────────────
    // Step 12: Remaining tables (states, districts, franchises, KYC, etc.)
    // ──────────────────────────────────────────────────
    private function migrateRemainingTables(bool $dryRun): void
    {
        // States
        if ($this->legacyTableExists('legacy_states')) {
            $states = DB::table('legacy_states')->get();
            $this->info("  States: {$states->count()}");
            if (!$dryRun) {
                foreach ($states as $s) {
                    DB::table('states')->insert([
                        'id'         => $s->state_id,
                        'state_name' => $s->state_name,
                        'created_at' => $this->sanitizeDate($s->created_at, now()),
                        'updated_at' => $this->sanitizeDate($s->updated_at, now()),
                    ]);
                }
            }
        }

        // Districts
        if ($this->legacyTableExists('legacy_districts')) {
            $districts = DB::table('legacy_districts')->get();
            $this->info("  Districts: {$districts->count()}");
            if (!$dryRun) {
                foreach ($districts as $d) {
                    DB::table('districts')->insert([
                        'id'            => $d->district_id,
                        'state_id'      => $d->state_id,
                        'district_name' => $d->district_name,
                        'created_at'    => $this->sanitizeDate($d->created_at, now()),
                        'updated_at'    => now(),
                    ]);
                }
            }
        }

        // Franchises
        if ($this->legacyTableExists('legacy_franchises')) {
            $franchises = DB::table('legacy_franchises')->get();
            $this->info("  Franchises: {$franchises->count()}");
            if (!$dryRun) {
                foreach ($franchises as $f) {
                    DB::table('franchises')->insert([
                        'franchise_name'       => $f->franchise_name,
                        'franchise_owner'      => $f->franchise_owner,
                        'franchise_location'   => $f->franchise_location,
                        'franchise_phone'      => $f->franchise_phone,
                        'franchise_email'      => $f->franchise_email,
                        'franchise_type'       => $f->franchise_type,
                        'franchise_start_date' => $this->sanitizeDate($f->franchise_start_date),
                        'franchise_status'     => $f->franchise_status,
                        'franchise_revenue'    => $f->franchise_revenue ?? 0,
                        'franchise_expenses'   => $f->franchise_expenses ?? 0,
                        'franchise_profit'     => $f->franchise_profit ?? 0,
                        'created_at'           => now(),
                        'updated_at'           => now(),
                    ]);
                }
            }
        }

        // KYC Verifications
        if ($this->legacyTableExists('legacy_kycverification')) {
            $kycs = DB::table('legacy_kycverification')->get();
            $this->info("  KYC verifications: {$kycs->count()}");
            if (!$dryRun) {
                foreach ($kycs as $k) {
                    DB::table('kyc_verifications')->insert([
                        'user_id'       => $this->userIdMap[$k->userid] ?? $k->userid,
                        'full_name'     => $k->full_name,
                        'kyc_status'    => $k->kyc_status ?? 'Pending',
                        'approved_date' => $this->sanitizeDate($k->approved_date),
                        'created_at'    => now(),
                        'updated_at'    => now(),
                    ]);
                }
            }
        }

        // User bank details
        if ($this->legacyTableExists('legacy_user_bank_details')) {
            $banks = DB::table('legacy_user_bank_details')->get();
            $this->info("  User bank details: {$banks->count()}");
            if (!$dryRun) {
                foreach ($banks as $b) {
                    DB::table('user_bank_details')->insert([
                        'user_id'        => $this->userIdMap[$b->user_id] ?? $b->user_id,
                        'user_name'      => $b->user_name,
                        'bank_name'      => $b->bank_name,
                        'account_number' => $b->account_number,
                        'ifsc'           => $b->ifsc,
                        'pancard_number' => $b->pancard_number,
                        'created_at'     => $this->sanitizeDate($b->created_at, now()),
                        'updated_at'     => now(),
                    ]);
                }
            }
        }

        // Active users
        if ($this->legacyTableExists('legacy_active_users')) {
            $activeUsers = DB::table('legacy_active_users')->get();
            $this->info("  Active users: {$activeUsers->count()}");
            if (!$dryRun) {
                foreach ($activeUsers as $au) {
                    DB::table('active_users')->insert([
                        'user_id'    => $this->userIdMap[$au->user_id] ?? $au->user_id,
                        'user_name'  => $au->user_name,
                        'created_at' => $this->sanitizeDate($au->created_at, now()),
                        'updated_at' => now(),
                    ]);
                }
            }
        }

        // Home page headings
        if ($this->legacyTableExists('legacy_home_page_headings')) {
            $headings = DB::table('legacy_home_page_headings')->get();
            $this->info("  Home page headings: {$headings->count()}");
            if (!$dryRun) {
                foreach ($headings as $h) {
                    DB::table('home_page_headings')->insert([
                        'home_page_name' => $h->home_page_name,
                        'heading'        => $h->heading,
                        'created_at'     => $this->sanitizeDate($h->created_at, now()),
                        'updated_at'     => now(),
                    ]);
                }
            }
        }

        // Discount vendors
        if ($this->legacyTableExists('legacy_discount_vendors')) {
            $dv = DB::table('legacy_discount_vendors')->get();
            $this->info("  Discount vendors: {$dv->count()}");
            if (!$dryRun) {
                foreach ($dv as $d) {
                    DB::table('discount_vendors')->insert([
                        'user_id'           => $this->userIdMap[$d->user_id] ?? $d->user_id,
                        'member_name'       => $d->member_name,
                        'member_phone'      => $d->member_phone,
                        'shop_name'         => $d->shop_name,
                        'gst_number'        => $d->gst_number,
                        'shop_description'  => $d->shop_description,
                        'address'           => $d->address,
                        'location'          => $d->location,
                        'banner_image'      => $d->banner_image,
                        'state'             => $d->state,
                        'district'          => $d->district,
                        'pincode'           => $d->pincode,
                        'bank_name'         => $d->bank_name,
                        'account_name'      => $d->account_name,
                        'ifsc_code'         => $d->ifsc_code,
                        'discount_margin'   => $d->discount_margin,
                        'withdrawal_amount' => $d->withdrawal_amount ?? 0,
                        'created_at'        => $this->sanitizeDate($d->created_at, now()),
                        'updated_at'        => now(),
                    ]);
                }
            }
        }

        // Discount store purchases
        if ($this->legacyTableExists('legacy_discount_store_purchases')) {
            $dsp = DB::table('legacy_discount_store_purchases')->get();
            $this->info("  Discount store purchases: {$dsp->count()}");
            if (!$dryRun) {
                foreach ($dsp as $d) {
                    DB::table('discount_store_purchases')->insert([
                        'vendor_id'        => $d->vendor_id,
                        'customer_id'      => $this->userIdMap[$d->customer_id] ?? $d->customer_id,
                        'store_name'       => $d->store_name,
                        'purchase_amount'  => $d->purchase_amount ?? 0,
                        'discount_margin'  => $d->discount_margin ?? 0,
                        'total_amount'     => $d->total_amount ?? 0,
                        'vendor_commision' => $d->vendor_commision ?? 0,
                        'created_at'       => $this->sanitizeDate($d->created_at, now()),
                        'updated_at'       => now(),
                    ]);
                }
            }
        }

        // Pin systems
        if ($this->legacyTableExists('legacy_pin_system')) {
            $pins = DB::table('legacy_pin_system')->get();
            $this->info("  Pin systems: {$pins->count()}");
            if (!$dryRun) {
                foreach ($pins as $p) {
                    DB::table('pin_systems')->insert([
                        'user_id'    => $this->userIdMap[$p->user_id] ?? $p->user_id,
                        'total_pins' => $p->total_pins ?? 0,
                        'created_at' => $this->sanitizeDate($p->created_at, now()),
                        'updated_at' => now(),
                    ]);
                }
            }
        }

        // Vendor withdraw requests
        if ($this->legacyTableExists('legacy_vendor_withdraw_requests')) {
            $vwr = DB::table('legacy_vendor_withdraw_requests')->get();
            $this->info("  Vendor withdraw requests: {$vwr->count()}");
            if (!$dryRun) {
                foreach ($vwr as $r) {
                    DB::table('vendor_withdraw_requests')->insert([
                        'vendor_id'      => $this->vendorIdMap[$r->vendor_id] ?? 1,
                        'user_id'        => $this->userIdMap[$r->user_id] ?? $r->user_id,
                        'vendor_name'    => $r->vendor_name,
                        'mobile_number'  => $r->mobile_number,
                        'withdraw_amount' => $r->withdraw_amount ?? 0,
                        'status'         => $r->status ?? 'pending',
                        'created_at'     => $this->sanitizeDate($r->created_at, now()),
                        'updated_at'     => now(),
                    ]);
                }
            }
        }

        // Withdrawal requests
        if ($this->legacyTableExists('legacy_withdrawalrequests')) {
            $wr = DB::table('legacy_withdrawalrequests')->get();
            $this->info("  Withdrawal requests: {$wr->count()}");
            if (!$dryRun) {
                foreach ($wr as $r) {
                    DB::table('withdrawal_requests')->insert([
                        'user_id'         => $this->userIdMap[$r->UserID] ?? $r->UserID,
                        'amount'          => $r->Amount ?? 0,
                        'currency'        => $r->Currency ?? 'INR',
                        'payment_method'  => $r->PaymentMethod,
                        'request_date'    => $this->sanitizeDate($r->RequestDate),
                        'status'          => strtolower($r->Status ?? 'pending'),
                        'completion_date' => $this->sanitizeDate($r->CompletionDate),
                        'created_at'      => $this->sanitizeDate($r->RequestDate, now()),
                        'updated_at'      => now(),
                    ]);
                }
            }
        }

        // Service subscriptions
        if ($this->legacyTableExists('legacy_servicesusers')) {
            $subs = DB::table('legacy_servicesusers')->get();
            $this->info("  Service subscriptions: {$subs->count()}");
            if (!$dryRun) {
                foreach ($subs as $s) {
                    DB::table('service_subscriptions')->insert([
                        'user_id'                  => $this->userIdMap[$s->UserID] ?? $s->UserID,
                        'service_id'               => $s->ServiceID,
                        'subscription_start_date'  => $s->SubscriptionStartDate,
                        'subscription_end_date'    => $s->SubscriptionEndDate,
                        'service_name'             => $s->ServiceName,
                        'service_provider'         => $s->ServiceProvider,
                        'service_type'             => $s->ServiceType ?? 'subscription',
                        'subscription_plan'        => $s->SubscriptionPlan,
                        'subscription_status'      => $s->SubscriptionStatus ?? 'active',
                        'payment_method'           => $s->PaymentMethod,
                        'payment_status'           => $s->PaymentStatus ?? 'pending',
                        'payment_amount'           => $s->PaymentAmount ?? 0,
                        'renewal_frequency'        => $s->RenewalFrequency,
                        'auto_renewal'             => $s->AutoRenewal ?? false,
                        'next_renewal_date'        => $s->NextRenewalDate,
                        'usage_history'            => $s->UsageHistory,
                        'cancellation_date'        => $s->SubscriptionCancellationDate,
                        'cancellation_reason'      => $s->CancellationReason,
                        'service_status'           => $s->ServiceStatus ?? 'active',
                        'created_at'               => now(),
                        'updated_at'               => now(),
                    ]);
                }
            }
        }

        // Admin notifications
        if ($this->legacyTableExists('legacy_admin_notifications')) {
            $notifs = DB::table('legacy_admin_notifications')->get();
            $this->info("  Admin notifications: {$notifs->count()}");
            if (!$dryRun && $notifs->count() > 0) {
                foreach ($notifs as $n) {
                    $userId = $this->userIdMap[$n->user_id] ?? null;
                    if (!$userId) continue;
                    DB::table('notifications')->insert([
                        'user_id'    => $userId,
                        'title'      => $n->title ?? '',
                        'body'       => $n->title ?? '',
                        'type'       => 'admin',
                        'is_read'    => $n->read_status ?? false,
                        'created_at' => $this->sanitizeDate($n->created_at, now()),
                        'updated_at' => $this->sanitizeDate($n->updated_at, now()),
                    ]);
                }
            }
        }
    }

    // ──────────────────────────────────────────────────
    // Step 13: Post-process referrals
    // ──────────────────────────────────────────────────
    private function postProcessReferrals(bool $dryRun): void
    {
        if (!$this->legacyTableExists('legacy_service_users')) {
            $this->warn('  legacy_service_users not found, skipping referral resolution.');
            return;
        }

        $this->info('  Resolving referral_by codes → referred_by user IDs...');
        if ($dryRun) return;

        // Build referral_id → user_id map from the new users table
        $referralMap = DB::table('users')
            ->whereNotNull('referral_code')
            ->pluck('id', 'referral_code')
            ->toArray();

        // Read legacy referral_by values
        $legacyUsers = DB::table('legacy_service_users')
            ->whereNotNull('referral_by')
            ->where('referral_by', '!=', '')
            ->select('service_id', 'referral_by')
            ->get();

        $resolved = 0;
        foreach ($legacyUsers as $lu) {
            $referrerId = $referralMap[$lu->referral_by] ?? null;
            $userId     = $this->userIdMap[$lu->service_id] ?? null;

            if (!$referrerId || !$userId || $referrerId === $userId) continue;

            // Update users.referred_by
            DB::table('users')->where('id', $userId)->update(['referred_by' => $referrerId]);

            // Create referral record
            $exists = DB::table('referrals')
                ->where('referred_id', $userId)
                ->exists();

            if (!$exists) {
                DB::table('referrals')->insert([
                    'referrer_id'          => $referrerId,
                    'referred_id'          => $userId,
                    'status'               => 'active',
                    'signup_reward_given'   => false,
                    'purchase_reward_given' => false,
                    'created_at'           => now(),
                    'updated_at'           => now(),
                ]);
                $resolved++;
            }
        }
        $this->info("  Resolved {$resolved} referral relationships.");
    }

    // ──────────────────────────────────────────────────
    // Helpers
    // ──────────────────────────────────────────────────
    private function legacyTableExists(string $table): bool
    {
        return Schema::hasTable($table);
    }

    /**
     * Sanitize a date value from legacy data.
     * Converts '0000-00-00 00:00:00', empty strings, and other invalid dates to the fallback.
     */
    private function sanitizeDate($value, $fallback = null)
    {
        if ($value === null || $value === '' || $value === '0000-00-00 00:00:00' || $value === '0000-00-00') {
            return $fallback;
        }
        return $value;
    }

    private function uniqueSlug(string $table, string $name): string
    {
        $slug = Str::slug($name);
        if (!$slug) $slug = 'item-' . Str::random(6);

        $original = $slug;
        $counter = 1;
        while (DB::table($table)->where('slug', $slug)->exists()) {
            $slug = $original . '-' . $counter;
            $counter++;
        }
        return $slug;
    }

    /**
     * Rebuild ID maps from already-migrated data (for running individual steps).
     */
    private function rebuildIdMaps(): void
    {
        $this->info('  Rebuilding ID maps from already-migrated data...');

        // User ID map: match by phone or email pattern
        if ($this->legacyTableExists('legacy_service_users')) {
            $legacyUsers = DB::table('legacy_service_users')->select('service_id', 'member_phone')->get();
            foreach ($legacyUsers as $lu) {
                $phone = trim($lu->member_phone);
                if ($phone) {
                    $newUser = DB::table('users')->where('phone', $phone)->first();
                    if ($newUser) {
                        $this->userIdMap[$lu->service_id] = $newUser->id;
                    }
                }
            }
            $this->info('    Users mapped: ' . count($this->userIdMap));
        }

        // Vendor ID map: match by phone
        if ($this->legacyTableExists('legacy_vendors')) {
            $legacyVendors = DB::table('legacy_vendors')->select('vendor_id', 'vendor_phone')->get();
            $newVendors = DB::table('vendors')->pluck('id', 'vendor_phone')->toArray();
            foreach ($legacyVendors as $lv) {
                if (isset($newVendors[$lv->vendor_phone])) {
                    $this->vendorIdMap[$lv->vendor_id] = $newVendors[$lv->vendor_phone];
                }
            }
            $this->info('    Vendors mapped: ' . count($this->vendorIdMap));
        }

        // Category ID map: match by name
        if ($this->legacyTableExists('legacy_categories')) {
            $legacyCats = DB::table('legacy_categories')->select('id', 'CategoryName')->get();
            foreach ($legacyCats as $lc) {
                $newCat = DB::table('categories')->where('name', $lc->CategoryName)->first();
                if ($newCat) {
                    $this->categoryIdMap[$lc->id] = $newCat->id;
                }
            }
            $this->info('    Categories mapped: ' . count($this->categoryIdMap));
        }

        // Brand ID map: match by name
        if ($this->legacyTableExists('legacy_brands')) {
            $legacyBrands = DB::table('legacy_brands')->select('id', 'brand_name')->get();
            $newBrands = DB::table('brands')->pluck('id', 'brand_name')->toArray();
            foreach ($legacyBrands as $lb) {
                if (isset($newBrands[$lb->brand_name])) {
                    $this->brandIdMap[$lb->id] = $newBrands[$lb->brand_name];
                }
            }
            $this->info('    Brands mapped: ' . count($this->brandIdMap));
        }

        // Product ID map: match by slug
        if ($this->legacyTableExists('legacy_products_list')) {
            $legacyProducts = DB::table('legacy_products_list')->select('product_id', 'product_name')->get();
            foreach ($legacyProducts as $lp) {
                $slug = Str::slug($lp->product_name);
                $newProduct = DB::table('products')->where('slug', 'like', $slug . '%')->first();
                if ($newProduct) {
                    $this->productIdMap[$lp->product_id] = $newProduct->id;
                }
            }
            $this->info('    Products mapped: ' . count($this->productIdMap));
        }
    }
}
