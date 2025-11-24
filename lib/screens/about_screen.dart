import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Icon(Icons.handyman, size: 80, color: colorScheme.primary),
            const SizedBox(height: 24),
            Text('XToolBox', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('r5.0.0', style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
