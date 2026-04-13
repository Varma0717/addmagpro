import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../catalog/presentation/listing_detail_screen.dart';
import '../../catalog/presentation/product_detail_screen.dart';
import '../../cart/data/cart_repository.dart';
import '../data/search_repository.dart';
import '../models/search_models.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.token});

  final String? token;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchRepository _repository;
  late final CartRepository _cartRepository;
  final TextEditingController _queryController = TextEditingController();

  bool _loading = false;
  String? _error;
  List<MixedSearchItem> _results = [];

  @override
  void initState() {
    super.initState();
    _repository = SearchRepository(apiClient: ApiClient());
    _cartRepository = CartRepository(apiClient: ApiClient());
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    final query = _queryController.text.trim();
    if (query.length < 2) {
      setState(() { _results = []; _error = 'Type at least 2 characters'; });
      return;
    }
    setState(() { _loading = true; _error = null; });
    try {
      final response = await _repository.search(query);
      if (!mounted) return;
      setState(() => _results = response.results);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _addToCart(MixedSearchItem item) async {
    final token = widget.token;
    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login required to add products to cart'), behavior: SnackBarBehavior.floating),
      );
      return;
    }
    try {
      await _cartRepository.addItem(token: token, productId: item.id, quantity: 1);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${item.title} added to cart'), behavior: SnackBarBehavior.floating),
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
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _queryController,
              onSubmitted: (_) => _performSearch(),
              decoration: InputDecoration(
                hintText: 'Search products or services...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _queryController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () { _queryController.clear(); setState(() => _results = []); },
                        icon: const Icon(Icons.close_rounded, size: 20),
                      )
                    : IconButton(
                        onPressed: _loading ? null : _performSearch,
                        icon: const Icon(Icons.arrow_forward_rounded, size: 20),
                      ),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
          if (_loading) const LinearProgressIndicator(minHeight: 2, color: AppColors.primary),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(alignment: Alignment.centerLeft, child: Text(_error!, style: const TextStyle(color: AppColors.error, fontSize: 13))),
            ),
          Expanded(
            child: _results.isEmpty && !_loading
                ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: AppColors.surface, shape: BoxShape.circle),
                      child: const Icon(Icons.search_rounded, size: 48, color: AppColors.textMuted),
                    ),
                    const SizedBox(height: 16),
                    const Text('Search to discover', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    const Text('Find products and services', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                  ]))
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _results.length,
                    separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.borderLight),
                    itemBuilder: (_, index) {
                      final item = _results[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 6),
                        onTap: () {
                          if (item.slug.trim().isEmpty) return;
                          if (item.isProduct) {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (_) => ProductDetailScreen(slug: item.slug, token: widget.token),
                            ));
                          } else if (item.isListing) {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (_) => ListingDetailScreen(slug: item.slug),
                            ));
                          }
                        },
                        leading: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: item.isProduct ? AppColors.primaryLight : AppColors.success.withAlpha(20),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            item.isProduct ? Icons.shopping_bag_outlined : Icons.storefront_outlined,
                            color: item.isProduct ? AppColors.primary : AppColors.success,
                            size: 20,
                          ),
                        ),
                        title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary)),
                        subtitle: Text(item.city ?? item.subtitle ?? item.type, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                        trailing: item.isProduct
                            ? FilledButton.tonal(
                                onPressed: () => _addToCart(item),
                                style: FilledButton.styleFrom(
                                  minimumSize: const Size(0, 34),
                                  padding: const EdgeInsets.symmetric(horizontal: 14),
                                ),
                                child: const Text('Add', style: TextStyle(fontSize: 12)),
                              )
                            : null,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
