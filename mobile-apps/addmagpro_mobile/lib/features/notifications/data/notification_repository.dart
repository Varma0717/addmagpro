import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../models/notification_item.dart';

class NotificationRepository {
  NotificationRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<NotificationItem>> fetch(String token) async {
    final payload = await _apiClient.get('/account/notifications', bearerToken: token);
    final data = payload['data'];
    if (data is! List) {
      throw ApiException('Invalid notifications response');
    }

    return data.whereType<Map<String, dynamic>>().map(NotificationItem.fromJson).toList();
  }

  Future<void> markRead(String token, int notificationId) async {
    await _apiClient.patch('/account/notifications/$notificationId/read', bearerToken: token);
  }

  Future<int> unreadCount(String token) async {
    final payload = await _apiClient.get('/account/notifications/unread-count', bearerToken: token);
    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid unread notifications response');
    }

    final count = data['unread_count'];
    if (count is num) return count.toInt();
    return int.tryParse(count?.toString() ?? '') ?? 0;
  }
}
