<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ChatbotInteraction;
use App\Models\Order;
use App\Models\Referral;
use App\Models\User;
use App\Models\WalletTransaction;

class DashboardController extends Controller
{
    public function index()
    {
        $stats = [
            'total_users'    => User::where('role', 'user')->count(),
            'active_users'   => User::where('role', 'user')->where('is_active', true)->count(),
            'total_orders'   => Order::count(),
            'revenue'        => Order::where('payment_status', 'paid')->sum('total'),
            'total_referrals' => Referral::count(),
            'wallet_issued'  => WalletTransaction::where('type', 'credit')->sum('amount'),
        ];

        try {
            $chatbotStats = [
                'requests' => ChatbotInteraction::where('event_type', 'suggestion_request')->count(),
                'fallback_rate' => ChatbotInteraction::where('event_type', 'suggestion_request')->count() > 0
                    ? round(ChatbotInteraction::where('event_type', 'suggestion_request')->where('fallback_used', true)->count() * 100 / ChatbotInteraction::where('event_type', 'suggestion_request')->count(), 1)
                    : 0,
                'opens' => ChatbotInteraction::where('event_type', 'widget_opened')->count(),
            ];
            $recent_chatbot_interactions = ChatbotInteraction::latest()->take(12)->get();
        } catch (\Exception $e) {
            $chatbotStats = ['requests' => 0, 'fallback_rate' => 0, 'opens' => 0];
            $recent_chatbot_interactions = collect();
        }

        $recent_orders = Order::with('user')->latest()->take(10)->get();
        $recent_users  = User::where('role', 'user')->latest()->take(10)->get();

        return view('admin.dashboard', compact('stats', 'chatbotStats', 'recent_orders', 'recent_users', 'recent_chatbot_interactions'));
    }
}
