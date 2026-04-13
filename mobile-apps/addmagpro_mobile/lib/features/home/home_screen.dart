import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../app_state.dart';
import '../../core/network/api_client.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_widgets.dart';
import '../account/presentation/account_screen.dart';
import '../catalog/presentation/categories_screen.dart';
import '../catalog/presentation/listing_detail_screen.dart';
import '../catalog/presentation/listing_list_screen.dart';
import '../catalog/presentation/product_detail_screen.dart';
import '../catalog/presentation/product_list_screen.dart';
import '../cart/presentation/cart_screen.dart';
import '../wishlist/presentation/wishlist_screen.dart';
import '../wallet/data/wallet_repository.dart';
import '../wallet/presentation/wallet_screen.dart';
import 'data/home_repository.dart';
import 'models/home_feed_models.dart';
import '../notifications/presentation/notifications_screen.dart';
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
    final token = widget.appState.token;
    if (token == null) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: widget.appState,
      builder: (_, __) {
        final user = widget.appState.currentUser;
        final pages = <Widget>[
          _DashboardView(appState: widget.appState, token: token),
          CategoriesScreen(token: token),
          CartScreen(token: token, appState: widget.appState),
          WishlistScreen(token: token),
          AccountScreen(appState: widget.appState),
        ];

        return Scaffold(
          appBar: _currentIndex == 0
              ? AppBar(
                  toolbarHeight: 76,
                  titleSpacing: 12,
                  title: _LocationSelector(locationLabel: _locationLabel(user?.city, user?.state)),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: ActionChip(
                        avatar: const Icon(Icons.account_balance_wallet_rounded, size: 18, color: AppColors.primary),
                        label: Text('₹${(user?.walletBalance ?? 0).toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary)),
                        backgroundColor: AppColors.primaryLight,
                        side: BorderSide(color: AppColors.primary.withAlpha(45)),
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => WalletScreen(token: token))),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => SearchScreen(token: token))),
                      icon: const Icon(Icons.search_rounded),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => NotificationsScreen(token: token))),
                      icon: const Icon(Icons.notifications_outlined),
                    ),
                  ],
                )
              : AppBar(title: Text(_titleForIndex(_currentIndex))),
          body: IndexedStack(index: _currentIndex, children: pages),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 10, offset: const Offset(0, -2))],
            ),
            child: NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) => setState(() => _currentIndex = index),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.category_outlined), selectedIcon: Icon(Icons.category_rounded), label: 'Categories'),
                NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), selectedIcon: Icon(Icons.shopping_bag_rounded), label: 'Cart'),
                NavigationDestination(icon: Icon(Icons.favorite_outline_rounded), selectedIcon: Icon(Icons.favorite_rounded), label: 'Wishlist'),
                NavigationDestination(icon: Icon(Icons.person_outline_rounded), selectedIcon: Icon(Icons.person_rounded), label: 'Account'),
              ],
            ),
          ),
        );
      },
    );
  }

  String _locationLabel(String? city, String? state) {
    if ((city ?? '').trim().isNotEmpty && (state ?? '').trim().isNotEmpty) {
      return '${city!.trim()}, ${state!.trim()}';
    }
    if ((city ?? '').trim().isNotEmpty) return city!.trim();
    if ((state ?? '').trim().isNotEmpty) return state!.trim();
    return 'Select location';
  }

  String _titleForIndex(int index) {
    switch (index) {
      case 1: return 'Categories';
      case 2: return 'My Cart';
      case 3: return 'Wishlist';
      case 4: return 'My Account';
      default: return 'AddMagPro';
    }
  }
}

// ── Dashboard View ──────────────────────────────────────────────────

class _DashboardView extends StatefulWidget {
  const _DashboardView({required this.appState, required this.token});
  final AppState appState;
  final String token;

  @override
  State<_DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<_DashboardView> {
  late final HomeRepository _repository;
  late final WalletRepository _walletRepository;
  final PageController _bannerController = PageController();
  Timer? _bannerTimer;
  bool _loading = true;
  String? _error;
  HomeFeed? _feed;

  @override
  void initState() {
    super.initState();
    _repository = HomeRepository(apiClient: ApiClient());
    _walletRepository = WalletRepository(apiClient: ApiClient());
    _load();
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final results = await Future.wait<dynamic>([
        _repository.fetch(city: widget.appState.currentUser?.city),
        widget.appState.refreshProfile(),
        _walletRepository.fetch(widget.token),
      ]);
      final response = results[0] as HomeFeed;
      final wallet = results[2];
      if (wallet != null && widget.appState.currentUser != null) {
        widget.appState.replaceCurrentUser(widget.appState.currentUser!.copyWith(walletBalance: wallet.balance));
      }
      if (!mounted) return;
      setState(() => _feed = response);
      _startBannerAutoScroll();
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _startBannerAutoScroll() {
    _bannerTimer?.cancel();
    final banners = _feed?.banners ?? [];
    if (banners.length <= 1) return;
    _bannerTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || !_bannerController.hasClients) return;
      final next = ((_bannerController.page?.round() ?? 0) + 1) % banners.length;
      _bannerController.animateToPage(next, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return _buildShimmer();

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off_rounded, size: 48, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text(_error!, style: const TextStyle(color: AppColors.textMuted), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
          ],
        ),
      );
    }

