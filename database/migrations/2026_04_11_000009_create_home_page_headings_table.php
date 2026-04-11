<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('home_page_headings', function (Blueprint $table) {
            $table->id();
            $table->string('home_page_name', 50);
            $table->string('heading', 50);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('home_page_headings');
    }
};
