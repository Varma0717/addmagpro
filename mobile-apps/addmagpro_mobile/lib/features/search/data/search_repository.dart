import '../../../core/network/api_client.dart';
import '../models/search_models.dart';

class SearchRepository {
  SearchRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<MixedSearchResponse> search(String query) async {
    final sanitized = query.trim();
    if (sanitized.length < 2) {
      throw StateError('Type at least 2 characters to search');
    }

    final payload = await _apiClient.get('/search/mixed?q=${Uri.encodeComponent(sanitized)}');
    return MixedSearchResponse.fromJson(payload);
  }
}
