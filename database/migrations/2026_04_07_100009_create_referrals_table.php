<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('referrals', function (Blueprint $table) {
            $table->id();
            $table->foreignId('referrer_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('referred_id')->constrained('users')->cascadeOnDelete();
            $table->enum('status', ['pending', 'active'])->default('pending');
            $table->boolean('signup_reward_given')->default(false);
            $table->boolean('purchase_reward_given')->default(false);
            $table->timestamps();
            $table->unique('referred_id');
        });

        Schema::create('referral_settings', function (Blueprint $table) {
            $table->id();
            $table->enum('event', ['signup', 'first_purchase'])->unique();
            $table->decimal('referrer_amount', 10, 2)->default(0);
            $table->decimal('referee_amount', 10, 2)->default(0);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('referral_settings');
        Schema::dropIfExists('referrals');
    }
};