    final feed = _feed!;
    final user = widget.appState.currentUser;

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: _load,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ── Banner Carousel ──
          if (feed.banners.isNotEmpty) ...[
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _bannerController,
                    itemCount: feed.banners.length,
                    itemBuilder: (_, index) {
                      final banner = feed.banners[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black.withAlpha(15), blurRadius: 12, offset: const Offset(0, 4))],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              if (banner.imageUrl != null && banner.imageUrl!.isNotEmpty)
                                CachedNetworkImage(imageUrl: banner.imageUrl!, fit: BoxFit.cover, errorWidget: (_, _, _) => _bannerPlaceholder(banner))
                              else
                                _bannerPlaceholder(banner),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withAlpha(160)]),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (banner.title != null) Text(banner.title!, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
                                      if (banner.subtitle != null) Text(banner.subtitle!, style: TextStyle(color: Colors.white.withAlpha(200), fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  if (feed.banners.length > 1)
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _bannerController,
                          count: feed.banners.length,
                          effect: const WormEffect(dotWidth: 7, dotHeight: 7, activeDotColor: Colors.white, dotColor: Colors.white38, spacing: 6),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 8),

          // ── Welcome Card ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(40), blurRadius: 16, offset: const Offset(0, 6))],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, ${user?.name ?? 'Member'} 👋', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Text('Wallet: ₹${(user?.walletBalance ?? 0).toStringAsFixed(2)}', style: TextStyle(color: Colors.white.withAlpha(200), fontSize: 14)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(color: Colors.white.withAlpha(50), borderRadius: BorderRadius.circular(12)),
                    child: Text(user?.referralCode ?? '', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13, letterSpacing: 1)),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ── Categories ──
          if (feed.categories.isNotEmpty) ...[
            SectionHeader(title: 'Shop by Category', actionLabel: 'See All', onAction: () {}, padding: const EdgeInsets.symmetric(horizontal: 16)),
            const SizedBox(height: 14),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: feed.categories.length,
                separatorBuilder: (_, _) => const SizedBox(width: 14),
                itemBuilder: (_, index) {
                  final cat = feed.categories[index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => ProductListScreen(categorySlug: cat.slug, title: cat.name, token: widget.token))),
                    child: SizedBox(
                      width: 76,
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: AppColors.primary.withAlpha(30)),
                            ),
                            child: cat.imageUrl != null
                                ? ClipRRect(borderRadius: BorderRadius.circular(18), child: CachedNetworkImage(imageUrl: cat.imageUrl!, fit: BoxFit.cover, errorWidget: (_, _, _) => const Icon(Icons.category_rounded, color: AppColors.primary)))
                                : const Icon(Icons.category_rounded, color: AppColors.primary, size: 26),
                          ),
                          const SizedBox(height: 6),
                          Text(cat.name, maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],

          // ── Featured Products ──
          if (feed.featuredProducts.isNotEmpty) ...[
            SectionHeader(
              title: 'Featured Products',
              actionLabel: 'View All',
              onAction: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => ProductListScreen(title: 'Featured Products', token: widget.token))),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: feed.featuredProducts.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  final product = feed.featuredProducts[index];
                  return _FeaturedProductCard(product: product, token: widget.token);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],

          // ── Trending Products ──
          if (feed.trendingProducts.isNotEmpty) ...[
            SectionHeader(title: 'Trending Now 🔥', padding: const EdgeInsets.symmetric(horizontal: 16)),
            const SizedBox(height: 14),
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: feed.trendingProducts.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  final product = feed.trendingProducts[index];
                  return _FeaturedProductCard(product: product, token: widget.token);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],

          // ── Nearby Services ──
          if (feed.nearbyListings.isNotEmpty) ...[
            SectionHeader(
              title: 'Local Services',
              actionLabel: 'View All',
              onAction: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const ListingListScreen(title: 'Nearby Services'))),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const SizedBox(height: 12),
            ...feed.nearbyListings.take(5).map((listing) => _ServiceCard(listing: listing)),
            const SizedBox(height: 16),
          ],

          // ── Offers ──
          if (feed.offers.isNotEmpty) ...[
            SectionHeader(title: 'Deals & Offers', padding: const EdgeInsets.symmetric(horizontal: 16)),
            const SizedBox(height: 12),
            ...feed.offers.map((offer) => _OfferCard(offer: offer)),
            const SizedBox(height: 24),
          ],

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _bannerPlaceholder(HomeBannerItem banner) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Text(banner.title ?? 'AddMagPro', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE5E7EB),
      highlightColor: const Color(0xFFF9FAFB),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(height: 170, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20))),
          const SizedBox(height: 16),
          Container(height: 80, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20))),
          const SizedBox(height: 20),
          Container(height: 20, width: 140, color: Colors.white),
          const SizedBox(height: 14),
          Row(children: List.generate(4, (_) => Expanded(child: Container(height: 80, margin: const EdgeInsets.only(right: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)))))),
          const SizedBox(height: 20),
          Container(height: 20, width: 160, color: Colors.white),
          const SizedBox(height: 14),
          Row(children: List.generate(2, (_) => Expanded(child: Container(height: 200, margin: const EdgeInsets.only(right: 12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)))))),
        ],
      ),
    );
  }
}

