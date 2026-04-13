import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../catalog/presentation/product_detail_screen.dart';
import '../data/wishlist_repository.dart';
import '../models/wishlist_models.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key, required this.token});

  final String token;

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  late final WishlistRepository _repository;
  bool _loading = true;
  String? _error;
  List<WishlistItem> _items = <WishlistItem>[];

  @override
  void initState() {
    super.initState();
    _repository = WishlistRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final items = await _repository.fetchAll(widget.token);
      if (!mounted) return;
      setState(() => _items = items);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _remove(WishlistItem item) async {
    try {
      await _repository.toggle(token: widget.token, productId: item.productId);
      if (!mounted) return;
      setState(() => _items.removeWhere((e) => e.id == item.id));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${item.name} removed from wishlist')),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(_error!, style: const TextStyle(color: Color(0xFFB42318))),
            const SizedBox(height: 12),
            TextButton(onPressed: _load, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(Icons.favorite_border, size: 64, color: Color(0xFFD1D5DB)),
            const SizedBox(height: 12),
            const Text('Your wishlist is empty', style: TextStyle(color: Color(0xFF6B7280), fontSize: 16)),
            const SizedBox(height: 4),
            const Text('Save products you love here', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _load,
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return _WishlistCard(
            item: item,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ProductDetailScreen(
                    slug: item.slug,
                    token: widget.token,
                  ),
                ),
              );
            },
            onRemove: () => _remove(item),
          );
        },
      ),
    );
  }
}

class _WishlistCard extends StatelessWidget {
  const _WishlistCard({required this.item, required this.onTap, required this.onRemove});

  final WishlistItem item;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                    child: item.primaryImageUrl != null
                        ? Image.network(
                            item.primaryImageUrl!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: const Color(0xFFF3F4F6),
                              child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF9CA3AF))),
                            ),
                          )
                        : Container(
                            color: const Color(0xFFF3F4F6),
                            child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF9CA3AF))),
                          ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite, color: Color(0xFFEF4444), size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹${item.effectivePrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFB54708),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
