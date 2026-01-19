import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'navigation.dart';
import 'utils/theme_provider.dart';
import 'provider/asset_provider.dart';
import 'services/toast_notification_service.dart';
import 'services/download_service.dart';
import 'services/install_handler_service.dart';
import 'services/playbook_service.dart';
import 'services/update_service.dart';
import 'services/network_checker_service.dart';
import 'services/settings_service.dart';
import 'widgets/toast_overlay_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux) {
    await SystemTheme.accentColor.load();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SettingsService()),
        ChangeNotifierProvider(create: (_) => AssetProvider()),
        ChangeNotifierProvider(create: (_) => ToastNotificationService()),
        ProxyProvider<ToastNotificationService, DownloadService>(
          update: (_, toastService, _) => DownloadService(toastService),
        ),
        ProxyProvider2<
          ToastNotificationService,
          DownloadService,
          InstallHandlerService
        >(
          update: (_, toastService, downloadService, _) =>
              InstallHandlerService(toastService, downloadService),
        ),
        ChangeNotifierProxyProvider<ToastNotificationService, PlaybookService>(
          create: (context) => PlaybookService(
            Provider.of<ToastNotificationService>(context, listen: false),
          ),
          update: (_, toastService, previous) =>
              previous ?? PlaybookService(toastService),
        ),
        ChangeNotifierProvider(create: (_) => UpdateService()),
        ChangeNotifierProvider(create: (_) => NetworkCheckerService()),
      ],
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
              builder: (context, child) {
                return ToastOverlay(child: child ?? const SizedBox());
              },
            );
          },
        );
      },
    );
  }
}
