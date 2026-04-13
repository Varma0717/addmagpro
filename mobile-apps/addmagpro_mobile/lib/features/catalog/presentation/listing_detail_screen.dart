import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../data/catalog_repository.dart';
import '../models/catalog_models.dart';

class ListingDetailScreen extends StatefulWidget {
  const ListingDetailScreen({super.key, required this.slug});

  final String slug;

  @override
  State<ListingDetailScreen> createState() => _ListingDetailScreenState();
}

class _ListingDetailScreenState extends State<ListingDetailScreen> {
  late final CatalogRepository _repository;
  final PageController _imageController = PageController();
  bool _loading = true;
  String? _error;
  ListingDetail? _listing;

  @override
  void initState() {
    super.initState();
    _repository = CatalogRepository(apiClient: ApiClient());
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
      final data = await _repository.fetchListingDetail(widget.slug);
      if (!mounted) return;
      setState(() => _listing = data);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _share() {
    final listing = _listing;
    if (listing == null) return;
    SharePlus.instance.share(ShareParams(text: 'Check out ${listing.businessName} on AddMagPro!'));
  }

  @override
  Widget build(BuildContext context) {
    final listing = _listing;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Details'),
        actions: [
          if (listing != null) IconButton(onPressed: _share, icon: const Icon(Icons.share_rounded)),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : _error != null
              ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
                  const SizedBox(height: 12),
                  Text(_error!, style: const TextStyle(color: AppColors.error)),
                  const SizedBox(height: 12),
                  FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
                ]))
              : listing == null
                  ? const Center(child: Text('Listing not found'))
                  : RefreshIndicator(
                      color: AppColors.primary,
                      onRefresh: _load,
                      child: _buildContent(listing),
                    ),
    );
  }

  Widget _buildContent(ListingDetail listing) {
    return ListView(
      children: [
        // ── Image Gallery with indicator ──
        if (listing.images.isNotEmpty)
          SizedBox(
            height: 260,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _imageController,
                  itemCount: listing.images.length,
                  itemBuilder: (_, index) => CachedNetworkImage(
                    imageUrl: listing.images[index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => const Center(child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary)),
                    errorWidget: (_, _, _) => Container(
                      color: AppColors.surface,
                      child: const Center(child: Icon(Icons.broken_image_outlined, size: 48, color: AppColors.textMuted)),
                    ),
                  ),
                ),
                if (listing.images.length > 1)
                  Positioned(
                    bottom: 14,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Colors.black.withAlpha(40), borderRadius: BorderRadius.circular(20)),
                        child: SmoothPageIndicator(
                          controller: _imageController,
                          count: listing.images.length,
                          effect: const WormEffect(dotWidth: 8, dotHeight: 8, spacing: 6, activeDotColor: Colors.white, dotColor: Colors.white54),
                        ),
                      ),
                    ),
                  ),
                if (listing.images.length > 1)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: Colors.black.withAlpha(100), borderRadius: BorderRadius.circular(20)),
                      child: Text('${listing.images.length} photos', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                  ),
              ],
            ),
          )
        else
          Container(
            height: 180,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: AppColors.surface),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.storefront_outlined, size: 56, color: AppColors.textMuted),
                SizedBox(height: 8),
                Text('No photos yet', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
              ],
            ),
          ),

        // ── Business Info Card ──
        Container(
          transform: Matrix4.translationValues(0, -14, 0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Business name & rating
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(listing.businessName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    ),
                    if (listing.ratingAvg != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star_rounded, size: 18, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(listing.ratingAvg!.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),

                // Location row
                if ((listing.address ?? listing.city ?? '').isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_rounded, size: 20, color: AppColors.primary),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (listing.address != null && listing.address!.isNotEmpty)
                                Text(listing.address!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary)),
                              if (listing.city != null && listing.city!.isNotEmpty)
                                Text(listing.city!, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),

                // ── Contact Action Buttons ──
                if (_hasAnyContact(listing))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Get in Touch', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      const SizedBox(height: 12),
                      Row(children: [
                        if ((listing.phone ?? '').isNotEmpty)
                          Expanded(
                            child: _ContactButton(
                              icon: Icons.call_rounded,
                              label: 'Call',
                              color: AppColors.primary,
                              onTap: () => launchUrl(Uri.parse('tel:${listing.phone}'), mode: LaunchMode.externalApplication),
                            ),
                          ),
                        if ((listing.phone ?? '').isNotEmpty && ((listing.whatsapp ?? '').isNotEmpty || (listing.websiteUrl ?? '').isNotEmpty))
                          const SizedBox(width: 10),
                        if ((listing.whatsapp ?? '').isNotEmpty)
                          Expanded(
                            child: _ContactButton(
                              icon: Icons.chat_rounded,
                              label: 'WhatsApp',
                              color: const Color(0xFF25D366),
                              onTap: () => launchUrl(Uri.parse('https://wa.me/${listing.whatsapp}'), mode: LaunchMode.externalApplication),
                            ),
                          ),
                        if ((listing.whatsapp ?? '').isNotEmpty && (listing.websiteUrl ?? '').isNotEmpty)
                          const SizedBox(width: 10),
                        if ((listing.websiteUrl ?? '').isNotEmpty)
                          Expanded(
                            child: _ContactButton(
                              icon: Icons.language_rounded,
                              label: 'Website',
                              color: AppColors.info,
                              onTap: () => launchUrl(Uri.parse(listing.websiteUrl!), mode: LaunchMode.externalApplication),
                            ),
                          ),
                      ]),
                      const SizedBox(height: 16),
                    ],
                  ),

                const Divider(height: 1, color: AppColors.borderLight),
                const SizedBox(height: 16),

                // ── About Section ──
                const Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                const SizedBox(height: 10),
                Text(
                  listing.description?.trim().isNotEmpty == true ? listing.description! : 'No description available for this service.',
                  style: const TextStyle(color: AppColors.textSecondary, height: 1.6, fontSize: 14),
                ),
                const SizedBox(height: 20),

                // ── Contact Details Section ──
                if (_hasAnyContact(listing)) ...[
                  const Divider(height: 1, color: AppColors.borderLight),
                  const SizedBox(height: 16),
                  const Text('Contact Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                  const SizedBox(height: 12),
                  if ((listing.phone ?? '').isNotEmpty)
                    _DetailRow(icon: Icons.phone_outlined, label: 'Phone', value: listing.phone!),
                  if ((listing.whatsapp ?? '').isNotEmpty)
                    _DetailRow(icon: Icons.chat_outlined, label: 'WhatsApp', value: listing.whatsapp!),
                  if ((listing.websiteUrl ?? '').isNotEmpty)
                    _DetailRow(icon: Icons.language_outlined, label: 'Website', value: listing.websiteUrl!),
                  const SizedBox(height: 16),
                ],

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool _hasAnyContact(ListingDetail listing) {
    return (listing.phone ?? '').isNotEmpty || (listing.whatsapp ?? '').isNotEmpty || (listing.websiteUrl ?? '').isNotEmpty;
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({required this.icon, required this.label, required this.color, required this.onTap});

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(0, 48),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: 10),
          Text('$label: ', style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
          Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary))),
        ],
      ),
    );
  }
}
