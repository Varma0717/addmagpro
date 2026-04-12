import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
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
  List<MixedSearchItem> _results = <MixedSearchItem>[];

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
      setState(() {
        _results = <MixedSearchItem>[];
        _error = 'Type at least 2 characters';
      });
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final response = await _repository.search(query);
      if (!mounted) return;
      setState(() => _results = response.results);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _addToCart(MixedSearchItem item) async {
    final token = widget.token;
    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login required to add products to cart')),
      );
      return;
    }

    try {
      await _cartRepository.addItem(token: token, productId: item.id, quantity: 1);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${item.title} added to cart')),
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
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _queryController,
                    onSubmitted: (_) => _performSearch(),
                    decoration: const InputDecoration(
                      hintText: 'Search products or services',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: _loading ? null : _performSearch,
                  child: const Text('Go'),
                ),
              ],
            ),
          ),
          if (_loading) const LinearProgressIndicator(minHeight: 2),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(_error!, style: const TextStyle(color: Color(0xFFB42318))),
              ),
            ),
          Expanded(
            child: _results.isEmpty
                ? const Center(child: Text('Search to discover products and services'))
                : ListView.separated(
                    itemCount: _results.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (_, index) {
                      final item = _results[index];
                      return ListTile(
                        onTap: () {
                          if (item.slug.trim().isEmpty) return;
                          if (item.isProduct) {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => ProductDetailScreen(
                                  slug: item.slug,
                                  token: widget.token,
                                ),
                              ),
                            );
                          } else if (item.isListing) {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => ListingDetailScreen(slug: item.slug),
                              ),
                            );
                          }
                        },
                        leading: CircleAvatar(
                          backgroundColor: item.isProduct ? const Color(0xFFFFEDD5) : const Color(0xFFECFDF3),
                          child: Icon(
                            item.isProduct ? Icons.shopping_bag_outlined : Icons.storefront_outlined,
                            color: item.isProduct ? const Color(0xFFC2410C) : const Color(0xFF067647),
                          ),
                        ),
                        title: Text(item.title),
                        subtitle: Text(item.city ?? item.subtitle ?? item.type),
                        trailing: item.isProduct
                            ? FilledButton.tonal(
                                onPressed: () => _addToCart(item),
                                child: const Text('Add'),
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
