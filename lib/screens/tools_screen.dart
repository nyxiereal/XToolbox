import 'package:flutter/material.dart';
import 'package:xtoolbox/widgets/item_card_widget.dart';
import 'package:xtoolbox/widgets/item_title_widget.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tools')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ToolSectionTitle('Developer Tools'),
          ToolCard(title: 'Tool', description: 'Description', icon: Icons.code),
          ToolCard(title: 'Tool', description: 'Description', icon: Icons.code),
          ToolCard(title: 'Tool', description: 'Description', icon: Icons.code),
          ToolSectionTitle('whatever'),
          ToolCard(title: 'Tool', description: 'Description', icon: Icons.code),
          ToolCard(title: 'Tool', description: 'Description', icon: Icons.code),
        ],
      ),
    );
  }
}
