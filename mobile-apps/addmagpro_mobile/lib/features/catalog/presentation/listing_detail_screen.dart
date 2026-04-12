import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
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
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final data = await _repository.fetchListingDetail(widget.slug);
      if (!mounted) return;
      setState(() => _listing = data);
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
    final listing = _listing;

    return Scaffold(
      appBar: AppBar(title: const Text('Service details')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : listing == null
                  ? const Center(child: Text('Listing not found'))
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: <Widget>[
                        Text(listing.businessName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text('${listing.city ?? '-'} • ${listing.address ?? '-'}'),
                        if (listing.ratingAvg != null) ...<Widget>[
                          const SizedBox(height: 6),
                          Text('⭐ ${listing.ratingAvg!.toStringAsFixed(1)}'),
                        ],
                        const SizedBox(height: 12),
                        if (listing.images.isNotEmpty)
                          SizedBox(
                            height: 200,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: listing.images.length,
                              separatorBuilder: (_, _) => const SizedBox(width: 10),
                              itemBuilder: (_, index) => ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  listing.images[index],
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
                              ),
                            ),
                          ),
                        if (listing.images.isEmpty)
                          Container(
                            height: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.image_not_supported_outlined),
                          ),
                        const SizedBox(height: 12),
                        Text(listing.description?.trim().isNotEmpty == true ? listing.description! : 'No description available.'),
                        const SizedBox(height: 12),
                        if ((listing.phone ?? '').isNotEmpty) Text('Phone: ${listing.phone}'),
                        if ((listing.whatsapp ?? '').isNotEmpty) Text('WhatsApp: ${listing.whatsapp}'),
                        if ((listing.websiteUrl ?? '').isNotEmpty) Text('Website: ${listing.websiteUrl}'),
                      ],
                    ),
    );
  }
}
