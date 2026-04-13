import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../models/order_models.dart';

class OrderRepository {
  OrderRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<OrderSummary>> fetch(String token) async {
    final payload = await _apiClient.get('/account/orders', bearerToken: token);
    final data = payload['data'];
    if (data is! List) {
      throw ApiException('Invalid orders response');
    }

    return data.whereType<Map<String, dynamic>>().map(OrderSummary.fromJson).toList();
  }

  Future<OrderDetail> fetchDetail(String token, {required int orderId}) async {
    final payload = await _apiClient.get('/account/orders/$orderId', bearerToken: token);
    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid order detail response');
    }
    return OrderDetail.fromJson(data);
  }
}