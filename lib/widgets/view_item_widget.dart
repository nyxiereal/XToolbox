import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/asset.dart';

class ViewItemWidget extends StatelessWidget {
  final Asset asset;

  const ViewItemWidget({super.key, required this.asset});

  static Future<void> show(BuildContext context, Asset asset) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) => ViewItemWidget(asset: asset),
    );
  }

  IconData getIconFromString(String iconName) {
    switch (iconName) {
      case 'delete_sweep':
        return Icons.delete_sweep;
      case 'wallpaper':
        return Icons.wallpaper;
      case 'code':
        return Icons.code;
      case 'computer':
        return Icons.computer;
      default:
        return Icons.apps;
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _handleInstall(
    BuildContext context,
    InstallMethod method,
  ) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    try {
      switch (method.type) {
        case InstallType.directDownload:
          if (method.url != null) {
            await _launchUrl(method.url!);
            scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text('Opening download link for ${asset.name}...'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
          break;
        case InstallType.winget:
          if (method.packageId != null) {
            scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text('Run: winget install ${method.packageId}'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 5),
                action: SnackBarAction(
                  label: 'Copy',
                  onPressed: () {
                    // TODO: Run the command directly in another window
                  },
                ),
              ),
            );
          }
          break;
        case InstallType.microsoftStore:
          if (method.storeId != null) {
            await _launchUrl(
              'ms-windows-store://pdp/?ProductId=${method.storeId}',
            );
          }
          break;
        case InstallType.chocolatey:
          if (method.packageId != null) {
            scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text('Run: choco install ${method.packageId}'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 5),
              ),
            );
          }
          break;
        case InstallType.scoop:
          if (method.packageId != null) {
            scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text('Run: scoop install ${method.packageId}'),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 5),
              ),
            );
          }
          break;
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800, maxHeight: 700),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.cardColor.withValues(alpha: 0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        asset.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.open_in_new),
                      tooltip: 'Open Homepage',
                      onPressed: () => _launchUrl(asset.homepage),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      tooltip: 'Close',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              // Body
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with icon and basic info
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: primaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              getIconFromString(asset.icon),
                              size: 48,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  asset.name,
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'by ${asset.author}',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: theme.textTheme.bodySmall?.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Description
                      Text(
                        'About',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(asset.description, style: theme.textTheme.bodyLarge),
                      const SizedBox(height: 32),

                      // Installation methods
                      Text(
                        'Installation Options',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...asset.installMethods.map(
                        (method) => _InstallMethodCard(
                          method: method,
                          onInstall: () => _handleInstall(context, method),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InstallMethodCard extends StatefulWidget {
  final InstallMethod method;
  final VoidCallback onInstall;

  const _InstallMethodCard({required this.method, required this.onInstall});

  @override
  State<_InstallMethodCard> createState() => _InstallMethodCardState();
}

class _InstallMethodCardState extends State<_InstallMethodCard> {
  bool _isHovered = false;

  IconData _getIconForType(InstallType type) {
    switch (type) {
      case InstallType.directDownload:
        return Icons.download;
      case InstallType.winget:
        return Icons.terminal;
      case InstallType.chocolatey:
        return Icons.terminal;
      case InstallType.scoop:
        return Icons.terminal;
      case InstallType.microsoftStore:
        return Icons.store;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isHovered
                ? primaryColor.withValues(alpha: 0.08)
                : theme.cardColor.withValues(alpha: 0.95),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            children: [
              Icon(
                _getIconForType(widget.method.type),
                size: 28,
                color: primaryColor,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.method.label,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.method.type.displayName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: widget.onInstall,
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Install'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
