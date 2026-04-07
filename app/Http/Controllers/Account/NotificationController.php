<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\AppNotification;

class NotificationController extends Controller
{
    public function index()
    {
        $notifications = AppNotification::where('user_id', auth()->id())
            ->latest()
            ->paginate(20);

        // Mark all as read
        AppNotification::where('user_id', auth()->id())
            ->where('is_read', false)
            ->update(['is_read' => true, 'read_at' => now()]);

        return view('account.notifications', compact('notifications'));
    }

    public function unreadCount()
    {
        $count = AppNotification::where('user_id', auth()->id())->unread()->count();
        return response()->json(['count' => $count]);
    }
}
