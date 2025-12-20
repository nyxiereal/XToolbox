import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import '../navigation.dart';

class StartupLoadingScreen extends StatefulWidget {
  const StartupLoadingScreen({super.key});

  @override
  State<StartupLoadingScreen> createState() => _StartupLoadingScreenState();
}

class _StartupLoadingScreenState extends State<StartupLoadingScreen> {
  bool _hasNetwork = false;
  bool _checking = true;
  String _statusMessage = 'Checking network connectivity...';
  Timer? _retryTimer;
  int _retryCount = 0;
  String _appVersion = '5.0.0';

  @override
  void initState() {
    super.initState();
    _loadVersion();
    _checkNetworkAndProceed();
  }

  Future<void> _loadVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      if (mounted) {
        setState(() {
          _appVersion = packageInfo.version;
        });
      }
    } catch (e) {
      // Keep default version
    }
  }

  @override
  void dispose() {
    _retryTimer?.cancel();
    super.dispose();
  }

  Future<void> _checkNetworkAndProceed() async {
    setState(() {
      _checking = true;
      _statusMessage = 'Checking network connectivity...';
    });

    final hasNetwork = await _verifyInternetConnection();

    if (hasNetwork) {
      setState(() {
        _hasNetwork = true;
        _statusMessage = 'Connected!';
      });

      // Small delay for smooth transition
      await Future.delayed(const Duration(milliseconds: 500));

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const NavigationPage()),
        );
      }
    } else {
      setState(() {
        _hasNetwork = false;
        _checking = false;
        _retryCount++;
        _statusMessage = 'No network connection detected';
      });

      // Retry every 3 seconds
      _retryTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) {
          _checkNetworkAndProceed();
        }
      });
    }
  }

  Future<bool> _verifyInternetConnection() async {
    try {
      // First check connectivity status
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      }

      // Actually verify we can reach the internet
      final response = await http
          .head(Uri.parse('https://one.one.one.one'))
          .timeout(const Duration(seconds: 5));

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo/Icon
            Icon(Icons.construction, size: 80, color: colorScheme.primary),
            const SizedBox(height: 24),

            // App Name
            Text(
              'XToolBox',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              'A toolbox full of Windows utilities',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 48),

            // Status Card
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_checking)
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: colorScheme.primary,
                        ),
                      )
                    else if (!_hasNetwork)
                      Icon(Icons.wifi_off, size: 40, color: colorScheme.error)
                    else
                      Icon(
                        Icons.check_circle,
                        size: 40,
                        color: colorScheme.primary,
                      ),
                    const SizedBox(height: 16),

                    Text(
                      _statusMessage,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),

                    if (!_hasNetwork && !_checking) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Retrying in 3 seconds... (Attempt $_retryCount)',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: _checkNetworkAndProceed,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry Now'),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 48),

            // Version info
            Text(
              'Version $_appVersion',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
