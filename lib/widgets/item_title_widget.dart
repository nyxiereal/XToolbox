import 'package:flutter/material.dart';

class ToolSectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const ToolSectionTitle(this.title, {this.icon = Icons.code});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 12),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
