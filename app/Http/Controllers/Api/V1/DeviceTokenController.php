<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Services\PushNotificationService;
use App\Support\ApiResponse;
use Illuminate\Http\Request;

class DeviceTokenController extends Controller
{
    use ApiResponse;

    public function __construct(private readonly PushNotificationService $pushNotifications) {}

    public function upsert(Request $request)
    {
        $validated = $request->validate([
            'token' => ['required', 'string', 'max:2048'],
            'platform' => ['nullable', 'string', 'in:android,ios,web'],
            'device_name' => ['nullable', 'string', 'max:255'],
        ]);

        $this->pushNotifications->registerDeviceToken(
            $request->user(),
            $validated['token'],
            $validated['platform'] ?? null,
            $validated['device_name'] ?? ($request->userAgent() ?: 'mobile-app'),
        );

        return $this->success(null, 'Device token registered');
    }
}
