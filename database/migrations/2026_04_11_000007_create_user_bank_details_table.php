<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('user_bank_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('user_name', 50)->nullable();
            $table->string('bank_name', 50)->nullable();
            $table->string('account_number', 30)->nullable();
            $table->string('ifsc', 20)->nullable();
            $table->string('pancard_number', 20)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('user_bank_details');
    }
};
