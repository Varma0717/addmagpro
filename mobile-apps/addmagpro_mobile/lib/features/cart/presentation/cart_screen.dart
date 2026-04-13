import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../app_state.dart';
import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
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
    setState(() { _loading = true; _error = null; });
    try {
      final data = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _overview = data);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Coupon ${quote.code} applied'), behavior: SnackBarBehavior.floating));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  Future<void> _goCheckout() async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(builder: (_) => CheckoutScreen(token: widget.token, appState: widget.appState, couponId: _couponQuote?.couponId)),
    );
    if (result == true) {
      await _load();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order placed successfully!'), behavior: SnackBarBehavior.floating));
    }
  }

  @override
  Widget build(BuildContext context) {
    final overview = _overview;

    if (_loading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (_error != null) {
      return Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
          const SizedBox(height: 12),
          Text(_error!, style: const TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 12),
          FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
        ],
      ));
    }

    if (overview == null || overview.items.isEmpty) {
      return const EmptyState(
        icon: Icons.shopping_bag_outlined,
        title: 'Your cart is empty',
        subtitle: 'Browse products and add items to your cart',
      );
    }

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Cart items
          ...overview.items.map((item) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border, width: 0.5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: item.product.primaryImageUrl != null
                        ? CachedNetworkImage(imageUrl: item.product.primaryImageUrl!, fit: BoxFit.cover, errorWidget: (_, _, _) => _imagePlaceholder())
                        : _imagePlaceholder(),
                  ),
                ),
                const SizedBox(width: 12),
                // Product info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.product.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary), maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 6),
                      Text('₹${item.product.effectivePrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.primary)),
                      const SizedBox(height: 8),
                      // Quantity controls
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () => _changeQty(item, item.quantity - 1),
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Padding(padding: EdgeInsets.all(8), child: Icon(Icons.remove_rounded, size: 18)),
                                ),
                                SizedBox(width: 28, child: Center(child: Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.w700)))),
                                InkWell(
                                  onTap: () => _changeQty(item, item.quantity + 1),
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Padding(padding: EdgeInsets.all(8), child: Icon(Icons.add_rounded, size: 18)),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text('₹${item.subtotal.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () => _remove(item),
                            borderRadius: BorderRadius.circular(8),
                            child: const Padding(padding: EdgeInsets.all(6), child: Icon(Icons.delete_outline_rounded, size: 20, color: AppColors.error)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),

          const SizedBox(height: 8),

          // Coupon input
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border, width: 0.5),
            ),
            child: Row(
              children: [
                const Icon(Icons.local_offer_outlined, color: AppColors.primary, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _couponController,
                    decoration: const InputDecoration(hintText: 'Enter coupon code', border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.zero),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                FilledButton.tonal(
                  onPressed: _applyCoupon,
                  style: FilledButton.styleFrom(minimumSize: const Size(0, 36), padding: const EdgeInsets.symmetric(horizontal: 16)),
                  child: const Text('Apply'),
                ),
              ],
            ),
          ),
          if (_couponQuote != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 16),
                  const SizedBox(width: 6),
                  Text('${_couponQuote!.code} applied • -₹${_couponQuote!.discount.toStringAsFixed(0)}', style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.w600, fontSize: 13)),
                ],
              ),
            ),

          const SizedBox(height: 16),

          // Order summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Summary', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.textPrimary)),
                const SizedBox(height: 14),
                _SummaryRow(label: 'Subtotal', value: overview.summary.subtotal),
                if (_couponQuote != null)
                  _SummaryRow(label: 'Discount', value: -_couponQuote!.discount, emphasize: true),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Divider(height: 1)),
                _SummaryRow(label: 'Total', value: _couponQuote?.finalTotal ?? overview.summary.total, total: true),
              ],
            ),
          ),

          const SizedBox(height: 16),

          FilledButton(
            onPressed: _goCheckout,
            style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 52)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_checkout_rounded, size: 20),
                SizedBox(width: 8),
                Text('Proceed to Checkout'),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _imagePlaceholder() => Container(color: AppColors.surface, child: const Center(child: Icon(Icons.image_outlined, color: AppColors.textMuted, size: 28)));
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
