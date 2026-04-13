import 'package:flutter/material.dart';

import '../../../core/widgets/app_widgets.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coupons')),
      body: const EmptyState(
        icon: Icons.local_offer_outlined,
        title: 'Coupons coming soon',
        subtitle: 'Your saved and eligible coupons will appear here.',
      ),
    );
  }
}
