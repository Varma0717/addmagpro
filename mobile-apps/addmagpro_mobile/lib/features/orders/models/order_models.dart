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