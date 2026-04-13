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

    final teamPayload = await _apiClient.get('/account/referrals/team?depth=3', bearerToken: token);
    final teamData = teamPayload['data'];
    if (teamData is! Map<String, dynamic>) {
      throw ApiException('Invalid referral team response');
    }

    // Merge team data into the main response data before parsing
    data['team_structure'] = teamData['team_structure'] ?? data['team_structure'] ?? [];
    data['level_summary'] = teamData['level_summary'] ?? data['level_summary'] ?? [];

    return ReferralResponse.fromJson(data);
  }
}
