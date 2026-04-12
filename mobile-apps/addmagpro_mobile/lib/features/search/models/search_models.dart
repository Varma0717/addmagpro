class MixedSearchResponse {
  MixedSearchResponse({required this.query, required this.results});

  final String query;
  final List<MixedSearchItem> results;

  factory MixedSearchResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    if (data is! Map<String, dynamic>) {
      throw StateError('Invalid mixed search response');
    }

    final mixed = data['mixed'];
    final results = mixed is List
        ? mixed
            .whereType<Map<String, dynamic>>()
            .map(MixedSearchItem.fromJson)
            .toList(growable: false)
        : <MixedSearchItem>[];

    return MixedSearchResponse(
      query: (data['query'] as String?) ?? '',
      results: results,
    );
  }
}

class MixedSearchItem {
  MixedSearchItem({
    required this.type,
    required this.id,
    required this.title,
    required this.slug,
    required this.subtitle,
    required this.city,
    required this.price,
    required this.primaryImageUrl,
  });

  final String type;
  final int id;
  final String title;
  final String slug;
  final String? subtitle;
  final String? city;
  final double? price;
  final String? primaryImageUrl;

  bool get isProduct => type == 'product';
  bool get isListing => type == 'listing';

  factory MixedSearchItem.fromJson(Map<String, dynamic> json) {
    return MixedSearchItem(
      type: (json['type'] as String?) ?? '',
      id: _toInt(json['id']) ?? 0,
      title: (json['title'] as String?) ?? '-',
      slug: (json['slug'] as String?) ?? '',
      subtitle: json['subtitle'] as String?,
      city: json['city'] as String?,
      price: _toDouble(json['price']),
      primaryImageUrl: json['primary_image_url'] as String?,
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
