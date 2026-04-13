import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
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
  List<WishlistItem> _items = [];

  @override
  void initState() {
    super.initState();
    _repository = WishlistRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
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
        SnackBar(content: Text('${item.name} removed from wishlist'), behavior: SnackBarBehavior.floating),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString()), behavior: SnackBarBehavior.floating),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (_error != null) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
        const SizedBox(height: 12),
        Text(_error!, style: const TextStyle(color: AppColors.error)),
        const SizedBox(height: 12),
        FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
      ]));
    }

    if (_items.isEmpty) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.surface, shape: BoxShape.circle),
          child: const Icon(Icons.favorite_border_rounded, size: 48, color: AppColors.textMuted),
        ),
        const SizedBox(height: 16),
        const Text('Your wishlist is empty', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        const Text('Save products you love here', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
      ]));
    }

    return RefreshIndicator(
      color: AppColors.primary,
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
                  builder: (_) => ProductDetailScreen(slug: item.slug, token: widget.token),
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
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                    child: item.primaryImageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: item.primaryImageUrl!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorWidget: (_, _, _) => Container(
                              color: AppColors.surface,
                              child: const Center(child: Icon(Icons.image_outlined, color: AppColors.textMuted)),
                            ),
                          )
                        : Container(
                            color: AppColors.surface,
                            child: const Center(child: Icon(Icons.image_outlined, color: AppColors.textMuted)),
                          ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(15), blurRadius: 4),
                        ]),
                        child: const Icon(Icons.favorite_rounded, color: AppColors.error, size: 18),
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
                children: [
                  Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text('₹${item.effectivePrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.primary, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
