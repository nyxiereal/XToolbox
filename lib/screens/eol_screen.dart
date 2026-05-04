import 'package:flutter/material.dart';

class EolScreen extends StatelessWidget {
  final VoidCallback onContinue;

  const EolScreen({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.sentiment_dissatisfied_outlined,
                  size: 64,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  'All good things must come to an end',
                  style: textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'XToolBox has reached the end of its journey.',
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why?',
                          style: textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'I am the only developer behind this project. A few years ago, I switched to Linux full-time. I no longer use Windows, and I have no desire to maintain an application for a platform I do not use.\n\n'
                          'The source code will remain available, but there will be no further updates, bug fixes, or support.',
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                FilledButton.icon(
                  onPressed: onContinue,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Continue to the app'),
                ),
                const SizedBox(height: 12),
                Text(
                  'The app will continue to work, but use it at your own risk.',
                  style: textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
