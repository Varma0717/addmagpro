<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('vendor_banners', function (Blueprint $table) {
            $table->id();
            $table->foreignId('vendor_id')->constrained('vendors')->cascadeOnDelete();
            $table->string('image_url')->nullable();
            $table->timestamps();
        });

        Schema::create('vendor_withdraw_requests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('vendor_id')->constrained('vendors')->cascadeOnDelete();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('vendor_name', 200)->nullable();
            $table->string('mobile_number', 13)->nullable();
            $table->bigInteger('withdraw_amount')->default(0);
            $table->enum('status', ['pending', 'approved', 'rejected'])->default('pending');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('vendor_withdraw_requests');
        Schema::dropIfExists('vendor_banners');
    }
};
