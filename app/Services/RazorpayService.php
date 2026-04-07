<?php

namespace App\Services;

use Razorpay\Api\Api;

class RazorpayService
{
    private Api $api;

    public function __construct()
    {
        $this->api = new Api(
            config('services.razorpay.key_id'),
            config('services.razorpay.key_secret')
        );
    }

    public function createOrder(int $amountInPaise, string $currency = 'INR', array $notes = []): array
    {
        $order = $this->api->order->create([
            'amount'   => $amountInPaise,
            'currency' => $currency,
            'notes'    => $notes,
        ]);

        return $order->toArray();
    }

    public function verifyPaymentSignature(string $orderId, string $paymentId, string $signature): bool
    {
        $expectedSignature = hash_hmac(
            'sha256',
            $orderId . '|' . $paymentId,
            config('services.razorpay.key_secret')
        );

        return hash_equals($expectedSignature, $signature);
    }

    public function getKeyId(): string
    {
        return config('services.razorpay.key_id');
    }
}
