import '../../../core/network/api_client.dart';

class CheckoutResult {
  CheckoutResult({
    required this.orderId,
    required this.orderNumber,
    required this.status,
    required this.total,
  });

  final int orderId;
  final String orderNumber;
  final String status;
  final double total;

  factory CheckoutResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final order = data['order'] as Map<String, dynamic>? ?? <String, dynamic>{};
    return CheckoutResult(
      orderId: _toInt(order['id']) ?? 0,
      orderNumber: (order['order_number'] as String?) ?? '-',
      status: (order['status'] as String?) ?? '-',
      total: _toDouble(order['total']) ?? 0,
    );
  }
}

class CheckoutRepository {
  CheckoutRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<CheckoutResult> placeOrder({
    required String token,
    required String name,
    required String phone,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required String paymentMethod,
    int? couponId,
    bool useWallet = false,
  }) async {
    final payload = await _apiClient.post(
      '/account/checkout/place-order',
      bearerToken: token,
      body: <String, dynamic>{
        'name': name,
        'phone': phone,
        'address': address,
        'city': city,
        'state': state,
        'pincode': pincode,
        'payment_method': paymentMethod,
        'coupon_id': couponId,
        'use_wallet': useWallet,
      },
    );

    return CheckoutResult.fromJson(payload);
  }
}

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
