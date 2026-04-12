import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
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
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final orders = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _orders = orders);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: RefreshIndicator(
        onRefresh: _load,
        child: _loading
            ? ListView(
                children: <Widget>[
                  const SizedBox(height: 220),
                  const Center(child: CircularProgressIndicator()),
                ],
              )
            : _error != null
                ? ListView(
                    padding: const EdgeInsets.all(24),
                    children: <Widget>[
                      Text(_error!, style: const TextStyle(color: Color(0xFFB42318))),
                    ],
                  )
                : _orders.isEmpty
                    ? ListView(
                        children: <Widget>[
                          const SizedBox(height: 220),
                          const Center(child: Text('No orders found')),
                        ],
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: _orders.length,
                        itemBuilder: (context, index) {
                          final order = _orders[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: const Color(0xFFE5E7EB)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        order.orderNumber,
                                        style: const TextStyle(fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    _StatusPill(label: order.status),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text('Items: ${order.itemsCount}'),
                                Text('Payment: ${order.paymentMethod ?? '-'} / ${order.paymentStatus ?? '-'}'),
                                const SizedBox(height: 8),
                                Text(
                                  '₹${order.total.toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _formatDate(order.createdAt),
                                  style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                                ),
                              ],
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

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF4B5563)),
      ),
    );
  }
}