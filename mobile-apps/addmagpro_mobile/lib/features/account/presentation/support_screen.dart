import 'package:flutter/material.dart';

import '../../../core/widgets/app_widgets.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: const EmptyState(
        icon: Icons.support_agent_rounded,
        title: 'Support center coming soon',
        subtitle: 'FAQs, chat, and ticket support will be available here.',
      ),
    );
  }
}
