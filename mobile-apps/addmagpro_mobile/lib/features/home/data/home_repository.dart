import '../../../core/network/api_client.dart';
import '../models/home_feed_models.dart';

class HomeRepository {
  HomeRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<HomeFeed> fetch({
    double? latitude,
    double? longitude,
    String? city,
    int? stateId,
    int? districtId,
  }) async {
    final params = <String>[];
    if (latitude != null && longitude != null) {
      params
        ..add('lat=$latitude')
        ..add('lng=$longitude');
    }
    if (city != null && city.trim().isNotEmpty) {
      params.add('city=${Uri.encodeComponent(city.trim())}');
    }
    if (stateId != null) {
      params.add('state_id=$stateId');
    }
    if (districtId != null) {
      params.add('district_id=$districtId');
    }

    final path = params.isEmpty ? '/home' : '/home?${params.join('&')}';
    final payload = await _apiClient.get(path);
    return HomeFeed.fromJson(payload);
  }
}
