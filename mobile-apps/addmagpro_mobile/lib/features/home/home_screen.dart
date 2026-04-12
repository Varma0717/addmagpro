import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../notifications/presentation/notifications_screen.dart';
import '../orders/presentation/orders_screen.dart';
import '../profile/presentation/profile_screen.dart';
import '../referral/presentation/referral_screen.dart';
import '../wallet/presentation/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.appState});

  final AppState appState;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = widget.appState.currentUser;
    final token = widget.appState.token;

    if (token == null) {
      return const SizedBox.shrink();
    }

    final pages = <Widget>[
      _DashboardView(appState: widget.appState),
      ReferralScreen(token: token, memberName: user?.name ?? 'Member'),
      WalletScreen(token: token),
      ProfileScreen(appState: widget.appState),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titleForIndex(_currentIndex)),
        actions: _currentIndex == 0
            ? <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => NotificationsScreen(token: token),
                      ),
                    );
                  },
                  icon: const Icon(Icons.notifications_none),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => OrdersScreen(token: token),
                      ),
                    );
                  },
                  icon: const Icon(Icons.receipt_long_outlined),
                ),
              ]
            : null,
      ),
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.space_dashboard_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.groups_2_outlined), label: 'Referrals'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Wallet'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  String _titleForIndex(int index) {
    switch (index) {
      case 1:
        return 'Referral Network';
      case 2:
        return 'Wallet';
      case 3:
        return 'My Profile';
      default:
        return 'AddMagPro Referral';
    }
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView({required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    final user = appState.currentUser;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFFF7F11),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello ${user?.name ?? 'Member'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Referral code: ${user?.referralCode ?? '-'}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),
              Text(
                'Wallet balance: ₹${(user?.walletBalance ?? 0).toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Account shortcuts',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        const _FeatureTile(title: 'Referrals are live from the account API'),
        const _FeatureTile(title: 'Wallet balance, transactions, and withdraw requests are live'),
        const _FeatureTile(title: 'Notifications and orders are available from the top-right actions'),
      ],
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8EBF0)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(title),
    );
  }
}
