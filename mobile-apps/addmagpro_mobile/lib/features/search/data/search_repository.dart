import '../../../core/network/api_client.dart';
import '../models/search_models.dart';

class SearchRepository {
  SearchRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<MixedSearchResponse> search(
    String query, {
    int? stateId,
    int? districtId,
  }) async {
    final sanitized = query.trim();
    if (sanitized.length < 2) {
      throw StateError('Type at least 2 characters to search');
    }

    final params = <String>['q=${Uri.encodeComponent(sanitized)}'];
    if (stateId != null) {
      params.add('state_id=$stateId');
    }
    if (districtId != null) {
      params.add('district_id=$districtId');
    }
    final payload = await _apiClient.get('/search/mixed?${params.join('&')}');
    return MixedSearchResponse.fromJson(payload);
  }
}
