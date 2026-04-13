import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../../core/notifications/notification_sync_bus.dart';
import '../../../core/theme/app_theme.dart';
import '../data/notification_repository.dart';
import '../models/notification_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key, required this.token});

  final String token;

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late final NotificationRepository _repository;
  StreamSubscription<Map<String, dynamic>>? _syncSubscription;
  bool _loading = true;
  String? _error;
  List<NotificationItem> _items = const [];

  @override
  void initState() {
    super.initState();
    _repository = NotificationRepository(apiClient: ApiClient());
    _syncSubscription = NotificationSyncBus.stream.listen((_) => _load());
    _load();
  }

  @override
  void dispose() {
    _syncSubscription?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final items = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _items = items);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _markRead(NotificationItem item) async {
    if (item.isRead) return;
    await _repository.markRead(widget.token, item.id);
    if (!mounted) return;
    setState(() {
      _items = _items
          .map((n) => n.id == item.id ? n.copyWith(isRead: true) : n)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _load,
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
            : _error != null
                ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
                    const SizedBox(height: 12),
                    Text(_error!, style: const TextStyle(color: AppColors.error)),
                    const SizedBox(height: 12),
                    FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
                  ]))
                : _items.isEmpty
                    ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: AppColors.surface, shape: BoxShape.circle),
                          child: const Icon(Icons.notifications_none_rounded, size: 48, color: AppColors.textMuted),
                        ),
                        const SizedBox(height: 16),
                        const Text('No notifications yet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                        const SizedBox(height: 4),
                        const Text('We\'ll notify you when something happens', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                      ]))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return GestureDetector(
                            onTap: () => _markRead(item),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: item.isRead ? Colors.white : AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: item.isRead ? AppColors.borderLight : AppColors.primary.withAlpha(30)),
                                boxShadow: item.isRead ? null : [BoxShadow(color: AppColors.primary.withAlpha(10), blurRadius: 8, offset: const Offset(0, 2))],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: item.isRead ? AppColors.surface : AppColors.primary.withAlpha(25),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      _iconForNotification(item.title),
                                      size: 20,
                                      color: item.isRead ? AppColors.textMuted : AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Expanded(child: Text(item.title, style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary, fontSize: item.isRead ? 14 : 14))),
                                          if (!item.isRead)
                                            Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                                        ]),
                                        const SizedBox(height: 6),
                                        Text(item.body, style: const TextStyle(height: 1.4, color: AppColors.textSecondary, fontSize: 13)),
                                        const SizedBox(height: 8),
                                        Text(_formatDate(item.createdAt), style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
      ),
    );
  }

  IconData _iconForNotification(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('order')) return Icons.receipt_long_rounded;
    if (lower.contains('wallet') || lower.contains('payment')) return Icons.account_balance_wallet_rounded;
    if (lower.contains('referral') || lower.contains('team')) return Icons.groups_2_rounded;
    if (lower.contains('reward') || lower.contains('bonus')) return Icons.card_giftcard_rounded;
    return Icons.notifications_rounded;
  }

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final local = value.toLocal();
    final now = DateTime.now();
    final diff = now.difference(local);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
  }
}
