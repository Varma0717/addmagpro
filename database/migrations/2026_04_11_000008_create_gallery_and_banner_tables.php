<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('galleries', function (Blueprint $table) {
            $table->id();
            $table->string('gallery_name', 50);
            $table->string('gallery_url', 250)->nullable();
            $table->text('gallery_image')->nullable();
            $table->timestamps();
        });

        Schema::create('gadget_galleries', function (Blueprint $table) {
            $table->id();
            $table->string('gadget_gallery_name', 50);
            $table->string('gadget_gallery_url', 250)->nullable();
            $table->text('gadget_gallery_image')->nullable();
            $table->timestamps();
        });

        Schema::create('speciality_store_images', function (Blueprint $table) {
            $table->id();
            $table->string('store_name', 50);
            $table->text('store_image')->nullable();
            $table->timestamps();
        });

        Schema::create('event_banners', function (Blueprint $table) {
            $table->id();
            $table->string('event_banner_name', 250);
            $table->string('event_banner_image', 250)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('event_banners');
        Schema::dropIfExists('speciality_store_images');
        Schema::dropIfExists('gadget_galleries');
        Schema::dropIfExists('galleries');
    }
};
