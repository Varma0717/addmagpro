import '../../../core/network/api_client.dart';
import '../models/catalog_models.dart';

class CatalogRepository {
  CatalogRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<ProductListResponse> fetchProducts({
    int page = 1,
    String? categorySlug,
    ProductFilterQuery filters = const ProductFilterQuery(),
  }) async {
    final params = <String>['page=$page'];
    if (categorySlug != null && categorySlug.trim().isNotEmpty) {
      params.add('category_slug=${Uri.encodeComponent(categorySlug.trim())}');
    }
    if (filters.minPrice != null) params.add('min_price=${filters.minPrice!.toStringAsFixed(0)}');
    if (filters.maxPrice != null) params.add('max_price=${filters.maxPrice!.toStringAsFixed(0)}');
    if (filters.minRating != null) params.add('min_rating=${filters.minRating!.toStringAsFixed(1)}');
    if (filters.brandId != null) params.add('brand_id=${filters.brandId}');
    params.add('sort=${Uri.encodeComponent(filters.sort.value)}');

    final payload = await _apiClient.get('/products?${params.join('&')}');
    return ProductListResponse.fromJson(payload);
  }

  Future<ProductDetail> fetchProductDetail(String slug) async {
    final payload = await _apiClient.get('/products/${Uri.encodeComponent(slug)}');
    return ProductDetail.fromJson(payload);
  }

  Future<ListingListResponse> fetchListings({int page = 1}) async {
    final payload = await _apiClient.get('/listings?page=$page');
    return ListingListResponse.fromJson(payload);
  }

  Future<ListingDetail> fetchListingDetail(String slug) async {
    final payload = await _apiClient.get('/listings/${Uri.encodeComponent(slug)}');
    return ListingDetail.fromJson(payload);
  }
}
