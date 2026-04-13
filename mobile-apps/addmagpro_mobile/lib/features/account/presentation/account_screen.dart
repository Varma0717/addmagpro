import 'package:flutter/material.dart';

import '../../../app_state.dart';
import '../../notifications/presentation/notifications_screen.dart';
import '../../orders/presentation/orders_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../referral/presentation/referral_screen.dart';
import '../../wallet/presentation/wallet_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    final user = appState.currentUser;
    final token = appState.token;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        // Profile header
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xFFFFE2C7),
                backgroundImage: user?.avatarUrl != null ? NetworkImage(user!.avatarUrl!) : null,
                child: user?.avatarUrl == null
                    ? Text(
                        (user?.name ?? 'U').trim().characters.first.toUpperCase(),
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFFC2410C)),
                      )
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user?.name ?? 'Member',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user?.phone ?? '',
                      style: const TextStyle(color: Color(0xFF6B7280), fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Wallet balance card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: <Color>[Color(0xFFFF7F11), Color(0xFFFF9A3E)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: <Widget>[
              const Icon(Icons.account_balance_wallet, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Wallet Balance', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Text(
                    '₹${(user?.walletBalance ?? 0).toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Menu items
        _SectionLabel(label: 'My Activity'),
        _MenuTile(
          icon: Icons.receipt_long_outlined,
          label: 'My Orders',
          onTap: () => _push(context, OrdersScreen(token: token ?? '')),
        ),
        _MenuTile(
          icon: Icons.account_balance_wallet_outlined,
          label: 'Wallet',
          onTap: () => _push(context, WalletScreen(token: token ?? '')),
        ),
        _MenuTile(
          icon: Icons.groups_2_outlined,
          label: 'Referral Network',
          subtitle: 'Earn by inviting friends',
          onTap: () => _push(context, ReferralScreen(token: token ?? '', memberName: user?.name ?? 'Member')),
        ),
        _MenuTile(
          icon: Icons.notifications_none,
          label: 'Notifications',
          onTap: () => _push(context, NotificationsScreen(token: token ?? '')),
        ),
        const SizedBox(height: 12),
        _SectionLabel(label: 'Settings'),
        _MenuTile(
          icon: Icons.person_outline,
          label: 'Edit Profile',
          onTap: () => _push(context, ProfileScreen(appState: appState)),
        ),
        const SizedBox(height: 20),

        // Logout
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: <Widget>[
                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                    TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Logout')),
                  ],
                ),
              );
              if (confirm == true) {
                await appState.logout();
              }
            },
            icon: const Icon(Icons.logout, color: Color(0xFFEF4444)),
            label: const Text('Logout', style: TextStyle(color: Color(0xFFEF4444))),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFFECACA)),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ),
      ],
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => screen));
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF9CA3AF),
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.icon, required this.label, required this.onTap, this.subtitle});

  final IconData icon;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFFC2410C), size: 20),
        ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: subtitle != null
            ? Text(subtitle!, style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)))
            : null,
        trailing: const Icon(Icons.chevron_right, color: Color(0xFFD1D5DB)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
