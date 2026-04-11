<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('franchises', function (Blueprint $table) {
            $table->id();
            $table->string('franchise_name', 30);
            $table->string('franchise_owner', 30)->nullable();
            $table->string('franchise_location', 30)->nullable();
            $table->string('franchise_phone', 10)->nullable();
            $table->text('franchise_email')->nullable();
            $table->text('franchise_type')->nullable();
            $table->dateTime('franchise_start_date')->nullable();
            $table->unsignedTinyInteger('franchise_status')->default(2)->comment('0:inactive 1:active 2:pending');
            $table->bigInteger('franchise_revenue')->default(0);
            $table->bigInteger('franchise_expenses')->default(0);
            $table->bigInteger('franchise_profit')->default(0);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('franchises');
    }
};
