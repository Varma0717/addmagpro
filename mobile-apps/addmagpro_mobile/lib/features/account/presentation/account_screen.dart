import 'package:flutter/material.dart';

import '../../../app_state.dart';
import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/notifications_screen.dart';
import 'coupons_screen.dart';
import '../../orders/presentation/orders_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../referral/presentation/referral_screen.dart';
import '../../wallet/presentation/wallet_screen.dart';
import 'settings_screen.dart';
import 'support_screen.dart';
import 'transactions_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    final user = appState.currentUser;
    final token = appState.token;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Profile header
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primaryLight,
                backgroundImage: user?.avatarUrl != null ? NetworkImage(user!.avatarUrl!) : null,
                child: user?.avatarUrl == null
                    ? Text(
                        (user?.name ?? 'U').trim().characters.first.toUpperCase(),
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.primary),
                      )
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user?.name ?? 'Member', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    const SizedBox(height: 2),
                    Text(user?.phone ?? '', style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
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
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(40), blurRadius: 12, offset: const Offset(0, 4))],
          ),
          child: Row(
            children: [
              const Icon(Icons.account_balance_wallet_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          icon: Icons.swap_horiz_rounded,
          label: 'Transactions',
          onTap: () => _push(context, TransactionsScreen(token: token ?? '')),
        ),
        _MenuTile(
          icon: Icons.account_balance_wallet_outlined,
          label: 'Wallet',
          onTap: () => _push(context, WalletScreen(token: token ?? '')),
        ),
        _MenuTile(
          icon: Icons.notifications_none_rounded,
          label: 'Notifications',
          onTap: () => _push(context, NotificationsScreen(token: token ?? '')),
        ),
        const SizedBox(height: 12),
        _SectionLabel(label: 'Rewards'),
        _MenuTile(
          icon: Icons.local_offer_outlined,
          label: 'Coupons',
          onTap: () => _push(context, const CouponsScreen()),
        ),
        _MenuTile(
          icon: Icons.groups_2_outlined,
          label: 'Referral Network',
          subtitle: 'Earn by inviting friends',
          onTap: () => _push(context, ReferralScreen(token: token ?? '', memberName: user?.name ?? 'Member')),
        ),
        const SizedBox(height: 12),
        _SectionLabel(label: 'Help & Settings'),
        _MenuTile(
          icon: Icons.support_agent_rounded,
          label: 'Support',
          onTap: () => _push(context, const SupportScreen()),
        ),
        _MenuTile(
          icon: Icons.settings_outlined,
          label: 'Settings',
          onTap: () => _push(context, const SettingsScreen()),
        ),
        _MenuTile(
          icon: Icons.person_outline_rounded,
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
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                    TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text('Logout', style: TextStyle(color: AppColors.error))),
                  ],
                ),
              );
              if (confirm == true) {
                await appState.logout();
              }
            },
            icon: Icon(Icons.logout_rounded, color: AppColors.error),
            label: Text('Logout', style: TextStyle(color: AppColors.error)),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.error.withAlpha(60)),
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
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 0.5),
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
        border: Border.all(color: AppColors.borderLight),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary)),
        subtitle: subtitle != null
            ? Text(subtitle!, style: const TextStyle(fontSize: 12, color: AppColors.textMuted))
            : null,
        trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
