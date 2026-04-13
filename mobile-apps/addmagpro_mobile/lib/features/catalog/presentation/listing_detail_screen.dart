import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  bool _loading = true;
  String? _error;
  ListingDetail? _listing;

  @override
  void initState() {
    super.initState();
    _repository = CatalogRepository(apiClient: ApiClient());
    _load();
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

  @override
  Widget build(BuildContext context) {
    final listing = _listing;

    return Scaffold(
      appBar: AppBar(title: const Text('Service Details')),
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
                  : ListView(
                      children: [
                        // Image gallery
                        if (listing.images.isNotEmpty)
                          SizedBox(
                            height: 220,
                            child: PageView.builder(
                              itemCount: listing.images.length,
                              itemBuilder: (_, index) => CachedNetworkImage(
                                imageUrl: listing.images[index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorWidget: (_, __, ___) => Container(
                                  color: AppColors.surface,
                                  child: const Center(child: Icon(Icons.broken_image_outlined, size: 48, color: AppColors.textMuted)),
                                ),
                              ),
                            ),
                          )
                        else
                          Container(
                            height: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.surface),
                            child: const Icon(Icons.storefront_outlined, size: 64, color: AppColors.textMuted),
                          ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Business name & rating
                              Text(listing.businessName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                              const SizedBox(height: 8),
                              Row(children: [
                                const Icon(Icons.location_on_outlined, size: 16, color: AppColors.textSecondary),
                                const SizedBox(width: 4),
                                Expanded(child: Text('${listing.city ?? '-'} • ${listing.address ?? '-'}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 13))),
                                if (listing.ratingAvg != null) ...[
                                  const Icon(Icons.star_rounded, size: 18, color: Colors.amber),
                                  const SizedBox(width: 2),
                                  Text(listing.ratingAvg!.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                                ],
                              ]),
                              const SizedBox(height: 20),

                              // Contact action buttons
                              if ((listing.phone ?? '').isNotEmpty || (listing.whatsapp ?? '').isNotEmpty || (listing.websiteUrl ?? '').isNotEmpty)
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
                                        color: AppColors.success,
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
                              if ((listing.phone ?? '').isNotEmpty || (listing.whatsapp ?? '').isNotEmpty || (listing.websiteUrl ?? '').isNotEmpty)
                                const SizedBox(height: 20),

                              // Description
                              const Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                              const SizedBox(height: 8),
                              Text(
                                listing.description?.trim().isNotEmpty == true ? listing.description! : 'No description available.',
                                style: const TextStyle(color: AppColors.textSecondary, height: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
    );
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
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color.withAlpha(60)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(0, 44),
      ),
    );
  }
}
