<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServiceSubscription extends Model
{
    protected $fillable = [
        'user_id',
        'service_id',
        'subscription_start_date',
        'subscription_end_date',
        'service_name',
        'service_provider',
        'service_type',
        'subscription_plan',
        'subscription_status',
        'payment_method',
        'payment_status',
        'payment_amount',
        'renewal_frequency',
        'auto_renewal',
        'next_renewal_date',
        'usage_history',
        'cancellation_date',
        'cancellation_reason',
        'service_status',
    ];

    protected function casts(): array
    {
        return [
            'subscription_start_date' => 'date',
            'subscription_end_date'   => 'date',
            'next_renewal_date'       => 'date',
            'cancellation_date'       => 'date',
            'payment_amount'          => 'decimal:2',
            'auto_renewal'            => 'boolean',
        ];
    }
}
