import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'navigation.dart';
import 'utils/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux) {
    await SystemTheme.accentColor.load();
  }
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            final lightTheme = themeProvider.generateLight(lightDynamic);
            final darkTheme = themeProvider.generateDark(darkDynamic);
            return MaterialApp(
              title: 'XToolBox',
              themeMode: themeProvider.themeMode,
              theme: lightTheme,
              darkTheme: darkTheme,
              home: const NavigationPage(),
            );
          },
        );
      },
    );
  }
}
