<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
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

        $recent_orders = Order::with('user')->latest()->take(10)->get();
        $recent_users  = User::where('role', 'user')->latest()->take(10)->get();

        return view('admin.dashboard', compact('stats', 'recent_orders', 'recent_users'));
    }
}
