<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class CleanSeedCategories extends Command
{
    protected $signature = 'categories:clean-seeds {--dry-run : Show what would be done without making changes}';
    protected $description = 'Deactivate seeded categories that have no products/listings and are duplicated by legacy imports';

    public function handle(): int
    {
        $dryRun = $this->option('dry-run');

        if ($dryRun) {
            $this->warn('DRY RUN — no changes will be made.');
        }

        // Find categories that have NO image (seeded ones only have icons)
        // AND have no products or service listings linked to them
        $candidates = DB::table('categories')
            ->whereNull('image')
            ->orWhere('image', '')
            ->get();

        $this->info("Categories without images: {$candidates->count()}");

        $deactivated = 0;
        $reassigned = 0;

        foreach ($candidates as $cat) {
            $productCount = DB::table('products')->where('category_id', $cat->id)->count();
            $listingCount = DB::table('service_listings')->where('category_id', $cat->id)->count();

            $this->line("  [{$cat->id}] {$cat->name} ({$cat->type}) — {$productCount} products, {$listingCount} listings, icon: {$cat->icon}");

            // Try to find a matching legacy category (with image) by similar name
            $match = DB::table('categories')
                ->where('id', '!=', $cat->id)
                ->where('type', $cat->type)
                ->whereNotNull('image')
                ->where('image', '!=', '')
                ->where(function ($q) use ($cat) {
                    $q->where('name', 'like', $cat->name)
                        ->orWhere('name', 'like', '%' . $cat->name . '%')
                        ->orWhere(DB::raw('LOWER(name)'), 'like', '%' . strtolower($cat->name) . '%');
                })
                ->first();

            if ($match) {
                $this->info("    → Match found: [{$match->id}] {$match->name} (image: {$match->image})");

                if ($productCount > 0 || $listingCount > 0) {
                    // Reassign products/listings to the matched category
                    if (!$dryRun) {
                        if ($productCount > 0) {
                            DB::table('products')->where('category_id', $cat->id)->update(['category_id' => $match->id]);
                        }
                        if ($listingCount > 0) {
                            DB::table('service_listings')->where('category_id', $cat->id)->update(['category_id' => $match->id]);
                        }
                    }
                    $this->info("    → Reassigned {$productCount} products + {$listingCount} listings to [{$match->id}]");
                    $reassigned += $productCount + $listingCount;
                }

                // Deactivate the seeded category
                if (!$dryRun) {
                    DB::table('categories')->where('id', $cat->id)->update(['is_active' => false]);
                }
                $this->info("    → Deactivated [{$cat->id}] {$cat->name}");
                $deactivated++;
            } else {
                // No match — if it has products/listings, copy image from the seeder icon as-is
                if ($productCount > 0 || $listingCount > 0) {
                    $this->warn("    → No matching legacy category, keeping active (has {$productCount} products)");
                } else {
                    // No match, no products — deactivate
                    if (!$dryRun) {
                        DB::table('categories')->where('id', $cat->id)->update(['is_active' => false]);
                    }
                    $this->info("    → No match, no products — deactivated");
                    $deactivated++;
                }
            }
        }

        $this->newLine();
        $this->info("Deactivated: {$deactivated} categories");
        $this->info("Reassigned: {$reassigned} items");

        return 0;
    }
}
