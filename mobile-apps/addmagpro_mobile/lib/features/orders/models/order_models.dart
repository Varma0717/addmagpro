class OrderSummary {
  const OrderSummary({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.itemsCount,
    required this.total,
    required this.createdAt,
  });

  final int id;
  final String orderNumber;
  final String status;
  final String? paymentMethod;
  final String? paymentStatus;
  final int itemsCount;
  final double total;
  final DateTime? createdAt;

  factory OrderSummary.fromJson(Map<String, dynamic> json) {
    return OrderSummary(
      id: (json['id'] as num?)?.toInt() ?? 0,
      orderNumber: json['order_number'] as String? ?? '-',
      status: json['status'] as String? ?? 'pending',
      paymentMethod: json['payment_method'] as String?,
      paymentStatus: json['payment_status'] as String?,
      itemsCount: (json['items_count'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toDouble() ?? 0,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
    );
  }
}

class OrderDetail {
  const OrderDetail({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.total,
    required this.subtotal,
    required this.discount,
    required this.shippingAddress,
    required this.items,
    required this.createdAt,
  });

  final int id;
  final String orderNumber;
  final String status;
  final String? paymentMethod;
  final String? paymentStatus;
  final double total;
  final double subtotal;
  final double discount;
  final String? shippingAddress;
  final List<OrderItemDetail> items;
  final DateTime? createdAt;

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    return OrderDetail(
      id: (json['id'] as num?)?.toInt() ?? 0,
      orderNumber: json['order_number'] as String? ?? '-',
      status: json['status'] as String? ?? 'pending',
      paymentMethod: json['payment_method'] as String?,
      paymentStatus: json['payment_status'] as String?,
      total: (json['total'] as num?)?.toDouble() ?? 0,
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      shippingAddress: json['shipping_address'] as String?,
      items: rawItems is List
          ? rawItems.whereType<Map<String, dynamic>>().map(OrderItemDetail.fromJson).toList()
          : [],
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
    );
  }
}

class OrderItemDetail {
  const OrderItemDetail({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.subtotal,
    required this.imageUrl,
  });

  final int id;
  final String productName;
  final int quantity;
  final double price;
  final double subtotal;
  final String? imageUrl;

  factory OrderItemDetail.fromJson(Map<String, dynamic> json) {
    final product = json['product'] as Map<String, dynamic>? ?? <String, dynamic>{};
    return OrderItemDetail(
      id: (json['id'] as num?)?.toInt() ?? 0,
      productName: (product['name'] as String?) ?? (json['product_name'] as String?) ?? '-',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
      imageUrl: product['primary_image_url'] as String? ?? json['image_url'] as String?,
    );
  }
}