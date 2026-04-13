import '../../../core/network/api_client.dart';
import '../models/catalog_models.dart';

class CatalogRepository {
  CatalogRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<ProductListResponse> fetchProducts({
    int page = 1,
    String? categorySlug,
    String? sort,
    double? minPrice,
    double? maxPrice,
    double? rating,
    String? brand,
  }) async {
    final params = <String>['page=$page'];
    if (categorySlug != null && categorySlug.trim().isNotEmpty) {
      params.add('category_slug=${Uri.encodeComponent(categorySlug.trim())}');
    }
    if (sort != null && sort.trim().isNotEmpty) {
      params.add('sort=${Uri.encodeQueryComponent(sort.trim())}');
    }
    if (minPrice != null) {
      params.add('min_price=${minPrice.toStringAsFixed(0)}');
    }
    if (maxPrice != null) {
      params.add('max_price=${maxPrice.toStringAsFixed(0)}');
    }
    if (rating != null) {
      params.add('rating=${rating.toStringAsFixed(1)}');
    }
    if (brand != null && brand.trim().isNotEmpty) {
      params.add('brand=${Uri.encodeQueryComponent(brand.trim())}');
    }

    final payload = await _apiClient.get('/products?${params.join('&')}');
    return ProductListResponse.fromJson(payload);
  }

  Future<ProductDetail> fetchProductDetail(String slug) async {
    final payload = await _apiClient.get('/products/${Uri.encodeComponent(slug)}');
    return ProductDetail.fromJson(payload);
  }

  Future<ListingListResponse> fetchListings({
    int page = 1,
    int? stateId,
    int? districtId,
  }) async {
    final params = <String>['page=$page'];
    if (stateId != null) {
      params.add('state_id=$stateId');
    }
    if (districtId != null) {
      params.add('district_id=$districtId');
    }
    final payload = await _apiClient.get('/listings?${params.join('&')}');
    return ListingListResponse.fromJson(payload);
  }

  Future<ListingDetail> fetchListingDetail(String slug) async {
    final payload = await _apiClient.get('/listings/${Uri.encodeComponent(slug)}');
    return ListingDetail.fromJson(payload);
  }
}
