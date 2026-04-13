import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../data/catalog_repository.dart';
import '../models/catalog_models.dart';
import 'listing_detail_screen.dart';

class ListingListScreen extends StatefulWidget {
  const ListingListScreen({super.key, this.title = 'Services'});

  final String title;

  @override
  State<ListingListScreen> createState() => _ListingListScreenState();
}

class _ListingListScreenState extends State<ListingListScreen> {
  late final CatalogRepository _repository;
  bool _loading = true;
  String? _error;
  int _page = 1;
  int _lastPage = 1;
  final List<ListingListItem> _items = [];
  bool _loadingMore = false;

  @override
  void initState() {
    super.initState();
    _repository = CatalogRepository(apiClient: ApiClient());
    _load(reset: true);
  }

  Future<void> _load({required bool reset}) async {
    if (reset) {
      setState(() { _loading = true; _error = null; _page = 1; _lastPage = 1; _items.clear(); });
    }
    try {
      final response = await _repository.fetchListings(page: _page);
      if (!mounted) return;
      setState(() { _items.addAll(response.items); _lastPage = response.lastPage; });
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() { _loading = false; _loadingMore = false; });
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || _page >= _lastPage) return;
    setState(() { _loadingMore = true; _page += 1; });
    await _load(reset: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : _error != null
              ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
                  const SizedBox(height: 12),
                  Text(_error!, style: const TextStyle(color: AppColors.error)),
                  const SizedBox(height: 12),
                  FilledButton.tonal(onPressed: () => _load(reset: true), child: const Text('Retry')),
                ]))
              : _items.isEmpty
                  ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.surface, shape: BoxShape.circle),
                        child: const Icon(Icons.storefront_outlined, size: 48, color: AppColors.textMuted),
                      ),
                      const SizedBox(height: 16),
                      const Text('No services found', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                    ]))
                  : NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.pixels > notification.metrics.maxScrollExtent - 180) _loadMore();
                        return false;
                      },
                      child: RefreshIndicator(
                        color: AppColors.primary,
                        onRefresh: () => _load(reset: true),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: _items.length + (_loadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index >= _items.length) {
                              return const Padding(padding: EdgeInsets.all(12), child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
                            }
                            final item = _items[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.borderLight),
                                boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 8, offset: const Offset(0, 2))],
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => ListingDetailScreen(slug: item.slug))),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: item.primaryImageUrl != null && item.primaryImageUrl!.trim().isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl: item.primaryImageUrl!,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          errorWidget: (_, _, _) => Container(
                                            width: 50, height: 50,
                                            decoration: BoxDecoration(color: AppColors.success.withAlpha(20), borderRadius: BorderRadius.circular(10)),
                                            child: const Icon(Icons.storefront_outlined, color: AppColors.success, size: 22),
                                          ),
                                        )
                                      : Container(
                                          width: 50, height: 50,
                                          decoration: BoxDecoration(color: AppColors.success.withAlpha(20), borderRadius: BorderRadius.circular(10)),
                                          child: const Icon(Icons.storefront_outlined, color: AppColors.success, size: 22),
                                        ),
                                ),
                                title: Text(item.businessName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary)),
                                subtitle: Text('${item.categoryName ?? 'Service'} • ${item.city ?? '-'}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                                trailing: item.ratingAvg == null
                                    ? null
                                    : Row(mainAxisSize: MainAxisSize.min, children: [
                                        const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
                                        const SizedBox(width: 2),
                                        Text(item.ratingAvg!.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                                      ]),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
    );
  }
}
