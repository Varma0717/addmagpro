import 'package:flutter/material.dart';

import '../../../app_state.dart';
import '../../../core/network/api_client.dart';
import '../../checkout/presentation/checkout_screen.dart';
import '../data/cart_repository.dart';
import '../models/cart_models.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.token, required this.appState});

  final String token;
  final AppState appState;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final CartRepository _repository;
  bool _loading = true;
  String? _error;
  CartOverview? _overview;
  CouponQuote? _couponQuote;
  final TextEditingController _couponController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _repository = CartRepository(apiClient: ApiClient());
    _load();
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final data = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _overview = data);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _changeQty(CartLineItem item, int nextQty) async {
    if (nextQty < 1) return;
    await _repository.updateQty(token: widget.token, itemId: item.id, quantity: nextQty);
    await _load();
  }

  Future<void> _remove(CartLineItem item) async {
    await _repository.removeItem(token: widget.token, itemId: item.id);
    await _load();
  }

  Future<void> _applyCoupon() async {
    final code = _couponController.text.trim();
    if (code.isEmpty) return;

    try {
      final quote = await _repository.applyCoupon(token: widget.token, code: code);
      if (!mounted) return;
      setState(() => _couponQuote = quote);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Coupon ${quote.code} applied')),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> _goCheckout() async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => CheckoutScreen(
          token: widget.token,
          appState: widget.appState,
          couponId: _couponQuote?.couponId,
        ),
      ),
    );

    if (result == true) {
      await _load();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Checkout completed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final overview = _overview;

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : overview == null || overview.items.isEmpty
                  ? const Center(child: Text('Your cart is empty'))
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: <Widget>[
                          for (final item in overview.items)
                            Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(item.product.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                                          const SizedBox(height: 4),
                                          Text('₹${item.product.effectivePrice.toStringAsFixed(2)}'),
                                          const SizedBox(height: 4),
                                          Text('Subtotal: ₹${item.subtotal.toStringAsFixed(2)}'),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => _changeQty(item, item.quantity - 1),
                                      icon: const Icon(Icons.remove_circle_outline),
                                    ),
                                    Text('${item.quantity}'),
                                    IconButton(
                                      onPressed: () => _changeQty(item, item.quantity + 1),
                                      icon: const Icon(Icons.add_circle_outline),
                                    ),
                                    IconButton(
                                      onPressed: () => _remove(item),
                                      icon: const Icon(Icons.delete_outline),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(height: 12),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  controller: _couponController,
                                  decoration: const InputDecoration(
                                    hintText: 'Coupon code',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              FilledButton.tonal(
                                onPressed: _applyCoupon,
                                child: const Text('Apply'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          _SummaryRow(label: 'Subtotal', value: overview.summary.subtotal),
                          if (_couponQuote != null)
                            _SummaryRow(
                              label: 'Discount',
                              value: -_couponQuote!.discount,
                              emphasize: true,
                            ),
                          const SizedBox(height: 8),
                          _SummaryRow(
                            label: 'Total',
                            value: _couponQuote?.finalTotal ?? overview.summary.total,
                            total: true,
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: _goCheckout,
                            child: const Text('Proceed to checkout'),
                          ),
                        ],
                      ),
                    ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
    this.total = false,
  });

  final String label;
  final double value;
  final bool emphasize;
  final bool total;

  @override
  Widget build(BuildContext context) {
    final isNegative = value < 0;
    final amount = isNegative ? -value : value;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontWeight: total ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          Text(
            '${isNegative ? '- ' : ''}₹${amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: emphasize ? const Color(0xFF067647) : null,
              fontWeight: total ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
