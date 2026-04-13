import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../models/catalog_models.dart';

class BrandOption {
  const BrandOption({required this.id, required this.name});

  final int id;
  final String name;
}

Future<ProductFilterQuery?> showProductFiltersSheet(
  BuildContext context, {
  required ProductFilterQuery initialFilters,
  List<BrandOption> brandOptions = const <BrandOption>[],
}) {
  return showModalBottomSheet<ProductFilterQuery>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _ProductFiltersSheet(initialFilters: initialFilters, brandOptions: brandOptions),
  );
}

class _ProductFiltersSheet extends StatefulWidget {
  const _ProductFiltersSheet({required this.initialFilters, required this.brandOptions});

  final ProductFilterQuery initialFilters;
  final List<BrandOption> brandOptions;

  @override
  State<_ProductFiltersSheet> createState() => _ProductFiltersSheetState();
}

class _ProductFiltersSheetState extends State<_ProductFiltersSheet> {
  late final TextEditingController _minPriceController;
  late final TextEditingController _maxPriceController;
  late ProductSortOption _sort;
  double _minRating = 0;
  int? _brandId;

  @override
  void initState() {
    super.initState();
    _minPriceController = TextEditingController(text: widget.initialFilters.minPrice?.toStringAsFixed(0) ?? '');
    _maxPriceController = TextEditingController(text: widget.initialFilters.maxPrice?.toStringAsFixed(0) ?? '');
    _sort = widget.initialFilters.sort;
    _minRating = widget.initialFilters.minRating ?? 0;
    _brandId = widget.initialFilters.brandId;
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + viewInsets),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Filter & Sort', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            const SizedBox(height: 14),
            Row(children: [
              Expanded(
                child: TextField(
                  controller: _minPriceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Min price', prefixText: '₹'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _maxPriceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Max price', prefixText: '₹'),
                ),
              ),
            ]),
            const SizedBox(height: 14),
            Text('Min rating: ${_minRating.toStringAsFixed(1)}', style: const TextStyle(color: AppColors.textSecondary)),
            Slider(
              value: _minRating,
              min: 0,
              max: 5,
              divisions: 10,
              label: _minRating.toStringAsFixed(1),
              onChanged: (value) => setState(() => _minRating = value),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<int?>(
              value: _brandId,
              decoration: const InputDecoration(labelText: 'Brand'),
              items: <DropdownMenuItem<int?>>[
                const DropdownMenuItem<int?>(value: null, child: Text('All brands')),
                ...widget.brandOptions.map((brand) => DropdownMenuItem<int?>(value: brand.id, child: Text(brand.name))),
              ],
              onChanged: (value) => setState(() => _brandId = value),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<ProductSortOption>(
              value: _sort,
              decoration: const InputDecoration(labelText: 'Sort by'),
              items: ProductSortOption.values
                  .map((option) => DropdownMenuItem<ProductSortOption>(value: option, child: Text(option.label)))
                  .toList(growable: false),
              onChanged: (value) {
                if (value != null) setState(() => _sort = value);
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(const ProductFilterQuery()),
                  child: const Text('Reset'),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () {
                    final minPrice = double.tryParse(_minPriceController.text.trim());
                    final maxPrice = double.tryParse(_maxPriceController.text.trim());
                    final filters = ProductFilterQuery(
                      minPrice: minPrice,
                      maxPrice: maxPrice,
                      minRating: _minRating <= 0 ? null : _minRating,
                      brandId: _brandId,
                      sort: _sort,
                    );
                    Navigator.of(context).pop(filters);
                  },
                  child: const Text('Apply'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
