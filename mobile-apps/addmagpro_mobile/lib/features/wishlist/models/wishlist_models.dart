class WishlistItem {
  WishlistItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.slug,
    required this.effectivePrice,
    required this.primaryImageUrl,
    required this.addedAt,
  });

  final int id;
  final int productId;
  final String name;
  final String slug;
  final double effectivePrice;
  final String? primaryImageUrl;
  final String? addedAt;

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      productId: (json['product_id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? '-',
      slug: (json['slug'] as String?) ?? '',
      effectivePrice: (json['effective_price'] as num?)?.toDouble() ?? 0,
      primaryImageUrl: json['primary_image_url'] as String?,
      addedAt: json['added_at'] as String?,
    );
  }
}
