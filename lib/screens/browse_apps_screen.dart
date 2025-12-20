import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtoolbox/provider/asset_provider.dart';
import 'package:xtoolbox/utils/iconmap_util.dart';
import 'package:xtoolbox/widgets/view_item_widget.dart';
import 'package:xtoolbox/services/install_handler_service.dart';
import 'package:xtoolbox/services/settings_service.dart';
import 'package:xtoolbox/models/asset.dart';

class BrowseAppsScreen extends StatefulWidget {
  const BrowseAppsScreen({super.key});

  @override
  State<BrowseAppsScreen> createState() => _BrowseAppsScreenState();
}

class _BrowseAppsScreenState extends State<BrowseAppsScreen> {
  String _selectedCategory = 'all';
  String _searchQuery = '';
  bool _selectionMode = false;
  final Set<String> _selectedAssets = {};
  bool _isInstalling = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AssetProvider>().loadAssets();
    });
  }

  List<String> _getAvailableCategories(List<dynamic> assets) {
    final categories = assets
        .map((asset) => asset.category as String)
        .toSet()
        .toList();
    categories.sort();
    return ['all', ...categories];
  }

  String _getCategoryDisplayName(String category) {
    return category
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  void _enterSelectionMode(String assetId) {
    setState(() {
      _selectionMode = true;
      _selectedAssets.add(assetId);
    });
  }

  void _exitSelectionMode() {
    setState(() {
      _selectionMode = false;
      _selectedAssets.clear();
    });
  }

  void _toggleSelection(String assetId) {
    setState(() {
      if (_selectedAssets.contains(assetId)) {
        _selectedAssets.remove(assetId);
        if (_selectedAssets.isEmpty) {
          _selectionMode = false;
        }
      } else {
        _selectedAssets.add(assetId);
      }
    });
  }

  InstallMethod? _getBestInstallMethod(Asset asset, List<String> preferences) {
    // Try to find install method based on preference order
    for (final pref in preferences) {
      for (final method in asset.installMethods) {
        final typeString = method.type.name
            .replaceAllMapped(
              RegExp(r'[A-Z]'),
              (match) => '_${match.group(0)!.toLowerCase()}',
            )
            .substring(1); // Remove leading underscore
        if (typeString == pref) {
          return method;
        }
      }
    }
    // Fallback to first available method
    return asset.installMethods.isNotEmpty ? asset.installMethods.first : null;
  }

  Future<void> _showBulkInstallDialog(List<Asset> selectedAssets) async {
    final settingsService = context.read<SettingsService>();
    final preferences = settingsService.installPreference;

    // Prepare install plan
    final installPlan = <Map<String, dynamic>>[];
    for (final asset in selectedAssets) {
      final method = _getBestInstallMethod(asset, preferences);
      if (method != null) {
        installPlan.add({'asset': asset, 'method': method});
      }
    }

    if (installPlan.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No valid install methods found for selected apps'),
          ),
        );
      }
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Install ${installPlan.length} Apps'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'The following apps will be installed:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...installPlan.map((plan) {
                final asset = plan['asset'] as Asset;
                final method = plan['method'] as InstallMethod;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        getIconFromString(asset.icon),
                        size: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              asset.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'via ${method.type.displayName}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Install All'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      _performBulkInstall(installPlan);
    }
  }

  Future<void> _performBulkInstall(
    List<Map<String, dynamic>> installPlan,
  ) async {
    setState(() {
      _isInstalling = true;
    });

    _exitSelectionMode();

    final installHandler = context.read<InstallHandlerService>();
    int successCount = 0;
    int failedCount = 0;

    for (final plan in installPlan) {
      final asset = plan['asset'] as Asset;
      final method = plan['method'] as InstallMethod;

      final result = await installHandler.handleInstall(
        method: method,
        appName: asset.name,
      );

      if (result == InstallResult.success) {
        successCount++;
      } else {
        failedCount++;
      }
    }

    setState(() {
      _isInstalling = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Installation complete: $successCount succeeded, $failedCount failed',
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectionMode
            ? Theme.of(context).colorScheme.primaryContainer
            : null,
        leading: _selectionMode
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: _exitSelectionMode,
              )
            : null,
        title: _selectionMode
            ? Text('${_selectedAssets.length} selected')
            : const Text('Browse Packages'),
        actions: _selectionMode
            ? [
                IconButton(
                  icon: const Icon(Icons.download),
                  tooltip: 'Install Selected',
                  onPressed: _isInstalling
                      ? null
                      : () {
                          final assetProvider = context.read<AssetProvider>();
                          final selectedAssetsList = assetProvider.assets
                              .where((a) => _selectedAssets.contains(a.id))
                              .toList();
                          _showBulkInstallDialog(selectedAssetsList);
                        },
                ),
              ]
            : null,
        bottom: _selectionMode
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search packages...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                    ),
                    onChanged: (value) =>
                        setState(() => _searchQuery = value.toLowerCase()),
                  ),
                ),
              ),
      ),
      body: Consumer<AssetProvider>(
        builder: (context, assetProvider, child) {
          if (assetProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (assetProvider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    assetProvider.error!,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => assetProvider.loadAssets(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final allAssets = assetProvider.assets;
          final categories = _getAvailableCategories(allAssets);

          // Filter assets by category and search query
          var filteredAssets = _selectedCategory == 'all'
              ? allAssets
              : assetProvider.getAssetsByCategory(_selectedCategory);

          if (_searchQuery.isNotEmpty) {
            filteredAssets = filteredAssets.where((asset) {
              return asset.name.toLowerCase().contains(_searchQuery) ||
                  asset.description.toLowerCase().contains(_searchQuery);
            }).toList();
          }

          return Row(
            children: [
              // Category sidebar
              Container(
                width: 240,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1,
                    ),
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Categories',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...categories.map((category) {
                      final isSelected = _selectedCategory == category;
                      final count = category == 'all'
                          ? allAssets.length
                          : assetProvider.getAssetsByCategory(category).length;

                      return ListTile(
                        selected: isSelected,
                        leading: Icon(
                          isSelected ? Icons.folder : Icons.folder_outlined,
                        ),
                        title: Text(_getCategoryDisplayName(category)),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            count.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        onTap: () =>
                            setState(() => _selectedCategory = category),
                      );
                    }),
                  ],
                ),
              ),
              // Main content area
              Expanded(
                child: filteredAssets.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _searchQuery.isEmpty
                                  ? 'No packages in this category'
                                  : 'No packages found matching "$_searchQuery"',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      )
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          if (_searchQuery.isEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                '${filteredAssets.length} ${filteredAssets.length == 1 ? 'package' : 'packages'} in ${_getCategoryDisplayName(_selectedCategory)}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ...filteredAssets.map(
                            (asset) => _buildAssetCard(asset),
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAssetCard(Asset asset) {
    final isSelected = _selectedAssets.contains(asset.id);
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (_selectionMode) {
              _toggleSelection(asset.id);
            } else {
              ViewItemWidget.show(context, asset);
            }
          },
          onLongPress: () {
            if (!_selectionMode) {
              _enterSelectionMode(asset.id);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _selectionMode && isSelected
                  ? theme.colorScheme.primaryContainer.withValues(alpha: 0.5)
                  : theme.cardColor.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(12),
              border: _selectionMode && isSelected
                  ? Border.all(color: theme.colorScheme.primary, width: 2)
                  : null,
            ),
            child: Row(
              children: [
                if (_selectionMode)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Checkbox(
                      value: isSelected,
                      onChanged: (_) => _toggleSelection(asset.id),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    getIconFromString(asset.icon),
                    size: 28,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        asset.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        asset.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (!_selectionMode)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: theme.textTheme.bodySmall?.color,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
