<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('discount_vendors', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('member_name', 50)->nullable();
            $table->string('member_phone', 20)->nullable();
            $table->string('shop_name', 30)->nullable();
            $table->string('gst_number', 20)->nullable();
            $table->text('shop_description')->nullable();
            $table->text('address')->nullable();
            $table->string('location', 200)->nullable();
            $table->text('banner_image')->nullable();
            $table->string('state', 20)->nullable();
            $table->string('district', 10)->nullable();
            $table->integer('pincode')->nullable();
            $table->string('bank_name', 50)->nullable();
            $table->string('account_name', 50)->nullable();
            $table->string('ifsc_code', 50)->nullable();
            $table->integer('discount_margin')->nullable();
            $table->bigInteger('withdrawal_amount')->default(0);
            $table->timestamps();
        });

        Schema::create('discount_store_purchases', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('vendor_id')->nullable();
            $table->unsignedBigInteger('customer_id')->nullable();
            $table->string('store_name', 200)->nullable();
            $table->integer('purchase_amount')->default(0);
            $table->integer('discount_margin')->default(0);
            $table->integer('total_amount')->default(0);
            $table->bigInteger('vendor_commision')->default(0);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('discount_store_purchases');
        Schema::dropIfExists('discount_vendors');
    }
};
