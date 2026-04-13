import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../core/network/api_client.dart';
import '../account/presentation/account_screen.dart';
import '../catalog/presentation/categories_screen.dart';
import '../catalog/presentation/listing_detail_screen.dart';
import '../catalog/presentation/listing_list_screen.dart';
import '../catalog/presentation/product_detail_screen.dart';
import '../catalog/presentation/product_list_screen.dart';
import '../cart/presentation/cart_screen.dart';
import '../wishlist/presentation/wishlist_screen.dart';
import 'data/home_repository.dart';
import 'models/home_feed_models.dart';
import '../notifications/presentation/notifications_screen.dart';
import '../orders/presentation/orders_screen.dart';
import '../search/presentation/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.appState});

  final AppState appState;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = widget.appState.currentUser;
    final token = widget.appState.token;

    if (token == null) {
      return const SizedBox.shrink();
    }

    final pages = <Widget>[
      _DashboardView(appState: widget.appState, token: token),
      CategoriesScreen(token: token),
      CartScreen(token: token, appState: widget.appState),
      WishlistScreen(token: token),
      AccountScreen(appState: widget.appState),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titleForIndex(_currentIndex)),
        actions: _actionsForIndex(_currentIndex, token),
      ),
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.space_dashboard_outlined), selectedIcon: Icon(Icons.space_dashboard), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.category_outlined), selectedIcon: Icon(Icons.category), label: 'Categories'),
          NavigationDestination(icon: Icon(Icons.shopping_cart_outlined), selectedIcon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.favorite_outline), selectedIcon: Icon(Icons.favorite), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }

  String _titleForIndex(int index) {
    switch (index) {
      case 1:
        return 'Categories';
      case 2:
        return 'My Cart';
      case 3:
        return 'Wishlist';
      case 4:
        return 'My Account';
      default:
        return 'AddMagPro';
    }
  }

  List<Widget>? _actionsForIndex(int index, String token) {
    if (index == 0) {
      return <Widget>[
        IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => SearchScreen(token: token)),
          ),
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => NotificationsScreen(token: token)),
          ),
          icon: const Icon(Icons.notifications_none),
        ),
      ];
    }
    return null;
  }
}

class _DashboardView extends StatefulWidget {
  const _DashboardView({required this.appState, required this.token});

  final AppState appState;
  final String token;

  @override
  State<_DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<_DashboardView> {
  late final HomeRepository _repository;
  bool _loading = true;
  String? _error;
  HomeFeed? _feed;

  @override
  void initState() {
    super.initState();
    _repository = HomeRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final response = await _repository.fetch();
      if (!mounted) return;
      setState(() => _feed = response);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.appState.currentUser;
    final feed = _feed;

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFFF7F11),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello ${user?.name ?? 'Member'}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Referral code: ${user?.referralCode ?? '-'}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  'Wallet balance: ₹${(user?.walletBalance ?? 0).toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (_loading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: CircularProgressIndicator()),
            ),
          if (_error != null)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFEE4E2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _error!,
                style: const TextStyle(color: Color(0xFFB42318)),
              ),
            ),
          if (feed != null) ...<Widget>[
            _SectionHeader(
              title: 'Categories',
              subtitle: '${feed.categories.length} top categories',
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: feed.categories
                  .map(
                    (category) => _CategoryChip(
                      label: category.name,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => ProductListScreen(
                              categorySlug: category.slug,
                              title: category.name,
                              token: widget.token,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(growable: false),
            ),
            const SizedBox(height: 20),
            _SectionHeader(
              title: 'Featured products',
              subtitle: '${feed.featuredProducts.length} picks',
              actionLabel: 'View all',
              onActionTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ProductListScreen(
                      title: 'Featured products',
                      token: widget.token,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 122,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: feed.featuredProducts.length,
                separatorBuilder: (_, _) => const SizedBox(width: 10),
                itemBuilder: (_, index) {
                  final product = feed.featuredProducts[index];
                  return _ProductCard(
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
            const SizedBox(height: 20),
            _SectionHeader(
              title: 'Nearby services',
              subtitle: '${feed.nearbyListings.length} listings',
              actionLabel: 'View all',
              onActionTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const ListingListScreen(title: 'Nearby services'),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ...feed.nearbyListings
                .take(5)
                .map(
                  (listing) => _ListingTile(
                    listing: listing,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ListingDetailScreen(slug: listing.slug),
                        ),
                      );
                    },
                  ),
                ),
            const SizedBox(height: 20),
            _SectionHeader(
              title: 'Coupons & offers',
              subtitle: '${feed.offers.length} active offers',
            ),
            const SizedBox(height: 10),
            ...feed.offers.map((offer) => _OfferTile(offer: offer)),
          ],
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onActionTap,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        if (actionLabel != null && onActionTap != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: onActionTap,
              child: Text(
                actionLabel!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFC2410C),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E8),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF9A3412)),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product, required this.onTap});

  final HomeProductItem product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 210,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _RectNetworkImage(url: product.primaryImageUrl),
            const SizedBox(height: 10),
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(
              '₹${product.effectivePrice.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFFB54708)),
            ),
            if (product.ratingAvg != null)
              Text('⭐ ${product.ratingAvg!.toStringAsFixed(1)}', style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _ListingTile extends StatelessWidget {
  const _ListingTile({required this.listing, required this.onTap});

  final HomeListingItem listing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: <Widget>[
            _CircleNetworkImage(url: listing.primaryImageUrl),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(listing.businessName, style: const TextStyle(fontWeight: FontWeight.w700)),
                  Text(
                    '${listing.category ?? 'Service'} • ${listing.city ?? '-'}',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                  ),
                ],
              ),
            ),
            if (listing.ratingAvg != null)
              Text('⭐ ${listing.ratingAvg!.toStringAsFixed(1)}', style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _RectNetworkImage extends StatelessWidget {
  const _RectNetworkImage({required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final imageUrl = url?.trim();
    if (imageUrl == null || imageUrl.isEmpty) {
      return Container(
        width: double.infinity,
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.image_outlined, color: Color(0xFF9CA3AF)),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 56,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            width: double.infinity,
            height: 56,
            alignment: Alignment.center,
            color: const Color(0xFFF3F4F6),
            child: const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: 56,
            alignment: Alignment.center,
            color: const Color(0xFFF3F4F6),
            child: const Icon(Icons.broken_image_outlined, color: Color(0xFF9CA3AF)),
          );
        },
      ),
    );
  }
}

class _CircleNetworkImage extends StatelessWidget {
  const _CircleNetworkImage({required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final imageUrl = url?.trim();
    if (imageUrl == null || imageUrl.isEmpty) {
      return const CircleAvatar(
        backgroundColor: Color(0xFFFFEDD5),
        child: Icon(Icons.storefront_outlined, color: Color(0xFFC2410C)),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: Image.network(
        imageUrl,
        width: 40,
        height: 40,
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

class _OfferTile extends StatelessWidget {
  const _OfferTile({required this.offer});

  final HomeOfferItem offer;

  @override
  Widget build(BuildContext context) {
    final valueLabel = offer.type == 'percentage'
        ? '${offer.value.toStringAsFixed(0)}% OFF'
        : '₹${offer.value.toStringAsFixed(0)} OFF';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFECFDF3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF067647),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              offer.code,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '${offer.name} • $valueLabel',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
