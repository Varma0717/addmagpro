import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
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
  bool _loading = true;
  String? _error;
  List<NotificationItem> _items = const <NotificationItem>[];

  @override
  void initState() {
    super.initState();
    _repository = NotificationRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final items = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _items = items);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _markRead(NotificationItem item) async {
    if (item.isRead) return;

    await _repository.markRead(widget.token, item.id);
    if (!mounted) return;

    setState(() {
      _items = _items
          .map((notification) => notification.id == item.id
              ? notification.copyWith(isRead: true)
              : notification)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: RefreshIndicator(
        onRefresh: _load,
        child: _loading
            ? ListView(
                children: <Widget>[
                  const SizedBox(height: 220),
                  const Center(child: CircularProgressIndicator()),
                ],
              )
            : _error != null
                ? ListView(
                    padding: const EdgeInsets.all(24),
                    children: <Widget>[
                      Text(_error!, style: const TextStyle(color: Color(0xFFB42318))),
                    ],
                  )
                : _items.isEmpty
                    ? ListView(
                        children: <Widget>[
                          const SizedBox(height: 220),
                          const Center(child: Text('No notifications yet')),
                        ],
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return GestureDetector(
                            onTap: () => _markRead(item),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: item.isRead ? Colors.white : const Color(0xFFFFF7ED),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          item.title,
                                          style: const TextStyle(fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      if (!item.isRead)
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF7F11),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(item.body, style: const TextStyle(height: 1.4)),
                                  const SizedBox(height: 10),
                                  Text(
                                    _formatDate(item.createdAt),
                                    style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
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

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final local = value.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
  }
}