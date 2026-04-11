<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('admin_wallets', function (Blueprint $table) {
            $table->id();
            $table->integer('back_two_back')->default(0);
            $table->integer('charity')->default(0);
            $table->integer('monthly_pool')->default(0);
            $table->integer('company')->default(0);
            $table->timestamps();
        });

        Schema::create('commission_wallets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->index();
            $table->integer('balance')->default(0);
            $table->integer('purchase_income')->default(0);
            $table->timestamps();
        });

        Schema::create('b2b_wallets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->index();
            $table->integer('balance')->default(0);
            $table->timestamps();
        });

        Schema::create('pool_commission_wallets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->index();
            $table->integer('balance')->default(0);
            $table->timestamps();
        });

        Schema::create('product_wallets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->index();
            $table->integer('balance')->default(0);
            $table->timestamps();
        });

        Schema::create('purchase_wallets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->index();
            $table->integer('balance')->default(0);
            $table->timestamps();
        });

        Schema::create('reward_wallets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->index();
            $table->integer('balance')->default(0);
            $table->timestamps();
        });

        Schema::create('user_commission_wallets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->index();
            $table->integer('back_two_back')->default(0);
            $table->integer('pool_commission')->default(0);
            $table->integer('cashback')->default(0);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('user_commission_wallets');
        Schema::dropIfExists('reward_wallets');
        Schema::dropIfExists('purchase_wallets');
        Schema::dropIfExists('product_wallets');
        Schema::dropIfExists('pool_commission_wallets');
        Schema::dropIfExists('b2b_wallets');
        Schema::dropIfExists('commission_wallets');
        Schema::dropIfExists('admin_wallets');
    }
};
