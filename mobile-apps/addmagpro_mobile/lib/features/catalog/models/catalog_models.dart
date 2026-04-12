class ProductListResponse {
  ProductListResponse({required this.items, required this.currentPage, required this.lastPage});

  final List<ProductListItem> items;
  final int currentPage;
  final int lastPage;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final meta = json['meta'];
    final pagination = meta is Map<String, dynamic> && meta['pagination'] is Map<String, dynamic>
        ? meta['pagination'] as Map<String, dynamic>
        : null;

    return ProductListResponse(
      items: data is List
          ? data
              .whereType<Map<String, dynamic>>()
              .map(ProductListItem.fromJson)
              .toList(growable: false)
          : <ProductListItem>[],
      currentPage: _toInt(pagination?['current_page']) ?? 1,
      lastPage: _toInt(pagination?['last_page']) ?? 1,
    );
  }
}

class ProductListItem {
  ProductListItem({
    required this.id,
    required this.name,
    required this.slug,
    required this.effectivePrice,
    required this.primaryImageUrl,
    required this.ratingAvg,
  });

  final int id;
  final String name;
  final String slug;
  final double effectivePrice;
  final String? primaryImageUrl;
  final double? ratingAvg;

  factory ProductListItem.fromJson(Map<String, dynamic> json) {
    return ProductListItem(
      id: _toInt(json['id']) ?? 0,
      name: (json['name'] as String?) ?? '-',
      slug: (json['slug'] as String?) ?? '',
      effectivePrice: _toDouble(json['effective_price']) ?? 0,
      primaryImageUrl: json['primary_image_url'] as String?,
      ratingAvg: _toDouble(json['rating_avg']),
    );
  }
}

class ProductDetail {
  ProductDetail({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.effectivePrice,
    required this.images,
    required this.ratingAvg,
    required this.stock,
  });

  final int id;
  final String name;
  final String slug;
  final String? description;
  final double effectivePrice;
  final List<String> images;
  final double? ratingAvg;
  final int stock;

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final images = data['images'];

    return ProductDetail(
      id: _toInt(data['id']) ?? 0,
      name: (data['name'] as String?) ?? '-',
      slug: (data['slug'] as String?) ?? '',
      description: data['description'] as String?,
      effectivePrice: _toDouble(data['effective_price']) ?? 0,
      images: images is List
          ? images
              .whereType<Map<String, dynamic>>()
              .map((e) => e['image_url'] as String?)
              .whereType<String>()
              .toList(growable: false)
          : <String>[],
      ratingAvg: _toDouble(data['rating_avg']),
      stock: _toInt(data['stock']) ?? 0,
    );
  }
}

class ListingListResponse {
  ListingListResponse({required this.items, required this.currentPage, required this.lastPage});

  final List<ListingListItem> items;
  final int currentPage;
  final int lastPage;

  factory ListingListResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final meta = json['meta'];
    final pagination = meta is Map<String, dynamic> && meta['pagination'] is Map<String, dynamic>
        ? meta['pagination'] as Map<String, dynamic>
        : null;

    return ListingListResponse(
      items: data is List
          ? data
              .whereType<Map<String, dynamic>>()
              .map(ListingListItem.fromJson)
              .toList(growable: false)
          : <ListingListItem>[],
      currentPage: _toInt(pagination?['current_page']) ?? 1,
      lastPage: _toInt(pagination?['last_page']) ?? 1,
    );
  }
}

class ListingListItem {
  ListingListItem({
    required this.id,
    required this.businessName,
    required this.slug,
    required this.city,
    required this.ratingAvg,
    required this.primaryImageUrl,
    required this.categoryName,
  });

  final int id;
  final String businessName;
  final String slug;
  final String? city;
  final double? ratingAvg;
  final String? primaryImageUrl;
  final String? categoryName;

  factory ListingListItem.fromJson(Map<String, dynamic> json) {
    final category = json['category'];
    return ListingListItem(
      id: _toInt(json['id']) ?? 0,
      businessName: (json['business_name'] as String?) ?? '-',
      slug: (json['slug'] as String?) ?? '',
      city: json['city'] as String?,
      ratingAvg: _toDouble(json['rating_avg']),
      primaryImageUrl: json['primary_image_url'] as String?,
      categoryName: category is Map<String, dynamic> ? category['name'] as String? : null,
    );
  }
}

class ListingDetail {
  ListingDetail({
    required this.id,
    required this.businessName,
    required this.slug,
    required this.description,
    required this.address,
    required this.city,
    required this.phone,
    required this.whatsapp,
    required this.websiteUrl,
    required this.images,
    required this.ratingAvg,
  });

  final int id;
  final String businessName;
  final String slug;
  final String? description;
  final String? address;
  final String? city;
  final String? phone;
  final String? whatsapp;
  final String? websiteUrl;
  final List<String> images;
  final double? ratingAvg;

  factory ListingDetail.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final images = data['images'];

    return ListingDetail(
      id: _toInt(data['id']) ?? 0,
      businessName: (data['business_name'] as String?) ?? '-',
      slug: (data['slug'] as String?) ?? '',
      description: data['description'] as String?,
      address: data['address'] as String?,
      city: data['city'] as String?,
      phone: data['phone'] as String?,
      whatsapp: data['whatsapp'] as String?,
      websiteUrl: data['website_url'] as String?,
      images: images is List
          ? images
              .whereType<Map<String, dynamic>>()
              .map((e) => e['image_url'] as String?)
              .whereType<String>()
              .toList(growable: false)
          : <String>[],
      ratingAvg: _toDouble(data['rating_avg']),
    );
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
