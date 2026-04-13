import 'package:flutter/material.dart';

import '../../../core/widgets/app_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const EmptyState(
        icon: Icons.settings_outlined,
        title: 'Settings coming soon',
        subtitle: 'Preference controls will appear here.',
      ),
    );
  }
}
