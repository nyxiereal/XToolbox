import 'package:flutter/material.dart';
import 'package:xtoolbox/widgets/item_card_widget.dart';

class UtilitiesScreen extends StatelessWidget {
  const UtilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Utilities')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _UtilitiesSectionTitle('System Utilities'),
          SizedBox(height: 12),
          ToolCard(
            title: 'Utility',
            description: 'Description',
            icon: Icons.computer,
          ),
          ToolCard(
            title: 'Utility',
            description: 'Description',
            icon: Icons.computer,
          ),
          ToolCard(
            title: 'Utility',
            description: 'Description',
            icon: Icons.computer,
          ),
          ToolCard(
            title: 'Utility',
            description: 'Description',
            icon: Icons.computer,
          ),
          ToolCard(
            title: 'Utility',
            description: 'Description',
            icon: Icons.computer,
          ),
          ToolCard(
            title: 'Utility',
            description: 'Description',
            icon: Icons.computer,
          ),
          ToolCard(
            title: 'Utility',
            description: 'Description',
            icon: Icons.computer,
          ),
        ],
      ),
    );
  }
}

class _UtilitiesSectionTitle extends StatelessWidget {
  final String title;
  const _UtilitiesSectionTitle(this.title);
  @override
  Widget build(BuildContext context) =>
      Text(title, style: Theme.of(context).textTheme.titleMedium);
}
