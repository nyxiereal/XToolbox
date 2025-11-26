import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtoolbox/provider/asset_provider.dart';
import 'package:xtoolbox/utils/iconmap_util.dart';
import 'package:xtoolbox/widgets/item_card_widget.dart';
import 'package:xtoolbox/widgets/view_item_widget.dart';

class BrowseAppsScreen extends StatefulWidget {
  const BrowseAppsScreen({super.key});

  @override
  State<BrowseAppsScreen> createState() => _BrowseAppsScreenState();
}

class _BrowseAppsScreenState extends State<BrowseAppsScreen> {
  String _selectedCategory = 'all';
  String _searchQuery = '';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Packages'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                width: 200,
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
                            (asset) => ToolCard(
                              title: asset.name,
                              description: asset.description,
                              icon: getIconFromString(asset.icon),
                              onTap: () => ViewItemWidget.show(context, asset),
                            ),
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
}
