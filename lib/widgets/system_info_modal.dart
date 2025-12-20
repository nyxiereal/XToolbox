import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:system_info2/system_info2.dart';
import 'package:process_run/shell.dart';

class SystemInfoModal extends StatefulWidget {
  const SystemInfoModal({super.key});

  @override
  State<SystemInfoModal> createState() => _SystemInfoModalState();
}

class _SystemInfoModalState extends State<SystemInfoModal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Timer? _updateTimer;

  // System metrics
  int _memoryUsed = 0;
  int _memoryTotal = 0;
  double _memoryPercentage = 0.0;

  // Hardware info
  String _gpuInfo = 'Loading...';
  String _motherboardInfo = 'Loading...';
  String _directXVersion = 'Loading...';
  List<_DriveInfo> _drives = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadSystemInfo();
    _loadHardwareInfo();
    _startPeriodicUpdate();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _updateTimer?.cancel();
    super.dispose();
  }

  void _startPeriodicUpdate() {
    _updateTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        _loadSystemInfo();
      }
    });
  }

  Future<void> _loadSystemInfo() async {
    try {
      final memTotal = SysInfo.getTotalPhysicalMemory();
      final memFree = SysInfo.getFreePhysicalMemory();
      final memUsed = memTotal - memFree;

      setState(() {
        _memoryTotal = (memTotal / 1024 / 1024).round(); // MB
        _memoryUsed = (memUsed / 1024 / 1024).round(); // MB
        _memoryPercentage = (memUsed / memTotal) * 100;
      });
    } catch (e) {
      // Handle errors silently
    }
  }

  Future<void> _loadHardwareInfo() async {
    if (Platform.isWindows) {
      await _loadWindowsHardwareInfo();
    } else {
      setState(() {
        _gpuInfo = 'Not available on ${Platform.operatingSystem}';
        _motherboardInfo = 'Not available on ${Platform.operatingSystem}';
        _directXVersion = 'Not available on ${Platform.operatingSystem}';
      });
    }
    await _loadDriveInfo();
  }

  Future<void> _loadWindowsHardwareInfo() async {
    try {
      final shell = Shell();

      // Get GPU info
      try {
        final gpuResult = await shell.run(
          'wmic path win32_VideoController get name',
        );
        final gpuOutput = gpuResult.first.stdout.toString();
        final gpuLines = gpuOutput
            .split('\n')
            .where((line) => line.trim().isNotEmpty && !line.contains('Name'))
            .toList();
        _gpuInfo = gpuLines.isNotEmpty ? gpuLines.first.trim() : 'Unknown';
      } catch (e) {
        _gpuInfo = 'Unable to detect';
      }

      // Get motherboard info
      try {
        final mbResult = await shell.run(
          'wmic baseboard get product,manufacturer',
        );
        final mbOutput = mbResult.first.stdout.toString();
        final mbLines = mbOutput
            .split('\n')
            .where(
              (line) =>
                  line.trim().isNotEmpty && !line.contains('Manufacturer'),
            )
            .toList();
        _motherboardInfo = mbLines.isNotEmpty
            ? mbLines.first.trim()
            : 'Unknown';
      } catch (e) {
        _motherboardInfo = 'Unable to detect';
      }

      // Get DirectX version
      try {
        final dxResult = await shell.run(
          'powershell -Command "(Get-ItemProperty \'HKLM:\\SOFTWARE\\Microsoft\\DirectX\').Version"',
        );
        final dxVersion = dxResult.first.stdout.toString().trim();
        _directXVersion = dxVersion.isNotEmpty
            ? dxVersion
            : 'DirectX 12'; // Default fallback
      } catch (e) {
        _directXVersion = 'DirectX 12'; // Windows 10/11 default
      }

      if (mounted) setState(() {});
    } catch (e) {
      if (mounted) {
        setState(() {
          _gpuInfo = 'Error detecting hardware';
          _motherboardInfo = 'Error detecting hardware';
          _directXVersion = 'Error detecting';
        });
      }
    }
  }

  Future<void> _loadDriveInfo() async {
    try {
      if (Platform.isWindows) {
        final shell = Shell();
        final result = await shell.run(
          'wmic logicaldisk get caption,freespace,size,volumename',
        );

        final output = result.first.stdout.toString();
        final lines = output
            .split('\n')
            .where(
              (line) => line.trim().isNotEmpty && !line.contains('Caption'),
            )
            .toList();

        final drives = <_DriveInfo>[];
        for (final line in lines) {
          final parts = line.trim().split(RegExp(r'\s+'));
          if (parts.length >= 3) {
            try {
              final drive = parts[0];
              final freeSpace = int.tryParse(parts[1]) ?? 0;
              final totalSize = int.tryParse(parts[2]) ?? 0;
              final name = parts.length > 3 ? parts.sublist(3).join(' ') : '';

              if (totalSize > 0) {
                drives.add(
                  _DriveInfo(
                    name: name.isEmpty ? drive : name,
                    letter: drive,
                    totalSizeGB: (totalSize / 1024 / 1024 / 1024).round(),
                    freeSpaceGB: (freeSpace / 1024 / 1024 / 1024).round(),
                    usedPercentage: ((totalSize - freeSpace) / totalSize * 100)
                        .round(),
                  ),
                );
              }
            } catch (e) {
              // Skip invalid entries
            }
          }
        }

        if (mounted) {
          setState(() {
            _drives = drives;
          });
        }
      } else {
        // Linux/macOS drive info would go here
        setState(() {
          _drives = [];
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _drives = [];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      backgroundColor: colorScheme.surface,
      child: Container(
        width: 900,
        height: 700,
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.monitor_heart,
                    size: 32,
                    color: colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'System Information',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                    color: colorScheme.onPrimaryContainer,
                  ),
                ],
              ),
            ),

            // Tab Bar
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: colorScheme.outlineVariant,
                    width: 1,
                  ),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
                  Tab(text: 'CPU', icon: Icon(Icons.memory)),
                  Tab(text: 'Storage', icon: Icon(Icons.storage)),
                ],
              ),
            ),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildOverviewTab(),
                  _buildCPUTab(),
                  _buildStorageTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // System Summary Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.computer, color: colorScheme.primary),
                    const SizedBox(width: 12),
                    Text(
                      'System Summary',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildInfoRow('Operating System', _getOSInfo()),
                _buildInfoRow('Kernel', Platform.operatingSystemVersion),
                _buildInfoRow('Processors', '${SysInfo.cores.length} cores'),
                _buildInfoRow('Architecture', SysInfo.kernelArchitecture.name),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Memory Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.memory, color: colorScheme.secondary),
                    const SizedBox(width: 12),
                    Text(
                      'Memory',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$_memoryUsed MB / $_memoryTotal MB',
                            style: theme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: _memoryPercentage / 100,
                            minHeight: 8,
                            backgroundColor:
                                colorScheme.surfaceContainerHighest,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${_memoryPercentage.toStringAsFixed(1)}%',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // User Info Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: colorScheme.tertiary),
                    const SizedBox(width: 12),
                    Text(
                      'User Information',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildInfoRow('Username', SysInfo.userName),
                _buildInfoRow('User ID', SysInfo.userId),
                _buildInfoRow(
                  'User Space Bitness',
                  '${SysInfo.userSpaceBitness} bit',
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Graphics Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.videogame_asset, color: colorScheme.primary),
                    const SizedBox(width: 12),
                    Text(
                      'Graphics',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildInfoRow('GPU', _gpuInfo),
                _buildInfoRow('DirectX Version', _directXVersion),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Motherboard
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.developer_board, color: colorScheme.secondary),
                    const SizedBox(width: 12),
                    Text(
                      'Motherboard',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildInfoRow('Model', _motherboardInfo),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCPUTab() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final processors = SysInfo.cores;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Processor Information',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfoRow('Cores', '${processors.length}'),
                _buildInfoRow('Architecture', SysInfo.kernelArchitecture.name),
                _buildInfoRow('Kernel Bitness', '${SysInfo.kernelBitness} bit'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Core Details',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ...processors.asMap().entries.map((entry) {
                  final index = entry.key;
                  final core = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$index',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                core.name,
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                '${core.architecture}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
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
        ),
      ],
    );
  }

  Widget _buildStorageTab() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        if (_drives.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.storage, color: colorScheme.primary, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    'Loading storage information...',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ..._drives.map((drive) {
            final usedGB = drive.totalSizeGB - drive.freeSpaceGB;
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.storage,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${drive.letter} ${drive.name.isNotEmpty ? "- ${drive.name}" : ""}',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '$usedGB GB used of ${drive.totalSizeGB} GB',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: drive.usedPercentage > 90
                                ? colorScheme.errorContainer
                                : colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${drive.usedPercentage}%',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: drive.usedPercentage > 90
                                  ? colorScheme.onErrorContainer
                                  : colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: drive.usedPercentage / 100,
                      minHeight: 8,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      color: drive.usedPercentage > 90
                          ? colorScheme.error
                          : colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStorageInfo(
                          'Free',
                          '${drive.freeSpaceGB} GB',
                          Colors.green,
                          theme,
                        ),
                        _buildStorageInfo(
                          'Used',
                          '$usedGB GB',
                          drive.usedPercentage > 90
                              ? colorScheme.error
                              : colorScheme.primary,
                          theme,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }

  Widget _buildStorageInfo(
    String label,
    String value,
    Color color,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 180,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getOSInfo() {
    if (Platform.isWindows) return 'Windows';
    if (Platform.isLinux) return 'Linux';
    if (Platform.isMacOS) return 'macOS';
    return 'Unknown';
  }
}

class _DriveInfo {
  final String name;
  final String letter;
  final int totalSizeGB;
  final int freeSpaceGB;
  final int usedPercentage;

  _DriveInfo({
    required this.name,
    required this.letter,
    required this.totalSizeGB,
    required this.freeSpaceGB,
    required this.usedPercentage,
  });
}
