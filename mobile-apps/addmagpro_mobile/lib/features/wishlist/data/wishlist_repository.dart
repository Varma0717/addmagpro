import '../../../core/network/api_client.dart';
import '../models/wishlist_models.dart';

class WishlistRepository {
  WishlistRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<WishlistItem>> fetchAll(String token) async {
    final payload = await _apiClient.get('/account/wishlist', bearerToken: token);
    final data = payload['data'];
    if (data is! List) return <WishlistItem>[];
    return data
        .whereType<Map<String, dynamic>>()
        .map(WishlistItem.fromJson)
        .toList(growable: false);
  }

  Future<bool> toggle({required String token, required int productId}) async {
    final payload = await _apiClient.post(
      '/account/wishlist/toggle',
      body: {'product_id': productId},
      bearerToken: token,
    );
    return (payload['added'] as bool?) ?? false;
  }

  Future<bool> check({required String token, required int productId}) async {
    final payload = await _apiClient.get(
      '/account/wishlist/check?product_id=$productId',
      bearerToken: token,
    );
    return (payload['in_wishlist'] as bool?) ?? false;
  }
}
