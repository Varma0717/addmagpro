<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('vendors', function (Blueprint $table) {
            $table->id();
            $table->string('vendor_name', 50);
            $table->string('vendor_phone', 10)->nullable();
            $table->string('vendor_email')->nullable();
            $table->string('password')->nullable();
            $table->string('business_name', 100)->nullable();
            $table->string('business_type', 100)->nullable();
            $table->string('business_address', 200)->nullable();
            $table->string('business_location', 30)->nullable();
            $table->string('reference_id', 20)->nullable();
            $table->string('reference_by', 20)->nullable();
            $table->string('profile_image')->default('user.png');
            $table->string('pancard_number', 20)->nullable();
            $table->string('gst_number', 15)->nullable();
            $table->unsignedInteger('commission_percentage')->nullable();
            $table->string('bank_name', 50)->nullable();
            $table->string('account_number', 20)->nullable();
            $table->string('ifsc', 20)->nullable();
            $table->enum('status', ['Pending', 'Approved', 'Rejected'])->default('Pending');
            $table->integer('vendor_wallet')->default(0);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('vendors');
    }
};
