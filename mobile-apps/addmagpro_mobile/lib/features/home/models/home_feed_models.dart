import '../../../core/config/app_config.dart';

class HomeFeed {
  HomeFeed({
    required this.banners,
    required this.categories,
    required this.featuredProducts,
    required this.featuredListings,
    required this.nearbyListings,
    required this.offers,
    required this.trendingProducts,
  });

  final List<HomeBannerItem> banners;
  final List<HomeCategoryItem> categories;
  final List<HomeProductItem> featuredProducts;
  final List<HomeListingItem> featuredListings;
  final List<HomeListingItem> nearbyListings;
  final List<HomeOfferItem> offers;
  final List<HomeProductItem> trendingProducts;

  factory HomeFeed.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    if (data is! Map<String, dynamic>) {
      throw StateError('Invalid home response');
    }

    return HomeFeed(
      banners: _mapList(data['banners'], HomeBannerItem.fromJson),
      categories: _mapList(data['categories'], HomeCategoryItem.fromJson),
      featuredProducts: _mapList(data['featured_products'], HomeProductItem.fromJson),
      featuredListings: _mapList(data['featured_listings'], HomeListingItem.fromJson),
      nearbyListings: _mapList(data['nearby_listings'], HomeListingItem.fromJson),
      offers: _mapList(data['offers'], HomeOfferItem.fromJson),
      trendingProducts: _mapList(data['trending_products'], HomeProductItem.fromJson),
    );
  }

  static List<T> _mapList<T>(
    dynamic raw,
    T Function(Map<String, dynamic> json) mapper,
  ) {
    if (raw is! List) return <T>[];
    return raw
        .whereType<Map<String, dynamic>>()
        .map(mapper)
        .toList(growable: false);
  }
}

class HomeBannerItem {
  HomeBannerItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.linkType,
    required this.linkValue,
  });

  final int id;
  final String? title;
  final String? subtitle;
  final String? imageUrl;
  final String? linkType;
  final String? linkValue;

  factory HomeBannerItem.fromJson(Map<String, dynamic> json) {
    return HomeBannerItem(
      id: _toInt(json['id']) ?? 0,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      imageUrl: AppConfig.resolveImageUrl(json['image_url'] as String?),
      linkType: json['link_type'] as String?,
      linkValue: json['link_value'] as String?,
    );
  }
}

class HomeCategoryItem {
  HomeCategoryItem({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
    required this.imageUrl,
  });

  final int id;
  final String name;
  final String slug;
  final String type;
  final String? imageUrl;

  factory HomeCategoryItem.fromJson(Map<String, dynamic> json) {
    return HomeCategoryItem(
      id: _toInt(json['id']) ?? 0,
      name: (json['name'] as String?) ?? '-',
      slug: (json['slug'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
      imageUrl: AppConfig.resolveImageUrl(json['image_url'] as String?),
    );
  }
}

class HomeProductItem {
  HomeProductItem({
    required this.id,
    required this.name,
    required this.slug,
    required this.effectivePrice,
    required this.ratingAvg,
    required this.category,
    required this.primaryImageUrl,
  });

  final int id;
  final String name;
  final String slug;
  final double effectivePrice;
  final double? ratingAvg;
  final String? category;
  final String? primaryImageUrl;

  factory HomeProductItem.fromJson(Map<String, dynamic> json) {
    return HomeProductItem(
      id: _toInt(json['id']) ?? 0,
      name: (json['name'] as String?) ?? '-',
      slug: (json['slug'] as String?) ?? '',
      effectivePrice: _toDouble(json['effective_price']) ?? 0,
      ratingAvg: _toDouble(json['rating_avg']),
      category: json['category'] as String?,
      primaryImageUrl: AppConfig.resolveImageUrl(json['primary_image_url'] as String?),
    );
  }
}

class HomeListingItem {
  HomeListingItem({
    required this.id,
    required this.businessName,
    required this.slug,
    required this.city,
    required this.category,
    required this.ratingAvg,
    required this.primaryImageUrl,
  });

  final int id;
  final String businessName;
  final String slug;
  final String? city;
  final String? category;
  final double? ratingAvg;
  final String? primaryImageUrl;

  factory HomeListingItem.fromJson(Map<String, dynamic> json) {
    return HomeListingItem(
      id: _toInt(json['id']) ?? 0,
      businessName: (json['business_name'] as String?) ?? '-',
      slug: (json['slug'] as String?) ?? '',
      city: json['city'] as String?,
      category: json['category'] as String?,
      ratingAvg: _toDouble(json['rating_avg']),
      primaryImageUrl: AppConfig.resolveImageUrl(json['primary_image_url'] as String?),
    );
  }
}

class HomeOfferItem {
  HomeOfferItem({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.value,
    required this.minOrderAmount,
  });

  final int id;
  final String code;
  final String name;
  final String type;
  final double value;
  final double minOrderAmount;

  factory HomeOfferItem.fromJson(Map<String, dynamic> json) {
    return HomeOfferItem(
      id: _toInt(json['id']) ?? 0,
      code: (json['code'] as String?) ?? '-',
      name: (json['name'] as String?) ?? '-',
      type: (json['type'] as String?) ?? '',
      value: _toDouble(json['value']) ?? 0,
      minOrderAmount: _toDouble(json['min_order_amount']) ?? 0,
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
