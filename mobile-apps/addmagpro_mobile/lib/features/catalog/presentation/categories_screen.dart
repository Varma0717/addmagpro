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
  String _sortBy = 'newest';
  double? _minPrice;
  double? _maxPrice;
  double? _minRating;
  int? _brandId;
  List<BrandFilterOption> _availableBrands = <BrandFilterOption>[];

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
          sort: _mapSortForApi(_sortBy),
          minPrice: _minPrice,
          maxPrice: _maxPrice,
          minRating: _minRating,
          brandId: _brandId,
        );
        if (!mounted) return;
        setState(() {
          _products.addAll(response.items);
          _lastPage = response.lastPage;
          _availableBrands = response.availableBrands;
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

  String _mapSortForApi(String value) {
    switch (value) {
      case 'price_asc':
      case 'price_desc':
      case 'rating':
        return value;
      default:
        return 'latest';
    }
  }

  String _sortLabel(String value) {
    switch (value) {
      case 'price_asc':
        return 'Price: Low to High';
      case 'price_desc':
        return 'Price: High to Low';
      case 'rating':
        return 'Top Rated';
      default:
        return 'Newest';
    }
  }

  List<_ActiveFilterChip> _buildActiveFilterChips() {
    final chips = <_ActiveFilterChip>[];

    if (_sortBy != 'newest') {
      chips.add(
        _ActiveFilterChip(
          label: 'Sort: ${_sortLabel(_sortBy)}',
          onRemoved: () {
            setState(() => _sortBy = 'newest');
            _loadProducts(reset: true);
          },
        ),
      );
    }

    if (_minPrice != null || _maxPrice != null) {
      final minText = _minPrice?.toStringAsFixed(0) ?? '0';
      final maxText = _maxPrice?.toStringAsFixed(0) ?? 'Any';
      chips.add(
        _ActiveFilterChip(
          label: 'Price: ₹$minText - ₹$maxText',
          onRemoved: () {
            setState(() {
              _minPrice = null;
              _maxPrice = null;
            });
            _loadProducts(reset: true);
          },
        ),
      );
    }

    if (_minRating != null) {
      chips.add(
        _ActiveFilterChip(
          label: 'Rating: ${_minRating!.toStringAsFixed(1)}+',
          onRemoved: () {
            setState(() => _minRating = null);
            _loadProducts(reset: true);
          },
        ),
      );
    }

    if (_brandId != null) {
      BrandFilterOption? brand;
      for (final item in _availableBrands) {
        if (item.id == _brandId) {
          brand = item;
          break;
        }
      }
      chips.add(
        _ActiveFilterChip(
          label: 'Brand: ${brand?.name ?? 'Selected'}',
          onRemoved: () {
            setState(() => _brandId = null);
            _loadProducts(reset: true);
          },
        ),
      );
    }

    return chips;
  }

  Future<void> _openFilterSheet() async {
    final minController = TextEditingController(text: _minPrice?.toStringAsFixed(0) ?? '');
    final maxController = TextEditingController(text: _maxPrice?.toStringAsFixed(0) ?? '');
    double? sheetMinRating = _minRating;
    int? sheetBrandId = _brandId;

    final applied = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Filters', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: minController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Min price'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: maxController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Max price'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<double?>(
                    value: sheetMinRating,
                    decoration: const InputDecoration(labelText: 'Minimum rating'),
                    items: const [
                      DropdownMenuItem<double?>(value: null, child: Text('Any')),
                      DropdownMenuItem<double?>(value: 4.5, child: Text('4.5+')),
                      DropdownMenuItem<double?>(value: 4.0, child: Text('4.0+')),
                      DropdownMenuItem<double?>(value: 3.5, child: Text('3.5+')),
                    ],
                    onChanged: (value) => setModalState(() => sheetMinRating = value),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<int?>(
                    value: sheetBrandId,
                    decoration: const InputDecoration(labelText: 'Brand'),
                    items: [
                      const DropdownMenuItem<int?>(value: null, child: Text('Any')),
                      ..._availableBrands.map(
                        (brand) => DropdownMenuItem<int?>(value: brand.id, child: Text(brand.name)),
                      ),
                    ],
                    onChanged: _availableBrands.isEmpty ? null : (value) => setModalState(() => sheetBrandId = value),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          minController.clear();
                          maxController.clear();
                          setModalState(() {
                            sheetMinRating = null;
                            sheetBrandId = null;
                          });
                        },
                        child: const Text('Reset'),
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (applied == true) {
      final parsedMin = double.tryParse(minController.text.trim());
      final parsedMax = double.tryParse(maxController.text.trim());
      setState(() {
        _minPrice = parsedMin;
        _maxPrice = parsedMax;
        _minRating = sheetMinRating;
        _brandId = sheetBrandId;
      });
      _loadProducts(reset: true);
    }
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

    final activeChips = _buildActiveFilterChips();

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
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == _sortBy) return;
                          setState(() => _sortBy = value);
                          _loadProducts(reset: true);
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 'newest', child: Text('Newest')),
                          PopupMenuItem(value: 'price_asc', child: Text('Price: Low to High')),
                          PopupMenuItem(value: 'price_desc', child: Text('Price: High to Low')),
                          PopupMenuItem(value: 'rating', child: Text('Top Rated')),
                        ],
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.borderLight),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.sort_rounded, size: 18),
                              const SizedBox(width: 8),
                              Expanded(child: Text('Sort: ${_sortLabel(_sortBy)}', style: const TextStyle(fontSize: 12))),
                              const Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: _openFilterSheet,
                      icon: const Icon(Icons.tune_rounded),
                      label: const Text('Filters'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    if (activeChips.isNotEmpty)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _sortBy = 'newest';
                            _minPrice = null;
                            _maxPrice = null;
                            _minRating = null;
                            _brandId = null;
                          });
                          _loadProducts(reset: true);
                        },
                        child: const Text('Clear all'),
                      ),
                  ],
                ),
              ),
              if (activeChips.isNotEmpty)
                SizedBox(
                  height: 38,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: activeChips
                        .map(
                          (chip) => Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: InputChip(
                              label: Text(chip.label),
                              onDeleted: chip.onRemoved,
                            ),
                          ),
                        )
                        .toList(growable: false),
                  ),
                ),
              const SizedBox(height: 4),
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

class _ActiveFilterChip {
  const _ActiveFilterChip({required this.label, required this.onRemoved});

  final String label;
  final VoidCallback onRemoved;
}
