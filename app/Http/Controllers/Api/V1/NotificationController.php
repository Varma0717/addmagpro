<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\AppNotification;
use App\Support\ApiResponse;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    use ApiResponse;

    public function index(Request $request)
    {
        $perPage = min((int) $request->integer('per_page', 20), 50);

        $notifications = AppNotification::query()
            ->where('user_id', $request->user()->id)
            ->latest()
            ->paginate($perPage)
            ->withQueryString();

        return $this->success(
            $notifications->getCollection()->map(function (AppNotification $notification): array {
                return [
                    'id' => $notification->id,
                    'title' => $notification->title,
                    'body' => $notification->body,
                    'type' => $notification->type,
                    'data' => $notification->data,
                    'is_read' => $notification->is_read,
                    'read_at' => $notification->read_at,
                    'created_at' => $notification->created_at,
                ];
            })->values(),
            'Notifications fetched',
            200,
            [
                'pagination' => [
                    'current_page' => $notifications->currentPage(),
                    'last_page' => $notifications->lastPage(),
                    'per_page' => $notifications->perPage(),
                    'total' => $notifications->total(),
                ],
            ]
        );
    }

    public function unreadCount(Request $request)
    {
        return $this->success([
            'count' => AppNotification::query()
                ->where('user_id', $request->user()->id)
                ->unread()
                ->count(),
        ], 'Unread notification count fetched');
    }

    public function markRead(Request $request, AppNotification $notification)
    {
        if ($notification->user_id !== $request->user()->id) {
            return $this->error('You are not allowed to update this notification.', 403);
        }

        if (!$notification->is_read) {
            $notification->update([
                'is_read' => true,
                'read_at' => now(),
            ]);
        }

        return $this->success([
            'id' => $notification->id,
            'is_read' => $notification->is_read,
            'read_at' => $notification->read_at,
        ], 'Notification marked as read');
    }
}
