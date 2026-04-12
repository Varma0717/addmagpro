import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../cart/data/cart_repository.dart';
import '../data/catalog_repository.dart';
import '../models/catalog_models.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.slug, this.token});

  final String slug;
  final String? token;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late final CatalogRepository _catalogRepository;
  late final CartRepository _cartRepository;
  bool _loading = true;
  String? _error;
  ProductDetail? _product;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _catalogRepository = CatalogRepository(apiClient: ApiClient());
    _cartRepository = CartRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final data = await _catalogRepository.fetchProductDetail(widget.slug);
      if (!mounted) return;
      setState(() => _product = data);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _addToCart() async {
    final token = widget.token;
    final product = _product;
    if (token == null || product == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login required to add to cart')),
      );
      return;
    }

    try {
      await _cartRepository.addItem(
        token: token,
        productId: product.id,
        quantity: _quantity,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product.name} x$_quantity added to cart')),
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
    final product = _product;

    return Scaffold(
      appBar: AppBar(title: const Text('Product details')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : product == null
                  ? const Center(child: Text('Product not found'))
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: <Widget>[
                        if (product.images.isNotEmpty)
                          SizedBox(
                            height: 220,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: product.images.length,
                              separatorBuilder: (_, _) => const SizedBox(width: 10),
                              itemBuilder: (_, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    product.images[index],
                                    width: 220,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) return child;
                                      return Container(
                                        width: 220,
                                        color: const Color(0xFFF3F4F6),
                                        alignment: Alignment.center,
                                        child: const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 220,
                                        color: const Color(0xFFF3F4F6),
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.broken_image_outlined,
                                          color: Color(0xFF9CA3AF),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.image_not_supported_outlined),
                          ),
                        const SizedBox(height: 14),
                        Text(product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text('₹${product.effectivePrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFFB54708))),
                        if (product.ratingAvg != null) ...<Widget>[
                          const SizedBox(height: 4),
                          Text('⭐ ${product.ratingAvg!.toStringAsFixed(1)}'),
                        ],
                        const SizedBox(height: 10),
                        Text('Stock: ${product.stock}'),
                        const SizedBox(height: 12),
                        Row(
                          children: <Widget>[
                            const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w700)),
                            const SizedBox(width: 12),
                            IconButton.outlined(
                              onPressed: _quantity > 1
                                  ? () => setState(() {
                                        _quantity -= 1;
                                      })
                                  : null,
                              icon: const Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 44,
                              child: Center(
                                child: Text(
                                  '$_quantity',
                                  style: const TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            IconButton.outlined(
                              onPressed: _quantity < product.stock
                                  ? () => setState(() {
                                        _quantity += 1;
                                      })
                                  : null,
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(product.description?.trim().isNotEmpty == true ? product.description! : 'No description available.'),
                        const SizedBox(height: 18),
                        FilledButton(
                          onPressed: product.stock > 0 ? _addToCart : null,
                          child: const Text('Add to cart'),
                        ),
                      ],
                    ),
    );
  }
}
