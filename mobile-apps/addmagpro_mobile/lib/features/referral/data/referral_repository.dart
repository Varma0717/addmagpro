import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../models/referral_models.dart';

class ReferralRepository {
  ReferralRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<ReferralResponse> fetch(String token) async {
    final payload = await _apiClient.get('/account/referrals', bearerToken: token);
    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid referrals response');
    }

    return ReferralResponse.fromJson(data);
  }
}