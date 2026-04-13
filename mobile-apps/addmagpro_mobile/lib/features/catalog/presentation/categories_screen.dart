import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../home/data/home_repository.dart';
import '../../home/models/home_feed_models.dart';
import '../data/catalog_repository.dart';
import '../models/catalog_models.dart';
import 'product_detail_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, this.token});

  final String? token;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  static const Map<String, String> _sortOptions = <String, String>{
    'latest': 'Latest',
    'price_asc': 'Price: Low-High',
    'price_desc': 'Price: High-Low',
    'rating': 'Rating',
  };

  late final HomeRepository _homeRepository;
  late final CatalogRepository _catalogRepository;
  bool _loadingCategories = true;
  List<HomeCategoryItem> _categories = <HomeCategoryItem>[];
  int _selectedIndex = 0;
  String? _error;

  // Products for selected category
  bool _loadingProducts = false;
  final List<ProductListItem> _products = <ProductListItem>[];
  int _page = 1;
  int _lastPage = 1;
  bool _loadingMore = false;
  String? _selectedSort;
  double? _minPrice;
  double? _maxPrice;
  double? _minRating;
  String? _brand;

  @override
  void initState() {
    super.initState();
    _homeRepository = HomeRepository(apiClient: ApiClient());
    _catalogRepository = CatalogRepository(apiClient: ApiClient());
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _loadingCategories = true;
      _error = null;
    });

    try {
      final feed = await _homeRepository.fetch();
      if (!mounted) return;
      setState(() {
        _categories = feed.categories;
        _loadingCategories = false;
      });
      if (_categories.isNotEmpty) {
        _loadProducts(reset: true);
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error.toString();
        _loadingCategories = false;
      });
    }
  }

  Future<void> _loadProducts({required bool reset}) async {
    if (_categories.isEmpty) return;

    if (reset) {
      setState(() {
        _loadingProducts = true;
        _products.clear();
        _page = 1;
        _lastPage = 1;
      });
    }

    try {
      final category = _categories[_selectedIndex];
      if (category.type == 'ecommerce') {
        final response = await _catalogRepository.fetchProducts(
          page: _page,
          categorySlug: category.slug,
          sort: _selectedSort,
          minPrice: _minPrice,
          maxPrice: _maxPrice,
          minRating: _minRating,
          brand: _brand,
        );
        if (!mounted) return;
        setState(() {
          _products.addAll(response.items);
          _lastPage = response.lastPage;
        });
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() {
          _loadingProducts = false;
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
    await _loadProducts(reset: false);
  }

  void _onCategoryTap(int index) {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
    _loadProducts(reset: true);
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
                              _loadProducts(reset: true);
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
    _loadProducts(reset: true);
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
    if (_loadingCategories) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (_error != null && _categories.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text(_error!, style: const TextStyle(color: AppColors.error)),
            const SizedBox(height: 12),
            FilledButton.tonal(onPressed: _loadCategories, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_categories.isEmpty) {
      return const Center(child: Text('No categories found'));
    }

    return Row(
      children: [
        // Left sidebar — category list
        SizedBox(
          width: 100,
          child: Container(
            color: AppColors.surface,
            child: ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedIndex == index;
                return InkWell(
                  onTap: () => _onCategoryTap(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      border: Border(
                        left: BorderSide(
                          color: isSelected ? AppColors.primary : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        if (category.imageUrl != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: category.imageUrl!,
                              width: 36,
                              height: 36,
                              fit: BoxFit.cover,
                              errorWidget: (_, _, _) => Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.category_outlined, size: 18, color: AppColors.primary),
                              ),
                            ),
                          )
                        else
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.category_outlined, size: 18, color: AppColors.primary),
                          ),
                        const SizedBox(height: 6),
                        Text(
                          category.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            color: isSelected ? AppColors.primary : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const VerticalDivider(width: 1, thickness: 1, color: AppColors.borderLight),
        // Right side — product grid
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Row(
                  children: [
                    FilledButton.tonalIcon(
                      onPressed: _openSortAndFilterSheet,
                      icon: const Icon(Icons.tune_rounded, size: 18),
                      label: const Text('Sort & filter'),
                    ),
                    const Spacer(),
                    if (_buildActiveFilterChips().isNotEmpty)
                      TextButton(onPressed: _clearAllFilters, child: const Text('Clear all')),
                  ],
                ),
              ),
              if (_buildActiveFilterChips().isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Wrap(spacing: 8, runSpacing: 8, children: _buildActiveFilterChips()),
                ),
              Expanded(
                child: _loadingProducts
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                    : _products.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.inventory_2_outlined, size: 48, color: AppColors.textMuted),
                                const SizedBox(height: 8),
                                Text(
                                  'No products in ${_categories[_selectedIndex].name}',
                                  style: const TextStyle(color: AppColors.textSecondary),
                                ),
                              ],
                            ),
                          )
                        : NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification.metrics.pixels > notification.metrics.maxScrollExtent - 200) {
                                _loadMore();
                              }
                              return false;
                            },
                            child: GridView.builder(
                              padding: const EdgeInsets.all(10),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.68,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: _products.length + (_loadingMore ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index >= _products.length) {
                                  return const Center(child: CircularProgressIndicator());
                                }

                                final product = _products[index];
                                return _ProductGridCard(
                                  product: product,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (_) => ProductDetailScreen(
                                          slug: product.slug,
                                          token: widget.token,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
              ),
            ],
          ),
        ),
      ],
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
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '₹${product.effectivePrice.toStringAsFixed(0)}',
                        style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.primary, fontSize: 13),
                      ),
                      const Spacer(),
                      if (product.ratingAvg != null)
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.star_rounded, size: 14, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(product.ratingAvg!.toStringAsFixed(1), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                        ]),
                    ],
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
