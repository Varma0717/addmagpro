import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
import '../data/order_repository.dart';
import '../models/order_models.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key, required this.token});

  final String token;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late final OrderRepository _repository;
  bool _loading = true;
  String? _error;
  List<OrderSummary> _orders = const <OrderSummary>[];

  @override
  void initState() {
    super.initState();
    _repository = OrderRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final orders = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _orders = orders);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _load,
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
            : _error != null
                ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
                    const SizedBox(height: 12),
                    Text(_error!, style: const TextStyle(color: AppColors.textMuted)),
                    const SizedBox(height: 12),
                    FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
                  ]))
                : _orders.isEmpty
                    ? const EmptyState(icon: Icons.receipt_long_outlined, title: 'No orders yet', subtitle: 'Your order history will appear here')
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _orders.length,
                        itemBuilder: (context, index) {
                          final order = _orders[index];
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => _OrderDetailScreen(token: widget.token, orderId: order.id, orderNumber: order.orderNumber))),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.border, width: 0.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Text(order.orderNumber, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.textPrimary))),
                                      StatusChip(label: order.status),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const Icon(Icons.inventory_2_outlined, size: 16, color: AppColors.textMuted),
                                      const SizedBox(width: 6),
                                      Text('${order.itemsCount} items', style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                                      const SizedBox(width: 16),
                                      const Icon(Icons.payment_rounded, size: 16, color: AppColors.textMuted),
                                      const SizedBox(width: 6),
                                      Text(order.paymentMethod ?? '-', style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text('₹${order.total.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.primary)),
                                      const Spacer(),
                                      Text(_formatDate(order.createdAt), style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                                      const SizedBox(width: 4),
                                      const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.textMuted),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
      ),
    );
  }

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final local = value.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
  }
}

// ── Order Detail Screen ─────────────────────────────────────────────

class _OrderDetailScreen extends StatefulWidget {
  const _OrderDetailScreen({required this.token, required this.orderId, required this.orderNumber});
  final String token;
  final int orderId;
  final String orderNumber;

  @override
  State<_OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<_OrderDetailScreen> {
  late final OrderRepository _repository;
  bool _loading = true;
  String? _error;
  OrderDetail? _detail;

  @override
  void initState() {
    super.initState();
    _repository = OrderRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final detail = await _repository.fetchDetail(widget.token, orderId: widget.orderId);
      if (!mounted) return;
      setState(() => _detail = detail);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order ${widget.orderNumber}')),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : _error != null
              ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(_error!, style: const TextStyle(color: AppColors.textMuted)),
                  const SizedBox(height: 12),
                  FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
                ]))
              : _detail == null
                  ? const Center(child: Text('Order not found'))
                  : RefreshIndicator(color: AppColors.primary, onRefresh: _load, child: _buildContent(_detail!)),
    );
  }

  Widget _buildContent(OrderDetail order) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Status card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(Icons.receipt_long_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.orderNumber, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(_formatDate(order.createdAt), style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 13)),
                  ],
                ),
              ),
              StatusChip(label: order.status),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Items
        const Text('Items', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.textPrimary)),
        const SizedBox(height: 12),
        ...order.items.map((item) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border, width: 0.5),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: item.imageUrl != null
                      ? CachedNetworkImage(imageUrl: item.imageUrl!, fit: BoxFit.cover, errorWidget: (_, _, _) => Container(color: AppColors.surface, child: const Icon(Icons.image_outlined, color: AppColors.textMuted)))
                      : Container(color: AppColors.surface, child: const Icon(Icons.image_outlined, color: AppColors.textMuted)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.productName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    const SizedBox(height: 4),
                    Text('x${item.quantity} • ₹${item.price.toStringAsFixed(0)}', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
              ),
              Text('₹${item.subtotal.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary)),
            ],
          ),
        )),

        const SizedBox(height: 16),

        // Summary
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border, width: 0.5),
          ),
          child: Column(
            children: [
              _DetailRow(label: 'Subtotal', value: '₹${order.subtotal.toStringAsFixed(0)}'),
              if (order.discount > 0) _DetailRow(label: 'Discount', value: '-₹${order.discount.toStringAsFixed(0)}', valueColor: AppColors.success),
              _DetailRow(label: 'Payment', value: order.paymentMethod ?? '-'),
              _DetailRow(label: 'Payment Status', value: order.paymentStatus ?? '-'),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(height: 1)),
              _DetailRow(label: 'Total', value: '₹${order.total.toStringAsFixed(0)}', bold: true),
            ],
          ),
        ),

        if (order.shippingAddress != null && order.shippingAddress!.isNotEmpty) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border, width: 0.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_outlined, color: AppColors.primary, size: 20),
                const SizedBox(width: 10),
                Expanded(child: Text(order.shippingAddress!, style: const TextStyle(color: AppColors.textSecondary, height: 1.5))),
              ],
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final local = value.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value, this.bold = false, this.valueColor});
  final String label;
  final String value;
  final bool bold;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: AppColors.textSecondary, fontWeight: bold ? FontWeight.w700 : FontWeight.w500)),
          Text(value, style: TextStyle(fontWeight: bold ? FontWeight.w700 : FontWeight.w600, color: valueColor ?? (bold ? AppColors.textPrimary : AppColors.textSecondary))),
        ],
      ),
    );
  }
}