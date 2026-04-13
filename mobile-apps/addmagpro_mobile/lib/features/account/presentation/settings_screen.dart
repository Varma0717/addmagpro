import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _orderNotifications = true;
  bool _promotionNotifications = true;
  bool _referralNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 8),

          // ── Notifications ──
          _SectionHeader(title: 'Notifications'),
          _SwitchTile(
            icon: Icons.shopping_bag_outlined,
            title: 'Order Updates',
            subtitle: 'Get notified about order status changes',
            value: _orderNotifications,
            onChanged: (v) => setState(() => _orderNotifications = v),
          ),
          _SwitchTile(
            icon: Icons.local_offer_outlined,
            title: 'Promotions & Offers',
            subtitle: 'Receive deals and discount notifications',
            value: _promotionNotifications,
            onChanged: (v) => setState(() => _promotionNotifications = v),
          ),
          _SwitchTile(
            icon: Icons.people_outline_rounded,
            title: 'Referral Updates',
            subtitle: 'Get notified when someone uses your code',
            value: _referralNotifications,
            onChanged: (v) => setState(() => _referralNotifications = v),
          ),

          const Divider(height: 32, indent: 16, endIndent: 16),

          // ── Legal & Info ──
          _SectionHeader(title: 'About'),
          _ActionTile(
            icon: Icons.description_outlined,
            title: 'Terms & Conditions',
            onTap: () => _openUrl('https://addmagpro.pmratnam.com/terms'),
          ),
          _ActionTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () => _openUrl('https://addmagpro.pmratnam.com/privacy'),
          ),
          _ActionTile(
            icon: Icons.help_outline_rounded,
            title: 'Help & Support',
            onTap: () => _openUrl('https://addmagpro.pmratnam.com/support'),
          ),
          _ActionTile(
            icon: Icons.star_outline_rounded,
            title: 'Rate the App',
            onTap: () {},
          ),

          const Divider(height: 32, indent: 16, endIndent: 16),

          // ── App Info ──
          _SectionHeader(title: 'App'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.info_outline_rounded, size: 22, color: AppColors.textSecondary),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('App Version', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                      SizedBox(height: 2),
                      Text('1.0.0', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 0.5)),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({required this.icon, required this.title, required this.subtitle, required this.value, required this.onChanged});
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary, size: 22),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
      trailing: Switch.adaptive(value: value, onChanged: onChanged, activeTrackColor: AppColors.primary),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary, size: 22),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted, size: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: onTap,
    );
  }
}
