import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/playbook.dart';
import '../services/playbook_service.dart';

class PlaybookSetupScreen extends StatefulWidget {
  const PlaybookSetupScreen({super.key});

  @override
  State<PlaybookSetupScreen> createState() => _PlaybookSetupScreenState();
}

class _PlaybookSetupScreenState extends State<PlaybookSetupScreen> {
  Playbook? _selectedPlaybook;
  final Map<String, bool> _selectedOptions = {};
  bool _isPreparingPlaybook = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Playbooks'), elevation: 0),
      body: Consumer<PlaybookService>(
        builder: (context, playbookService, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.security_outlined,
                              size: 32,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AME Playbooks',
                                    style: textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Customize your Windows installation with trusted playbooks',
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: colorScheme.error.withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                color: colorScheme.error,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'These playbooks modify system files. Create a full external backup first!',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colorScheme.error,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Playbook Selection
                Text(
                  'Select a Playbook',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                ...Playbook.availablePlaybooks.map((playbook) {
                  final isSelected = _selectedPlaybook == playbook;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Card(
                      elevation: isSelected ? 4 : 1,
                      color: isSelected ? colorScheme.primaryContainer : null,
                      child: InkWell(
                        onTap: playbookService.status == PlaybookStatus.idle
                            ? () {
                                setState(() {
                                  _selectedPlaybook = playbook;
                                  _selectedOptions.clear();
                                });
                                // Reset the service config when changing playbooks
                                playbookService.reset();
                              }
                            : null,
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Radio<Playbook>(
                                value: playbook,
                                groupValue: _selectedPlaybook,
                                onChanged:
                                    playbookService.status ==
                                        PlaybookStatus.idle
                                    ? (value) {
                                        setState(() {
                                          _selectedPlaybook = value;
                                          _selectedOptions.clear();
                                        });
                                        playbookService.reset();
                                      }
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      playbook.name,
                                      style: textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? colorScheme.onPrimaryContainer
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      playbook.description,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: isSelected
                                            ? colorScheme.onPrimaryContainer
                                                  .withOpacity(0.8)
                                            : colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),

                // Load Options Button
                if (_selectedPlaybook != null &&
                    playbookService.status == PlaybookStatus.idle &&
                    playbookService.currentConfig == null) ...[
                  const SizedBox(height: 24),
                  Center(
                    child: FilledButton.icon(
                      onPressed: _isPreparingPlaybook
                          ? null
                          : () => _preparePlaybook(context),
                      icon: _isPreparingPlaybook
                          ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.download),
                      label: Text(
                        _isPreparingPlaybook
                            ? 'Loading...'
                            : 'Load Playbook Options',
                      ),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                      ),
                    ),
                  ),
                ],

                // Optional Settings
                if (playbookService.currentConfig != null) ...[
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Playbook Options',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${playbookService.currentConfig!.title} v${playbookService.currentConfig!.version}',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          if (playbookService.currentConfig!.options.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'No configurable options available for this playbook.',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            )
                          else ...[
                            const SizedBox(height: 12),
                            ...playbookService.currentConfig!.options.map((
                              option,
                            ) {
                              // Initialize option state if not already set
                              if (!_selectedOptions.containsKey(option.name)) {
                                _selectedOptions[option.name] =
                                    option.isChecked;
                              }

                              return CheckboxListTile(
                                title: Text(
                                  option.displayName,
                                  style: textTheme.bodyMedium,
                                ),
                                subtitle: option.description != null
                                    ? Text(
                                        option.description!,
                                        style: textTheme.bodySmall?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      )
                                    : null,
                                value: _selectedOptions[option.name] ?? false,
                                onChanged:
                                    playbookService.status ==
                                        PlaybookStatus.idle
                                    ? (value) {
                                        setState(() {
                                          _selectedOptions[option.name] =
                                              value ?? false;
                                        });
                                      }
                                    : null,
                                contentPadding: EdgeInsets.zero,
                              );
                            }),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],

                if (playbookService.currentConfig == null &&
                    _selectedPlaybook != null &&
                    playbookService.status == PlaybookStatus.idle &&
                    !_isPreparingPlaybook)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Click "Load Playbook Options" to download and extract the playbook configuration.',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                const SizedBox(height: 24),

                // Status Display
                if (playbookService.status != PlaybookStatus.idle)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (playbookService.status ==
                                  PlaybookStatus.error)
                                Icon(Icons.error, color: colorScheme.error)
                              else if (playbookService.status ==
                                  PlaybookStatus.completed)
                                Icon(
                                  Icons.check_circle,
                                  color: colorScheme.primary,
                                )
                              else
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  playbookService.statusMessage,
                                  style: textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                          if (playbookService.status != PlaybookStatus.error &&
                              playbookService.status !=
                                  PlaybookStatus.completed) ...[
                            const SizedBox(height: 12),
                            LinearProgressIndicator(
                              value: playbookService.progress,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${(playbookService.progress * 100).toStringAsFixed(0)}%',
                              style: textTheme.bodySmall,
                            ),
                          ],
                          if (playbookService.errorMessage != null) ...[
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: colorScheme.errorContainer.withOpacity(
                                  0.3,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                playbookService.errorMessage!,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.error,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                // Output Log
                if (playbookService.outputLog != null) ...[
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Output Log',
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            constraints: const BoxConstraints(maxHeight: 200),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SingleChildScrollView(
                              child: Text(
                                playbookService.outputLog!,
                                style: textTheme.bodySmall?.copyWith(
                                  fontFamily: 'monospace',
                                  color: Colors.green[300],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed:
                            _selectedPlaybook != null &&
                                playbookService.status == PlaybookStatus.idle &&
                                playbookService.currentConfig != null
                            ? () => _runPlaybook(context)
                            : null,
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Run Playbook'),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (playbookService.status != PlaybookStatus.idle)
                      FilledButton.icon(
                        onPressed: () {
                          playbookService.reset();
                          setState(() {
                            _selectedOptions.clear();
                          });
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset'),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _runPlaybook(BuildContext context) async {
    if (_selectedPlaybook == null) return;

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Playbook Execution'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('You are about to run: ${_selectedPlaybook!.name}'),
            const SizedBox(height: 16),
            const Text(
              'This will:\n'
              '• Download TrustedUninstaller CLI\n'
              '• Download and extract the playbook\n'
              '• Execute system modifications\n\n'
              'Make sure you have a backup of your system!',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Run Playbook'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // Get selected options
    final selectedOptions = _selectedOptions.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    // Run playbook
    final playbookService = context.read<PlaybookService>();
    await playbookService.runPlaybook(
      _selectedPlaybook!,
      options: selectedOptions,
    );
  }

  Future<void> _preparePlaybook(BuildContext context) async {
    if (_selectedPlaybook == null) return;

    setState(() {
      _isPreparingPlaybook = true;
    });

    final playbookService = context.read<PlaybookService>();
    await playbookService.preparePlaybook(_selectedPlaybook!);

    if (mounted) {
      setState(() {
        _isPreparingPlaybook = false;
      });
    }
  }
}
