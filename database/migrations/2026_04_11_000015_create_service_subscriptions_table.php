<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('service_subscriptions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('service_id')->nullable();
            $table->date('subscription_start_date')->nullable();
            $table->date('subscription_end_date')->nullable();
            $table->string('service_name')->nullable();
            $table->string('service_provider')->nullable();
            $table->enum('service_type', ['subscription', 'one-time'])->default('subscription');
            $table->string('subscription_plan', 100)->nullable();
            $table->enum('subscription_status', ['active', 'expired', 'cancelled'])->default('active');
            $table->string('payment_method', 50)->nullable();
            $table->enum('payment_status', ['paid', 'pending', 'refunded'])->default('pending');
            $table->decimal('payment_amount', 10, 2)->nullable();
            $table->string('renewal_frequency', 50)->nullable();
            $table->boolean('auto_renewal')->default(false);
            $table->date('next_renewal_date')->nullable();
            $table->text('usage_history')->nullable();
            $table->date('cancellation_date')->nullable();
            $table->string('cancellation_reason')->nullable();
            $table->enum('service_status', ['active', 'suspended', 'discontinued'])->default('active');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('service_subscriptions');
    }
};
