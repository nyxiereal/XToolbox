import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/update_service.dart';
import '../services/network_checker_service.dart';
import '../services/settings_service.dart';
import '../widgets/system_info_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _appVersion;
  @override
  void initState() {
    super.initState();
    // perform quick checks when the screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initChecks();
    });
  }

  Future<void> _initChecks() async {
    final pkg = await PackageInfo.fromPlatform();
    if (!mounted) return;
    _appVersion = pkg.version;
    setState(() {});
    final settings = Provider.of<SettingsService>(context, listen: false);
    final update = Provider.of<UpdateService>(context, listen: false);
    // Only auto-check if the setting is enabled
    if (settings.autoUpdate) {
      update.checkForUpdate(
        owner: 'nyxiereal',
        repo: 'xtoolbox',
        currentVersion: _appVersion ?? '0.0.0',
      );
    }
    final net = Provider.of<NetworkCheckerService>(context, listen: false);
    net.checkHosts([
      'https://google.com',
      'https://github.com',
      'https://one.one.one.one',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome to XToolBox', style: textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text(
                        'A toolbox full of Windows utilities with handy tools and diagnostics.',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Chip(label: Text('v${_appVersion ?? '...'}')),
              ],
            ),
            const SizedBox(height: 20),

            // dashboard cards
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildUpdateCard(context),
                _buildPingCard(context),
                _buildSpecsCard(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateCard(BuildContext context) {
    return Consumer<UpdateService>(
      builder: (context, update, _) {
        final settings = Provider.of<SettingsService>(context);
        final subtitle = update.checking
            ? 'Checking for updates...'
            : (!settings.autoUpdate
                  ? 'Auto updates disabled'
                  : (update.info != null
                        ? (update.info!.updateAvailable
                              ? 'Update available: v${update.info!.latestVersion}'
                              : 'Up to date')
                        : (update.error != null
                              ? 'Error: ${update.error}'
                              : 'Idle')));

        return SizedBox(
          width: 360,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.system_update, size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Updates',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      if (update.checking) const SizedBox(width: 12),
                      if (update.checking)
                        const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(subtitle),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: update.checking
                            ? null
                            : () => update.checkForUpdate(
                                owner: 'nyxiereal',
                                repo: 'xtoolbox',
                                currentVersion: _appVersion ?? '0.0.0',
                                force: true,
                              ),
                        child: const Text('Check now'),
                      ),
                      const SizedBox(width: 8),
                      if (update.info?.updateAvailable ?? false)
                        TextButton(
                          onPressed: () async {
                            final uri = Uri.parse(
                              'https://github.com/nyxiereal/xtoolbox/releases/latest',
                            );
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          },
                          child: const Text('Open release'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPingCard(BuildContext context) {
    return Consumer<NetworkCheckerService>(
      builder: (context, net, _) {
        final items = net.results;
        return SizedBox(
          width: 360,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.cloud, size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Service reachability',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      if (net.checking) const SizedBox(width: 12),
                      if (net.checking)
                        const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (items.isEmpty) const Text('No results yet.'),
                  for (final r in items.values)
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        r.ok ? Icons.check_circle : Icons.cancel,
                        color: r.ok ? Colors.green : Colors.red,
                      ),
                      title: Text(r.host.replaceAll(RegExp(r'https?://'), '')),
                      trailing: r.ok ? Text('${r.ms} ms') : const Text('down'),
                      subtitle: r.error != null
                          ? Text(
                              r.error!,
                              style: const TextStyle(color: Colors.red),
                            )
                          : null,
                    ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: net.checking
                            ? null
                            : () => net.checkHosts([
                                'https://google.com',
                                'https://github.com',
                                'https://one.one.one.one',
                              ]),
                        child: const Text('Check now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpecsCard(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.devices, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'System specs',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.desktop_windows),
                title: Text('OS: ${Platform.operatingSystem}'),
                subtitle: Text(Platform.operatingSystemVersion),
              ),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.memory),
                title: Text('Processors: ${Platform.numberOfProcessors}'),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const SystemInfoModal(),
                  );
                },
                icon: const Icon(Icons.monitor_heart),
                label: const Text('View Details'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
