import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      if (!mounted) return;
      setState(() { _product = data; _loading = false; });
      _initializeWishlistState(data.id);
    } catch (error) {
      if (!mounted) return;
      setState(() { _error = error.toString(); _loading = false; });
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
                            _wishlisted
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: _wishlisted ? AppColors.error : AppColors.textSecondary,
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
          Container(
            color: AppColors.surface,
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _imageController,
                    itemCount: product.images.length,
                    itemBuilder: (_, index) => CachedNetworkImage(
                      imageUrl: product.images[index],
                      fit: BoxFit.contain,
                      width: double.infinity,
                      placeholder: (_, _) => const Center(child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary)),
                      errorWidget: (_, _, _) => Container(color: AppColors.surface, child: const Center(child: Icon(Icons.image_outlined, size: 48, color: AppColors.textMuted))),
                    ),
                  ),
                  if (product.images.length > 1)
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(color: Colors.black.withAlpha(40), borderRadius: BorderRadius.circular(20)),
                          child: SmoothPageIndicator(
                            controller: _imageController,
                            count: product.images.length,
                            effect: const WormEffect(dotWidth: 8, dotHeight: 8, spacing: 6, activeDotColor: Colors.white, dotColor: Colors.white54),
                          ),
                        ),
                      ),
                    ),
                  // Image counter
                  if (product.images.length > 1)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: Colors.black.withAlpha(100), borderRadius: BorderRadius.circular(20)),
                        child: Text('${product.images.length} photos', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  // Discount badge
                  if (hasDiscount)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: AppColors.error, borderRadius: BorderRadius.circular(8)),
                        child: Text('$discountPercent% OFF', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
                      ),
                    ),
                ],
              ),
            ),
          )
        else
          Container(
            height: 220,
            color: AppColors.surface,
            child: const Center(child: Icon(Icons.image_not_supported_outlined, size: 48, color: AppColors.textMuted)),
          ),

        // ── Product Info Card ──
        Container(
          transform: Matrix4.translationValues(0, -16, 0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary, height: 1.3)),
                const SizedBox(height: 12),

                // Price row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('₹${product.effectivePrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.primary)),
                    if (hasDiscount) ...[
                      const SizedBox(width: 10),
                      Text(
                        '₹${product.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFECFDF3),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Save ₹${(product.price - product.effectivePrice).toStringAsFixed(0)}',
                          style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.w700, fontSize: 11),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 14),

                // Rating + Stock row
                Row(
                  children: [
                    if (product.ratingAvg != null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 16),
                            const SizedBox(width: 4),
                            Text(product.ratingAvg!.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.textPrimary)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: product.stock > 0 ? const Color(0xFFECFDF3) : const Color(0xFFFEF3F2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            product.stock > 0 ? Icons.check_circle_rounded : Icons.cancel_rounded,
                            size: 14,
                            color: product.stock > 0 ? AppColors.success : AppColors.error,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            product.stock > 0 ? '${product.stock} in stock' : 'Out of stock',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: product.stock > 0 ? AppColors.success : AppColors.error),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Divider
                const Divider(height: 1, color: AppColors.borderLight),
                const SizedBox(height: 20),

                // Description
                const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                const SizedBox(height: 10),
                Text(
                  product.description?.trim().isNotEmpty == true ? product.description! : 'No description available.',
                  style: const TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.7),
                ),

                // Specifications Accordion
                if (product.shortDescription != null && product.shortDescription!.trim().isNotEmpty) ...[
                  const SizedBox(height: 20),
                  const Divider(height: 1, color: AppColors.borderLight),
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: const EdgeInsets.only(bottom: 16),
                      title: const Text('Specifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      initiallyExpanded: true,
                      children: [
                        Text(product.shortDescription!, style: const TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.7)),
                      ],
                    ),
                  ),
                ],

                // Category
                if (product.category != null) ...[
                  const Divider(height: 1, color: AppColors.borderLight),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      children: [
                        const Icon(Icons.category_outlined, size: 18, color: AppColors.textMuted),
                        const SizedBox(width: 8),
                        Text('Category: ', style: const TextStyle(fontSize: 13, color: AppColors.textMuted)),
                        Text(product.category!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                      ],
                    ),
                  ),
                ],

                // Reviews Section
                if (product.reviews.isNotEmpty) ...[
                  const Divider(height: 1, color: AppColors.borderLight),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text('Reviews', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(10)),
                        child: Text('${product.reviews.length}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...product.reviews.take(5).map((review) => _ReviewCard(review: review)),
                ],

                const SizedBox(height: 80),
              ],
            ),
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

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});
  final ProductReview review;

  @override
  Widget build(BuildContext context) {
    final date = review.createdAt != null ? DateTime.tryParse(review.createdAt!) : null;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle),
                child: Center(child: Text(
                  (review.userName ?? '?')[0].toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary, fontSize: 14),
                )),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.userName ?? 'Anonymous', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary)),
                    if (date != null)
                      Text(DateFormat('dd MMM yyyy').format(date), style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (i) => Icon(
                  i < review.rating ? Icons.star_rounded : Icons.star_border_rounded,
                  size: 16,
                  color: i < review.rating ? const Color(0xFFF59E0B) : AppColors.borderLight,
                )),
              ),
            ],
          ),
          if (review.comment != null && review.comment!.trim().isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(review.comment!, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.6)),
          ],
        ],
      ),
    );
  }
}
