import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to XToolBox', style: textTheme.titleLarge),
            const SizedBox(height: 16),
            Text(
              'A toolbox full of Windows 10/11 utilities.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'I should probably do something more interesting here...',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
