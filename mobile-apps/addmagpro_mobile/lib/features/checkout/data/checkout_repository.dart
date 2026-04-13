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

class RazorpayOrderResult {
  RazorpayOrderResult({
    required this.orderId,
    required this.amount,
    required this.currency,
    required this.keyId,
  });

  final String orderId;
  final int amount;
  final String currency;
  final String keyId;

  factory RazorpayOrderResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};
    return RazorpayOrderResult(
      orderId: (data['order_id'] as String?) ?? '',
      amount: _toInt(data['amount']) ?? 0,
      currency: (data['currency'] as String?) ?? 'INR',
      keyId: (data['key_id'] as String?) ?? '',
    );
  }
}

class CheckoutRepository {
  CheckoutRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<RazorpayOrderResult> createRazorpayOrder({
    required String token,
    int? couponId,
    bool useWallet = false,
  }) async {
    final payload = await _apiClient.post(
      '/account/checkout/razorpay/create',
      bearerToken: token,
      body: <String, dynamic>{
        'coupon_id': couponId,
        'use_wallet': useWallet,
      },
    );
    return RazorpayOrderResult.fromJson(payload);
  }

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
    String? razorpayOrderId,
    String? razorpayPaymentId,
    String? razorpaySignature,
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
        'razorpay_order_id': ?razorpayOrderId,
        'razorpay_payment_id': ?razorpayPaymentId,
        'razorpay_signature': ?razorpaySignature,
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
