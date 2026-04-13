<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AppNotification;
use App\Models\User;
use App\Services\PushNotificationService;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function __construct(private readonly PushNotificationService $pushNotifications) {}
    public function index()
    {
        $notifications = AppNotification::with('user')->latest()->paginate(30);
        return view('admin.notifications.index', compact('notifications'));
    }

    public function send(Request $request)
    {
        $request->validate([
            'title'   => 'required|string|max:255',
            'body'    => 'required|string',
            'type'    => 'nullable|string|max:50',
            'user_id' => 'nullable|exists:users,id',
            'send_push' => 'nullable|boolean',
        ]);

        $sendPush = $request->boolean('send_push', false);

        if ($request->filled('user_id')) {
            $user = User::findOrFail((int) $request->user_id);
            $this->pushNotifications->notifyUser(
                $user,
                $request->title,
                $request->body,
                $request->type ?? 'offer',
                [],
                $sendPush,
            );
        } else {
            $users = User::where('role', 'user')->where('is_active', true)->get();
            $this->pushNotifications->notifyUsers(
                $users,
                $request->title,
                $request->body,
                $request->type ?? 'offer',
                [],
                $sendPush,
            );
        }

        return back()->with('success', $sendPush ? 'Notification + push sent.' : 'Notification sent.');
    }
}
