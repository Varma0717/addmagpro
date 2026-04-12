import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
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
  final List<ListingListItem> _items = <ListingListItem>[];
  bool _loadingMore = false;

  @override
  void initState() {
    super.initState();
    _repository = CatalogRepository(apiClient: ApiClient());
    _load(reset: true);
  }

  Future<void> _load({required bool reset}) async {
    if (reset) {
      setState(() {
        _loading = true;
        _error = null;
        _page = 1;
        _lastPage = 1;
        _items.clear();
      });
    }

    try {
      final response = await _repository.fetchListings(page: _page);
      if (!mounted) return;
      setState(() {
        _items.addAll(response.items);
        _lastPage = response.lastPage;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
          _loadingMore = false;
        });
      }
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || _page >= _lastPage) return;
    setState(() {
      _loadingMore = true;
      _page += 1;
    });
    await _load(reset: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels > notification.metrics.maxScrollExtent - 180) {
                      _loadMore();
                    }
                    return false;
                  },
                  child: RefreshIndicator(
                    onRefresh: () => _load(reset: true),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: _items.length + (_loadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= _items.length) {
                          return const Padding(
                            padding: EdgeInsets.all(12),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final item = _items[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => ListingDetailScreen(slug: item.slug),
                                ),
                              );
                            },
                            leading: _NetworkThumb(url: item.primaryImageUrl),
                            title: Text(item.businessName),
                            subtitle: Text('${item.categoryName ?? 'Service'} • ${item.city ?? '-'}'),
                            trailing: item.ratingAvg == null
                                ? null
                                : Text('⭐ ${item.ratingAvg!.toStringAsFixed(1)}'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
    );
  }
}

class _NetworkThumb extends StatelessWidget {
  const _NetworkThumb({required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final imageUrl = url?.trim();
    if (imageUrl == null || imageUrl.isEmpty) {
      return const CircleAvatar(
        backgroundColor: Color(0xFFF3F4F6),
        child: Icon(Icons.storefront_outlined, color: Color(0xFF9CA3AF)),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: Image.network(
        imageUrl,
        width: 42,
        height: 42,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const CircleAvatar(
            backgroundColor: Color(0xFFF3F4F6),
            child: SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const CircleAvatar(
            backgroundColor: Color(0xFFF3F4F6),
            child: Icon(Icons.broken_image_outlined, color: Color(0xFF9CA3AF)),
          );
        },
      ),
    );
  }
}
