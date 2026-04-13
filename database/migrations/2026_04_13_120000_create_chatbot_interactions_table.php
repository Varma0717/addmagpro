<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('chatbot_interactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
            $table->string('session_id', 120)->nullable()->index();
            $table->string('event_type', 40)->default('suggestion_request');
            $table->string('intent', 120)->nullable()->index();
            $table->text('query')->nullable();
            $table->string('provider', 40)->default('rules');
            $table->boolean('fallback_used')->default(false);
            $table->unsignedSmallInteger('response_count')->default(0);
            $table->json('meta')->nullable();
            $table->ipAddress('ip_address')->nullable();
            $table->text('user_agent')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('chatbot_interactions');
    }
};
