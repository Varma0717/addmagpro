<?php

namespace App\Services;

use App\Models\AppNotification;
use App\Models\User;
use App\Models\UserDeviceToken;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class PushNotificationService
{
    public function registerDeviceToken(User $user, string $token, ?string $platform = null, ?string $deviceName = null): void
    {
        UserDeviceToken::updateOrCreate(
            ['token' => $token],
            [
                'user_id' => $user->id,
                'platform' => $platform,
                'device_name' => $deviceName,
                'last_seen_at' => now(),
            ],
        );
    }

    public function notifyUsers(iterable $users, string $title, string $body, string $type = 'general', array $data = []): void
    {
        $collection = $users instanceof Collection ? $users : collect($users);
        if ($collection->isEmpty()) {
            return;
        }

        $notifications = $collection->map(fn(User $user): array => [
            'user_id' => $user->id,
            'title' => $title,
            'body' => $body,
            'type' => $type,
            'data' => $data,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        AppNotification::insert($notifications->all());

        $tokens = UserDeviceToken::query()
            ->whereIn('user_id', $collection->pluck('id')->all())
            ->pluck('token')
            ->filter()
            ->unique()
            ->values();

        if ($tokens->isEmpty()) {
            return;
        }

        $serverKey = (string) config('services.firebase.server_key');
        if ($serverKey === '') {
            Log::warning('Firebase server key is not configured. Skipping push dispatch.', [
                'type' => $type,
                'users' => $collection->pluck('id')->all(),
            ]);
            return;
        }

        foreach ($tokens->chunk(500) as $chunk) {
            $response = Http::withHeaders([
                'Authorization' => 'key=' . $serverKey,
                'Content-Type' => 'application/json',
            ])->post('https://fcm.googleapis.com/fcm/send', [
                'registration_ids' => $chunk->all(),
                'priority' => 'high',
                'notification' => [
                    'title' => $title,
                    'body' => $body,
                ],
                'data' => [
                    'type' => $type,
                    ...$data,
                ],
            ]);

            if ($response->failed()) {
                Log::error('FCM push dispatch failed', [
                    'status' => $response->status(),
                    'body' => $response->body(),
                ]);
                continue;
            }

            $results = data_get($response->json(), 'results', []);
            foreach ($results as $index => $result) {
                $error = data_get($result, 'error');
                if (!in_array($error, ['NotRegistered', 'InvalidRegistration'], true)) {
                    continue;
                }

                $failedToken = $chunk->get($index);
                if ($failedToken) {
                    UserDeviceToken::where('token', $failedToken)->delete();
                }
            }
        }
    }

    public function notifyUser(User $user, string $title, string $body, string $type = 'general', array $data = []): void
    {
        $this->notifyUsers([$user], $title, $body, $type, $data);
    }
}
