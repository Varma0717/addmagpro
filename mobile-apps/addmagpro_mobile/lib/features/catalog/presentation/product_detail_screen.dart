import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../cart/data/cart_repository.dart';
import '../../wishlist/data/wishlist_repository.dart';
import '../data/catalog_repository.dart';
import '../models/catalog_models.dart';
import '../../wishlist/data/wishlist_repository.dart';

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
  late final WishlistRepository _wishlistRepository;
  final PageController _imageController = PageController();
  bool _loading = true;
  bool _addingToCart = false;
  bool _wishlistBusy = false;
  bool _wishlisted = false;
  String? _error;
  ProductDetail? _product;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _catalogRepository = CatalogRepository(apiClient: ApiClient());
    _cartRepository = CartRepository(apiClient: ApiClient());
    _wishlistRepository = WishlistRepository(apiClient: ApiClient());
    _load();
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final data = await _catalogRepository.fetchProductDetail(widget.slug);
      bool wishlisted = false;
      if (widget.token != null) {
        wishlisted = await _wishlistRepository.check(
          token: widget.token!,
          productId: data.id,
        );
      }
      if (!mounted) return;
      setState(() => _product = data);
      await _initializeWishlistState(data.id);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _initializeWishlistState(int productId) async {
    final token = widget.token;
    if (token == null) {
      if (!mounted) return;
      setState(() => _wishlisted = false);
      return;
    }
    try {
      final inWishlist = await _wishlistRepository.check(token: token, productId: productId);
      if (!mounted) return;
      setState(() => _wishlisted = inWishlist);
    } catch (_) {
      // Keep the default state on check failure.
    }
  }

  Future<void> _addToCart() async {
    final token = widget.token;
    final product = _product;
    if (token == null || product == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login required')));
      return;
    }
    setState(() => _addingToCart = true);
    try {
      await _cartRepository.addItem(token: token, productId: product.id, quantity: _quantity);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${product.name} x$_quantity added to cart'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    } finally {
      if (mounted) setState(() => _addingToCart = false);
    }
  }

  Future<void> _loadWishlistState(int productId) async {
    final token = widget.token;
    if (token == null) {
      if (!mounted) return;
      setState(() => _wishlistSelected = false);
      return;
    }
    try {
      final inWishlist = await _wishlistRepository.check(token: token, productId: productId);
      if (!mounted) return;
      setState(() => _wishlistSelected = inWishlist);
    } catch (_) {
      // Keep silent; user can still use toggle with explicit feedback.
    }
  }

  Future<void> _toggleWishlist() async {
    final token = widget.token;
    final product = _product;
    if (product == null) return;
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login required'), behavior: SnackBarBehavior.floating),
      );
      return;
    }
    if (_wishlistLoading) return;

    final previous = _wishlistSelected;
    setState(() {
      _wishlistLoading = true;
      _wishlistSelected = !previous;
    });

    try {
      final added = await _wishlistRepository.toggle(token: token, productId: product.id);
      if (!mounted) return;
      setState(() => _wishlistSelected = added);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            added ? '${product.name} added to wishlist' : '${product.name} removed from wishlist',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _wishlistSelected = previous);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString()), behavior: SnackBarBehavior.floating),
      );
    } finally {
      if (mounted) setState(() => _wishlistLoading = false);
    }
  }

  void _share() {
    final product = _product;
    if (product == null) return;
    SharePlus.instance.share(ShareParams(text: 'Check out ${product.name} on AddMagPro! ₹${product.effectivePrice.toStringAsFixed(0)}'));
  }

  Future<void> _toggleWishlist() async {
    final token = widget.token;
    final product = _product;
    if (product == null || _wishlistBusy) return;
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login required to manage wishlist'), behavior: SnackBarBehavior.floating),
      );
      return;
    }

    final previous = _wishlisted;
    final optimistic = !previous;
    setState(() {
      _wishlistBusy = true;
      _wishlisted = optimistic;
    });

    try {
      final inWishlist = await _wishlistRepository.toggle(token: token, productId: product.id);
      if (!mounted) return;
      setState(() => _wishlisted = inWishlist);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(inWishlist ? '${product.name} added to wishlist' : '${product.name} removed from wishlist'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _wishlisted = previous);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString()), behavior: SnackBarBehavior.floating),
      );
    } finally {
      if (mounted) setState(() => _wishlistBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = _product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          if (product != null)
            IconButton(
              onPressed: _wishlistBusy ? null : _toggleWishlist,
              icon: Icon(_wishlisted ? Icons.favorite_rounded : Icons.favorite_border_rounded),
              color: _wishlisted ? AppColors.error : null,
            ),
          if (product != null) IconButton(onPressed: _share, icon: const Icon(Icons.share_rounded)),
        ],
      ),
      body: _loading
          ? _buildShimmer()
          : _error != null
              ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
                  const SizedBox(height: 12),
                  Text(_error!, style: const TextStyle(color: AppColors.textMuted), textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
                ]))
              : product == null
                  ? const EmptyState(icon: Icons.shopping_bag_outlined, title: 'Product not found')
                  : _buildContent(product),
      bottomNavigationBar: product != null && product.stock > 0
          ? Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 10, offset: const Offset(0, -2))],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _wishlistBusy ? null : _toggleWishlist,
                    icon: _wishlistBusy
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            _isWishlisted
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: _isWishlisted ? AppColors.error : AppColors.textSecondary,
                          ),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.surface,
                      minimumSize: const Size(52, 52),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Quantity selector
                  Container(
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                          icon: const Icon(Icons.remove_rounded, size: 20),
                          constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                        ),
                        SizedBox(width: 32, child: Center(child: Text('$_quantity', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)))),
                        IconButton(
                          onPressed: _quantity < product.stock ? () => setState(() => _quantity++) : null,
                          icon: const Icon(Icons.add_rounded, size: 20),
                          constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Add to Cart
                  Expanded(
                    child: FilledButton(
                      onPressed: _addingToCart ? null : _addToCart,
                      style: FilledButton.styleFrom(minimumSize: const Size(0, 52)),
                      child: _addingToCart
                          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Icon(Icons.shopping_cart_rounded, size: 20),
                              SizedBox(width: 8),
                              Text('Add to Cart'),
                            ]),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _buildContent(ProductDetail product) {
    final hasDiscount = product.price > product.effectivePrice;
    final computedDiscountPercent = hasDiscount
        ? (((product.price - product.effectivePrice) / product.price) * 100)
            .round()
        : 0;
    final discountPercent = product.discountPercent > 0
        ? product.discountPercent.round()
        : computedDiscountPercent;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // ── Image Carousel ──
        if (product.images.isNotEmpty)
          SizedBox(
            height: 320,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _imageController,
                  itemCount: product.images.length,
                  itemBuilder: (_, index) => CachedNetworkImage(
                    imageUrl: product.images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorWidget: (_, _, _) => Container(color: AppColors.surface, child: const Center(child: Icon(Icons.image_outlined, size: 48, color: AppColors.textMuted))),
                  ),
                ),
                if (product.images.length > 1)
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _imageController,
                        count: product.images.length,
                        effect: const WormEffect(dotWidth: 8, dotHeight: 8, activeDotColor: AppColors.primary, dotColor: Colors.white54),
                      ),
                    ),
                  ),
              ],
            ),
          )
        else
          Container(
            height: 220,
            color: AppColors.surface,
            child: const Center(child: Icon(Icons.image_not_supported_outlined, size: 48, color: AppColors.textMuted)),
          ),

        // ── Product Info ──
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary, height: 1.3)),
              const SizedBox(height: 12),
              // Price + Rating row
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('₹${product.effectivePrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.primary)),
                  if (hasDiscount) ...[
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '₹${product.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 15,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFECFDF3),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '$discountPercent% OFF',
                        style: const TextStyle(
                          color: AppColors.success,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (product.ratingAvg != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 18),
                          const SizedBox(width: 4),
                          Text(product.ratingAvg!.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.textPrimary)),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 14),
              // Stock badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: product.stock > 0 ? const Color(0xFFECFDF3) : const Color(0xFFFEF3F2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  product.stock > 0 ? '${product.stock} in stock' : 'Out of stock',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: product.stock > 0 ? AppColors.success : AppColors.error),
                ),
              ),
              const SizedBox(height: 20),
              // Description
              const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              Text(
                product.description?.trim().isNotEmpty == true ? product.description! : 'No description available.',
                style: const TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.6),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE5E7EB),
      highlightColor: const Color(0xFFF9FAFB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 300, color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 24, width: 250, color: Colors.white),
                const SizedBox(height: 12),
                Container(height: 28, width: 120, color: Colors.white),
                const SizedBox(height: 16),
                Container(height: 14, width: double.infinity, color: Colors.white),
                const SizedBox(height: 8),
                Container(height: 14, width: 200, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
