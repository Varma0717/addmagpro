import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../data/catalog_repository.dart';
import '../models/catalog_models.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.categorySlug, this.title = 'Products', this.token});

  final String? categorySlug;
  final String title;
  final String? token;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  static const Map<String, String> _sortOptions = <String, String>{
    'latest': 'Latest',
    'price_asc': 'Price: Low-High',
    'price_desc': 'Price: High-Low',
    'rating': 'Rating',
  };

  late final CatalogRepository _repository;
  bool _loading = true;
  String? _error;
  int _page = 1;
  int _lastPage = 1;
  final List<ProductListItem> _items = [];
  bool _loadingMore = false;
  bool _gridView = true;
  String? _selectedSort;
  double? _minPrice;
  double? _maxPrice;
  double? _minRating;
  String? _brand;

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
      final response = await _repository.fetchProducts(
        page: _page,
        categorySlug: widget.categorySlug,
        sort: _selectedSort,
        minPrice: _minPrice,
        maxPrice: _maxPrice,
        minRating: _minRating,
        brand: _brand,
      );
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

  Future<void> _openSortAndFilterSheet() async {
    final minController = TextEditingController(text: _minPrice?.toStringAsFixed(0) ?? '');
    final maxController = TextEditingController(text: _maxPrice?.toStringAsFixed(0) ?? '');
    final ratingController = TextEditingController(text: _minRating?.toStringAsFixed(1) ?? '');
    final brandController = TextEditingController(text: _brand ?? '');

    String? draftSort = _selectedSort;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Sort & filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      const Text('Sort', style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _sortOptions.entries
                            .map(
                              (entry) => ChoiceChip(
                                label: Text(entry.value),
                                selected: draftSort == entry.key,
                                onSelected: (_) => setModalState(() => draftSort = entry.key),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: minController,
                        decoration: const InputDecoration(labelText: 'Min price'),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: maxController,
                        decoration: const InputDecoration(labelText: 'Max price'),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: ratingController,
                        decoration: const InputDecoration(labelText: 'Min rating (0-5)'),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: brandController,
                        decoration: const InputDecoration(labelText: 'Brand'),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setModalState(() {
                                draftSort = null;
                                minController.clear();
                                maxController.clear();
                                ratingController.clear();
                                brandController.clear();
                              });
                            },
                            child: const Text('Clear'),
                          ),
                          const Spacer(),
                          FilledButton(
                            onPressed: () {
                              setState(() {
                                _selectedSort = draftSort;
                                _minPrice = double.tryParse(minController.text.trim());
                                _maxPrice = double.tryParse(maxController.text.trim());
                                _minRating = double.tryParse(ratingController.text.trim());
                                _brand = brandController.text.trim().isEmpty ? null : brandController.text.trim();
                              });
                              Navigator.of(context).pop();
                              _load(reset: true);
                            },
                            child: const Text('Apply'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _clearAllFilters() {
    setState(() {
      _selectedSort = null;
      _minPrice = null;
      _maxPrice = null;
      _minRating = null;
      _brand = null;
    });
    _load(reset: true);
  }

  List<Widget> _buildActiveFilterChips() {
    final chips = <Widget>[];
    if (_selectedSort != null) {
      chips.add(Chip(label: Text('Sort: ${_sortOptions[_selectedSort] ?? _selectedSort!}')));
    }
    if (_minPrice != null) {
      chips.add(Chip(label: Text('Min ₹${_minPrice!.toStringAsFixed(0)}')));
    }
    if (_maxPrice != null) {
      chips.add(Chip(label: Text('Max ₹${_maxPrice!.toStringAsFixed(0)}')));
    }
    if (_minRating != null) {
      chips.add(Chip(label: Text('Rating ${_minRating!.toStringAsFixed(1)}+')));
    }
    if (_brand != null) {
      chips.add(Chip(label: Text('Brand: $_brand')));
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _openSortAndFilterSheet,
            icon: const Icon(Icons.tune_rounded),
            tooltip: 'Sort & filters',
          ),
          IconButton(
            onPressed: () => setState(() => _gridView = !_gridView),
            icon: Icon(_gridView ? Icons.view_list_rounded : Icons.grid_view_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_buildActiveFilterChips().isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Wrap(spacing: 8, runSpacing: 8, children: _buildActiveFilterChips()),
                  ),
                  TextButton(onPressed: _clearAllFilters, child: const Text('Clear all')),
                ],
              ),
            ),
          Expanded(
            child: _loading
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
                              child: const Icon(Icons.inventory_2_outlined, size: 48, color: AppColors.textMuted),
                            ),
                            const SizedBox(height: 16),
                            const Text('No products found', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                          ]))
                        : NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification.metrics.pixels > notification.metrics.maxScrollExtent - 200) _loadMore();
                              return false;
                            },
                            child: RefreshIndicator(
                              color: AppColors.primary,
                              onRefresh: () => _load(reset: true),
                              child: _gridView ? _buildGrid() : _buildList(),
                            ),
                          ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: _items.length + (_loadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _items.length) return const Center(child: CircularProgressIndicator(color: AppColors.primary));
        final item = _items[index];
        return _ProductGridCard(
          product: item,
          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (_) => ProductDetailScreen(slug: item.slug, token: widget.token),
          )),
        );
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _items.length + (_loadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _items.length) return const Padding(padding: EdgeInsets.all(12), child: Center(child: CircularProgressIndicator(color: AppColors.primary)));
        final item = _items[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (_) => ProductDetailScreen(slug: item.slug, token: widget.token),
            )),
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: item.primaryImageUrl != null
                        ? CachedNetworkImage(imageUrl: item.primaryImageUrl!, width: 80, height: 80, fit: BoxFit.cover,
                            errorWidget: (_, _, _) => Container(width: 80, height: 80, color: AppColors.surface, child: const Icon(Icons.image_outlined, color: AppColors.textMuted)))
                        : Container(width: 80, height: 80, color: AppColors.surface, child: const Icon(Icons.image_outlined, color: AppColors.textMuted)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary)),
                        const SizedBox(height: 6),
                        Row(children: [
                          Text('₹${item.effectivePrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.primary, fontSize: 15)),
                          const Spacer(),
                          if (item.ratingAvg != null) Row(mainAxisSize: MainAxisSize.min, children: [
                            const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
                            const SizedBox(width: 2),
                            Text(item.ratingAvg!.toStringAsFixed(1), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                          ]),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProductGridCard extends StatelessWidget {
  const _ProductGridCard({required this.product, required this.onTap});

  final ProductListItem product;
  final VoidCallback onTap;

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
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                child: product.primaryImageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: product.primaryImageUrl!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (_, _, _) => Container(color: AppColors.surface, child: const Center(child: Icon(Icons.image_outlined, color: AppColors.textMuted))),
                      )
                    : Container(color: AppColors.surface, child: const Center(child: Icon(Icons.image_outlined, color: AppColors.textMuted))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Row(children: [
                    Text('₹${product.effectivePrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.primary, fontSize: 13)),
                    const Spacer(),
                    if (product.ratingAvg != null) Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.star_rounded, size: 14, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text(product.ratingAvg!.toStringAsFixed(1), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                    ]),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
