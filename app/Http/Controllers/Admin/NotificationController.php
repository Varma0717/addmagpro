<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AppNotification;
use App\Models\User;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
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
        ]);

        if ($request->filled('user_id')) {
            AppNotification::create([
                'user_id' => $request->user_id,
                'title'   => $request->title,
                'body'    => $request->body,
                'type'    => $request->type ?? 'general',
            ]);
        } else {
            // Broadcast to all users
            User::where('role', 'user')->where('is_active', true)
                ->chunk(200, function ($users) use ($request) {
                    foreach ($users as $user) {
                        AppNotification::create([
                            'user_id' => $user->id,
                            'title'   => $request->title,
                            'body'    => $request->body,
                            'type'    => $request->type ?? 'general',
                        ]);
                    }
                });
        }

        return back()->with('success', 'Notification sent.');
    }
}
