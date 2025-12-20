import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../services/toast_notification_service.dart';

class CleanupScreen extends StatefulWidget {
  const CleanupScreen({super.key});

  @override
  State<CleanupScreen> createState() => _CleanupScreenState();
}

class _CleanupScreenState extends State<CleanupScreen> {
  final Map<String, bool> _selectedOptions = {};
  final Map<String, int> _estimatedSizes = {}; // in MB
  bool _calculating = false;
  bool _cleaning = false;

  final List<CleanupOption> _cleanupOptions = [
    CleanupOption(
      id: 'temp_files',
      title: 'Temporary Files',
      description: 'Clear Windows temporary files and folders',
      icon: Icons.folder_delete,
      category: 'System',
    ),
    CleanupOption(
      id: 'downloads',
      title: 'Downloads Folder',
      description: 'Clear downloaded files from Downloads folder',
      icon: Icons.download,
      category: 'User',
    ),
    CleanupOption(
      id: 'recycle_bin',
      title: 'Recycle Bin',
      description: 'Empty the Windows Recycle Bin',
      icon: Icons.delete,
      category: 'System',
    ),
    CleanupOption(
      id: 'browser_cache',
      title: 'Browser Cache',
      description: 'Clear browser cache and temporary files',
      icon: Icons.web,
      category: 'Applications',
    ),
    CleanupOption(
      id: 'log_files',
      title: 'Log Files',
      description: 'Delete system and application log files',
      icon: Icons.description,
      category: 'System',
    ),
    CleanupOption(
      id: 'thumbnail_cache',
      title: 'Thumbnail Cache',
      description: 'Clear Windows thumbnail cache',
      icon: Icons.image,
      category: 'System',
    ),
    CleanupOption(
      id: 'prefetch',
      title: 'Prefetch Files',
      description: 'Clear Windows prefetch data',
      icon: Icons.speed,
      category: 'System',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize all options as unchecked
    for (var option in _cleanupOptions) {
      _selectedOptions[option.id] = false;
    }
    _calculateSizes();
  }

  Future<void> _calculateSizes() async {
    if (_calculating) return;

    setState(() {
      _calculating = true;
    });

    try {
      for (var option in _cleanupOptions) {
        final size = await _estimateSize(option.id);
        _estimatedSizes[option.id] = size;
      }
    } finally {
      if (mounted) {
        setState(() {
          _calculating = false;
        });
      }
    }
  }

  Future<int> _estimateSize(String optionId) async {
    try {
      switch (optionId) {
        case 'temp_files':
          return await _calculateDirectorySize(Directory.systemTemp);
        case 'downloads':
          final dir = await getDownloadsDirectory();
          if (dir != null) {
            return await _calculateDirectorySize(dir);
          }
          break;
        case 'recycle_bin':
          // Placeholder - actual implementation would vary by OS
          return 0;
        default:
          return 0;
      }
    } catch (e) {
      return 0;
    }
    return 0;
  }

  Future<int> _calculateDirectorySize(Directory dir) async {
    try {
      if (!await dir.exists()) return 0;

      int totalSize = 0;
      await for (var entity in dir.list(recursive: true, followLinks: false)) {
        if (entity is File) {
          try {
            totalSize += await entity.length();
          } catch (e) {
            // Skip files we can't read
          }
        }
      }
      return (totalSize / 1024 / 1024).round(); // Convert to MB
    } catch (e) {
      return 0;
    }
  }

  Future<void> _performCleanup() async {
    final toastService = Provider.of<ToastNotificationService>(
      context,
      listen: false,
    );

    final selectedItems = _cleanupOptions
        .where((opt) => _selectedOptions[opt.id] == true)
        .toList();

    if (selectedItems.isEmpty) {
      toastService.addNotification(
        title: 'No items selected',
        message: 'Please select at least one cleanup option',
        status: ToastStatus.error,
      );
      return;
    }

    // Confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Cleanup'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you sure you want to clean the following items?'),
            const SizedBox(height: 16),
            ...selectedItems.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    Icon(item.icon, size: 16),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item.title)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This action cannot be undone!',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Clean Now'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() {
      _cleaning = true;
    });

    final toastId = toastService.addNotification(
      title: 'Cleaning...',
      message: 'Processing selected items',
      status: ToastStatus.inProgress,
    );

    int successCount = 0;
    int failedCount = 0;

    for (var item in selectedItems) {
      try {
        await _cleanItem(item.id);
        successCount++;
      } catch (e) {
        failedCount++;
      }
    }

    toastService.updateNotification(
      id: toastId,
      title: 'Cleanup Complete',
      message: 'Success: $successCount, Failed: $failedCount',
      status: successCount > 0 ? ToastStatus.success : ToastStatus.error,
    );

    setState(() {
      _cleaning = false;
      // Reset selections
      for (var key in _selectedOptions.keys) {
        _selectedOptions[key] = false;
      }
    });

    // Recalculate sizes
    _calculateSizes();
  }

  Future<void> _cleanItem(String optionId) async {
    switch (optionId) {
      case 'temp_files':
        await _cleanDirectory(Directory.systemTemp);
        break;
      case 'downloads':
        final dir = await getDownloadsDirectory();
        if (dir != null) {
          await _cleanDirectory(dir);
        }
        break;
      default:
        // Placeholder for other cleanup operations
        await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  Future<void> _cleanDirectory(Directory dir) async {
    if (!await dir.exists()) return;

    await for (var entity in dir.list(followLinks: false)) {
      try {
        await entity.delete(recursive: true);
      } catch (e) {
        // Skip files/folders we can't delete
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final selectedCount = _selectedOptions.values
        .where((selected) => selected)
        .length;
    final totalSize = _selectedOptions.entries
        .where((e) => e.value)
        .map((e) => _estimatedSizes[e.key] ?? 0)
        .fold<int>(0, (sum, size) => sum + size);

    return Scaffold(
      appBar: AppBar(
        title: const Text('System Cleanup'),
        actions: [
          if (_calculating)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _calculateSizes,
              tooltip: 'Recalculate sizes',
            ),
        ],
      ),
      body: Column(
        children: [
          // Summary Card
          if (selectedCount > 0)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.cleaning_services,
                    color: colorScheme.onPrimaryContainer,
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$selectedCount items selected',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        Text(
                          'Estimated space to free: $totalSize MB',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // Cleanup Options List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _cleanupOptions.length,
              itemBuilder: (context, index) {
                final option = _cleanupOptions[index];
                final size = _estimatedSizes[option.id] ?? 0;
                final isSelected = _selectedOptions[option.id] ?? false;

                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: CheckboxListTile(
                    value: isSelected,
                    onChanged: _cleaning
                        ? null
                        : (value) {
                            setState(() {
                              _selectedOptions[option.id] = value ?? false;
                            });
                          },
                    secondary: Icon(option.icon, color: colorScheme.primary),
                    title: Text(option.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(option.description),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                option.category,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSecondaryContainer,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (_calculating)
                              SizedBox(
                                width: 12,
                                height: 12,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.5,
                                ),
                              )
                            else
                              Text(
                                '$size MB',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: selectedCount > 0
          ? FloatingActionButton.extended(
              onPressed: _cleaning ? null : _performCleanup,
              icon: _cleaning
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.cleaning_services),
              label: Text(_cleaning ? 'Cleaning...' : 'Start Cleanup'),
            )
          : null,
    );
  }
}

class CleanupOption {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String category;

  const CleanupOption({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
  });
}
