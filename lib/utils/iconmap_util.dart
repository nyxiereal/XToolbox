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
    'browser': Icons.language,
    'p2p': Icons.share,
    'paint': Icons.format_paint,
    'malware': Icons.coronavirus_outlined,
    'fragment': Icons.view_module,
    'kit': Icons.medical_services,
    'linux': Icons.label_important,
    'windows': Icons.window,
    'power': Icons.power_outlined,
    'music': Icons.music_note,
    'game': Icons.gamepad,
    'box': Icons.check_box_outline_blank,
    'keys': Icons.vpn_key,
  };
  return iconData[iconName] ?? Icons.apps;
}
