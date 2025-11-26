import 'package:flutter/material.dart';

IconData getIconFromString(String iconName) {
  final iconData = <String, IconData>{
    'delete_sweep': Icons.delete_sweep,
    'wallpaper': Icons.wallpaper,
    'code': Icons.code,
    'computer': Icons.computer,
    'download': Icons.download,
    'build': Icons.build,
    'cleaning_services': Icons.cleaning_services,
    'extension': Icons.extension,
    'sports_esports': Icons.sports_esports,
    'terminal': Icons.terminal,
    'stop': Icons.stop_circle_outlined,
    'rocket': Icons.rocket_launch,
    'shield': Icons.shield,
  };
  return iconData[iconName] ?? Icons.apps;
}