class _LocationSelector extends StatelessWidget {
  const _LocationSelector({required this.locationLabel});

  final String locationLabel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location settings will be available soon.'), behavior: SnackBarBehavior.floating),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.location_on_rounded, color: AppColors.primary, size: 20),
          const SizedBox(width: 6),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Deliver to', style: TextStyle(fontSize: 11, color: AppColors.textSecondary.withAlpha(220))),
                Text(locationLabel, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(width: 2),
          const Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}

// ── Featured Product Card ────────────────────────────────────────────

class _FeaturedProductCard extends StatelessWidget {
  const _FeaturedProductCard({required this.product, this.token});
  final HomeProductItem product;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => ProductDetailScreen(slug: product.slug, token: token))),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border, width: 0.5),
          boxShadow: [BoxShadow(color: Colors.black.withAlpha(6), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: SizedBox(
                height: 130,
                width: double.infinity,
                child: product.primaryImageUrl != null
                    ? CachedNetworkImage(imageUrl: product.primaryImageUrl!, fit: BoxFit.cover, errorWidget: (_, _, _) => _imagePlaceholder())
                    : _imagePlaceholder(),
              ),
            ),
            // Info
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text('₹${product.effectivePrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.primary)),
                      const Spacer(),
                      if (product.ratingAvg != null) StarRating(rating: product.ratingAvg!, size: 11),
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

  Widget _imagePlaceholder() => Container(color: AppColors.borderLight, child: const Center(child: Icon(Icons.image_outlined, color: AppColors.textMuted, size: 32)));
}

// ── Service Card ─────────────────────────────────────────────────────

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.listing});
  final HomeListingItem listing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => ListingDetailScreen(slug: listing.slug))),
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border, width: 0.5),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.primaryLight),
              child: listing.primaryImageUrl != null
                  ? ClipRRect(borderRadius: BorderRadius.circular(14), child: CachedNetworkImage(imageUrl: listing.primaryImageUrl!, fit: BoxFit.cover, errorWidget: (_, _, _) => const Icon(Icons.storefront_rounded, color: AppColors.primary)))
                  : const Icon(Icons.storefront_rounded, color: AppColors.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listing.businessName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary)),
                  const SizedBox(height: 3),
                  Text('${listing.category ?? 'Service'} • ${listing.city ?? '-'}', style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
                ],
              ),
            ),
            if (listing.ratingAvg != null) StarRating(rating: listing.ratingAvg!, size: 12),
          ],
        ),
      ),
    );
  }
}

// ── Offer Card ──────────────────────────────────────────────────────

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.offer});
  final HomeOfferItem offer;

  @override
  Widget build(BuildContext context) {
    final valueLabel = offer.type == 'percentage' ? '${offer.value.toStringAsFixed(0)}% OFF' : '₹${offer.value.toStringAsFixed(0)} OFF';
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFF0FDF4), Color(0xFFECFDF3)]),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.success.withAlpha(30)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: AppColors.success, borderRadius: BorderRadius.circular(8)),
            child: Text(offer.code, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(offer.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary)),
                Text(valueLabel, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.success)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
