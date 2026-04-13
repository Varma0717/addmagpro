import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../models/wallet_models.dart';

class WalletRepository {
  WalletRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<WalletOverview> fetch(String token) async {
    final payload = await _apiClient.get('/account/wallet', bearerToken: token);
    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid wallet response');
    }

    return WalletOverview.fromJson(data);
  }

  Future<WithdrawRequestItem> submitWithdraw(
    String token, {
    required double amount,
    String? remarks,
  }) async {
    final payload = await _apiClient.post(
      '/account/withdraw-requests',
      bearerToken: token,
      body: <String, dynamic>{
        'amount': amount,
        'remarks': (remarks ?? '').trim().isEmpty ? null : remarks,
      },
    );

    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid withdraw response');
    }

    return WithdrawRequestItem.fromJson(data);
  }

  Future<WalletTopupOrder> createTopupOrder(
    String token, {
    required int amount,
  }) async {
    final payload = await _apiClient.post(
      '/account/wallet/topup/create',
      bearerToken: token,
      body: <String, dynamic>{'amount': amount},
    );

    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid top-up response');
    }

    return WalletTopupOrder.fromJson(data);
  }

  Future<void> verifyTopup(
    String token, {
    required String razorpayOrderId,
    required String razorpayPaymentId,
    required String razorpaySignature,
    required int amount,
  }) async {
    await _apiClient.post(
      '/account/wallet/topup/verify',
      bearerToken: token,
      body: <String, dynamic>{
        'razorpay_order_id': razorpayOrderId,
        'razorpay_payment_id': razorpayPaymentId,
        'razorpay_signature': razorpaySignature,
        'amount': amount,
      },
    );
  }
}