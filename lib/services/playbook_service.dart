import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart';
import '../models/playbook.dart';
import 'toast_notification_service.dart';

enum PlaybookStatus {
  idle,
  downloadingCLI,
  downloadingPlaybook,
  extractingCLI,
  extractingPlaybook,
  parsingConfig,
  running,
  completed,
  error,
}

class PlaybookService extends ChangeNotifier {
  final ToastNotificationService _toastService;

  PlaybookStatus _status = PlaybookStatus.idle;
  String _statusMessage = '';
  double _progress = 0.0;
  String? _errorMessage;
  String? _outputLog;
  String? _currentToastId;
  PlaybookConfig? _currentConfig;

  PlaybookStatus get status => _status;
  String get statusMessage => _statusMessage;
  double get progress => _progress;
  String? get errorMessage => _errorMessage;
  String? get outputLog => _outputLog;
  PlaybookConfig? get currentConfig => _currentConfig;

  static const String cliDownloadUrl =
      'https://github.com/Ameliorated-LLC/trusted-uninstaller-cli/releases/latest/download/CLI-Standalone.zip';
  static const String sevenZipDownloadUrl =
      'https://www.7-zip.org/a/7zr.exe'; // Standalone 7-Zip executable

  PlaybookService(this._toastService);

  Future<String> get _workingDirectory async {
    final appDir = await getApplicationSupportDirectory();
    final workDir = Directory('${appDir.path}/playbooks');
    if (!await workDir.exists()) {
      await workDir.create(recursive: true);
    }
    return workDir.path;
  }

  void _updateStatus(
    PlaybookStatus status,
    String message, {
    double? progress,
  }) {
    _status = status;
    _statusMessage = message;
    if (progress != null) _progress = progress;

    // Update toast notification
    if (_currentToastId != null) {
      ToastStatus toastStatus;
      switch (status) {
        case PlaybookStatus.error:
          toastStatus = ToastStatus.error;
          break;
        case PlaybookStatus.completed:
          toastStatus = ToastStatus.success;
          break;
        default:
          toastStatus = ToastStatus.inProgress;
      }

      // Consider an "idle" status at 100% as completed so the toast clears
      if (status == PlaybookStatus.idle &&
          progress != null &&
          progress >= 1.0) {
        toastStatus = ToastStatus.success;
      }

      _toastService.updateNotification(
        id: _currentToastId!,
        title: message,
        status: toastStatus,
        progress: progress,
      );

      // If the toast is now completed (success/error) forget the id so future
      // updates create a new notification instead of trying to reuse a removed one.
      if (toastStatus == ToastStatus.success ||
          toastStatus == ToastStatus.error) {
        _currentToastId = null;
      }
    }

    notifyListeners();
  }

  void _setError(String message) {
    _status = PlaybookStatus.error;
    _errorMessage = message;
    _statusMessage = 'Error: $message';

    if (_currentToastId != null) {
      _toastService.updateNotification(
        id: _currentToastId!,
        title: 'Error',
        message: message,
        status: ToastStatus.error,
      );
    } else {
      _toastService.addNotification(
        title: 'Error',
        message: message,
        status: ToastStatus.error,
      );
    }

    notifyListeners();
  }

  Future<void> runPlaybook(
    Playbook playbook, {
    List<String> options = const [],
  }) async {
    try {
      _errorMessage = null;
      _outputLog = null;
      _progress = 0.0;

      // Create initial toast notification
      _currentToastId = _toastService.addNotification(
        title: 'Starting playbook setup...',
        status: ToastStatus.pending,
      );
      _errorMessage = null;
      _outputLog = null;
      _progress = 0.0;

      final workDir = await _workingDirectory;
      final cliDir = Directory('$workDir/CLI-Standalone');

      // Step 1: Download and extract CLI if not present
      if (!await cliDir.exists() ||
          !await File(
            '$workDir/CLI-Standalone/TrustedUninstaller.CLI.exe',
          ).exists()) {
        await _downloadAndExtractCLI(workDir);
      } else {
        _updateStatus(
          PlaybookStatus.idle,
          'CLI already downloaded',
          progress: 0.1,
        );
      }

      // Step 2: Download playbook
      await _downloadPlaybook(playbook, workDir);

      // Step 3: Extract playbook
      final playbookDir = await _extractPlaybook(playbook, workDir);

      // Step 4: Run TrustedUninstaller.CLI
      await _runCLI(playbookDir, options);

      _updateStatus(
        PlaybookStatus.completed,
        'Playbook execution completed!',
        progress: 1.0,
      );
    } catch (e) {
      _setError(e.toString());
    }
  }

  Future<void> _downloadAndExtractCLI(String workDir) async {
    _updateStatus(
      PlaybookStatus.downloadingCLI,
      'Downloading TrustedUninstaller CLI...',
      progress: 0.1,
    );

    final response = await http.get(Uri.parse(cliDownloadUrl));
    if (response.statusCode != 200) {
      throw Exception('Failed to download CLI: ${response.statusCode}');
    }

    _updateStatus(
      PlaybookStatus.extractingCLI,
      'Extracting CLI...',
      progress: 0.3,
    );

    final archive = ZipDecoder().decodeBytes(response.bodyBytes);
    final cliDir = Directory('$workDir/CLI-Standalone');

    if (await cliDir.exists()) {
      await cliDir.delete(recursive: true);
    }
    await cliDir.create(recursive: true);

    for (final file in archive) {
      final filename = '$workDir/CLI-Standalone/${file.name}';
      if (file.isFile) {
        final outFile = File(filename);
        await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content as List<int>);

        // Make executable on Linux
        if (Platform.isLinux && file.name.endsWith('.exe')) {
          await Process.run('chmod', ['+x', filename]);
        }
      } else {
        await Directory(filename).create(recursive: true);
      }
    }

    _updateStatus(PlaybookStatus.extractingCLI, 'CLI extracted', progress: 0.4);
  }

  Future<void> _downloadPlaybook(Playbook playbook, String workDir) async {
    _updateStatus(
      PlaybookStatus.downloadingPlaybook,
      'Downloading ${playbook.name}...',
      progress: 0.5,
    );

    final response = await http.get(Uri.parse(playbook.downloadUrl));
    if (response.statusCode != 200) {
      throw Exception('Failed to download playbook: ${response.statusCode}');
    }

    final filename = playbook.downloadUrl.split('/').last;
    final file = File('$workDir/$filename');
    await file.writeAsBytes(response.bodyBytes);

    _updateStatus(
      PlaybookStatus.downloadingPlaybook,
      'Playbook downloaded',
      progress: 0.6,
    );
  }

  Future<String> _extractPlaybook(Playbook playbook, String workDir) async {
    _updateStatus(
      PlaybookStatus.extractingPlaybook,
      'Extracting playbook...',
      progress: 0.7,
    );

    final filename = playbook.downloadUrl.split('/').last;
    final downloadedFile = File('$workDir/$filename');

    if (!await downloadedFile.exists()) {
      throw Exception('Downloaded playbook file not found');
    }

    String playbookName = playbook.name
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .replaceAll(' ', '_');
    final extractDir = Directory('$workDir/$playbookName');

    if (await extractDir.exists()) {
      await extractDir.delete(recursive: true);
    }
    await extractDir.create(recursive: true);

    if (playbook.isZipArchive) {
      // Extract .zip file (like AtlasOS)
      final bytes = await downloadedFile.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      for (final file in archive) {
        final filePath = '${extractDir.path}/${file.name}';
        if (file.isFile) {
          final outFile = File(filePath);
          await outFile.create(recursive: true);
          await outFile.writeAsBytes(file.content as List<int>);
        } else {
          await Directory(filePath).create(recursive: true);
        }
      }

      // Find and extract the .apbx file if it exists
      final apbxFiles = await extractDir
          .list(recursive: true)
          .where((entity) => entity is File && entity.path.endsWith('.apbx'))
          .cast<File>()
          .toList();

      if (apbxFiles.isNotEmpty) {
        // Extract the .apbx file with password
        await _extract7zWithPassword(
          apbxFiles.first.path,
          extractDir.path,
          playbook.password,
        );
      }
    } else {
      // Extract .apbx file with password using 7z
      await _extract7zWithPassword(
        downloadedFile.path,
        extractDir.path,
        playbook.password,
      );
    }

    _updateStatus(
      PlaybookStatus.extractingPlaybook,
      'Playbook extracted',
      progress: 0.8,
    );

    // Parse playbook configuration
    await _parsePlaybookConfig(extractDir.path);

    return extractDir.path;
  }

  Future<void> _parsePlaybookConfig(String playbookDir) async {
    _updateStatus(
      PlaybookStatus.parsingConfig,
      'Parsing playbook configuration...',
      progress: 0.85,
    );

    final configFile = File('$playbookDir/playbook.conf');
    if (!await configFile.exists()) {
      // Some playbooks might not have a config file
      _currentConfig = null;
      return;
    }

    try {
      final configContent = await configFile.readAsString();
      final document = XmlDocument.parse(configContent);
      final root = document.findElements('Playbook').first;

      final title =
          root.findElements('Title').firstOrNull?.innerText ?? 'Unknown';
      final version =
          root.findElements('Version').firstOrNull?.innerText ?? '1.0';
      final List<PlaybookOption> options = [];

      // Parse Software packages (browsers, etc.)
      for (final package
          in root
              .findElements('Software')
              .expand((s) => s.findElements('Package'))) {
        final optionName = package.getAttribute('Option');
        final title = package.findElements('Title').firstOrNull?.innerText;
        final description = package
            .findElements('Description')
            .firstOrNull
            ?.innerText;

        if (optionName != null && title != null) {
          options.add(
            PlaybookOption(
              name: optionName,
              displayName: title,
              description: description,
              type: 'software',
            ),
          );
        }
      }

      // Parse FeaturePages
      for (final page
          in root
              .findElements('FeaturePages')
              .expand((f) => f.children.whereType<XmlElement>())) {
        if (page.name.local == 'RadioImagePage' ||
            page.name.local == 'RadioPage') {
          final defaultOption = page.getAttribute('DefaultOption');
          final description = page.getAttribute('Description');

          for (final radioOption
              in page
                  .findElements('Options')
                  .expand((o) => o.findElements('RadioImageOption'))) {
            final optionName = radioOption
                .findElements('Name')
                .firstOrNull
                ?.innerText;
            final text = radioOption
                .findElements('Text')
                .firstOrNull
                ?.innerText;

            if (optionName != null && text != null) {
              options.add(
                PlaybookOption(
                  name: optionName,
                  displayName: text,
                  description: description,
                  isChecked: optionName == defaultOption,
                  type: 'radio',
                ),
              );
            }
          }

          for (final radioOption
              in page
                  .findElements('Options')
                  .expand((o) => o.findElements('RadioOption'))) {
            final optionName = radioOption
                .findElements('Name')
                .firstOrNull
                ?.innerText;
            final text = radioOption
                .findElements('Text')
                .firstOrNull
                ?.innerText;

            if (optionName != null && text != null) {
              options.add(
                PlaybookOption(
                  name: optionName,
                  displayName: text,
                  description: description,
                  isChecked: optionName == defaultOption,
                  type: 'radio',
                ),
              );
            }
          }
        } else if (page.name.local == 'CheckboxPage') {
          final description = page.getAttribute('Description');
          final isRequired = page.getAttribute('IsRequired') == 'true';

          for (final checkboxOption
              in page
                  .findElements('Options')
                  .expand((o) => o.findElements('CheckboxOption'))) {
            final isChecked =
                checkboxOption.getAttribute('IsChecked') == 'true';
            final optionName = checkboxOption
                .findElements('Name')
                .firstOrNull
                ?.innerText;
            final text = checkboxOption
                .findElements('Text')
                .firstOrNull
                ?.innerText;

            if (optionName != null && text != null) {
              options.add(
                PlaybookOption(
                  name: optionName,
                  displayName: text,
                  description: description,
                  isChecked: isChecked,
                  isRequired: isRequired,
                  type: 'checkbox',
                ),
              );
            }
          }
        }
      }

      _currentConfig = PlaybookConfig(
        title: title,
        version: version,
        options: options,
      );

      notifyListeners();
    } catch (e) {
      // If parsing fails, just continue without config
      _currentConfig = null;
      debugPrint('Failed to parse playbook config: $e');
    }
  }

  Future<void> _extract7zWithPassword(
    String archivePath,
    String outputDir,
    String password,
  ) async {
    // .apbx files are 7-Zip archives, not standard ZIP
    // Download 7zr.exe if not present
    final workDir = await _workingDirectory;
    final sevenZipExe = '$workDir\\7zr.exe';

    if (!await File(sevenZipExe).exists()) {
      // Download 7-Zip standalone executable
      final response = await http.get(Uri.parse(sevenZipDownloadUrl));
      if (response.statusCode != 200) {
        throw Exception('Failed to download 7-Zip: ${response.statusCode}');
      }
      await File(sevenZipExe).writeAsBytes(response.bodyBytes);
    }

    // Use 7zr.exe to extract the password-protected archive
    final result = await Process.run(sevenZipExe, [
      'x', // Extract with full paths
      '-p$password', // Password
      '-o$outputDir', // Output directory
      archivePath, // Input archive
      '-y', // Yes to all prompts
    ], runInShell: true);

    if (result.exitCode != 0) {
      throw Exception(
        'Failed to extract archive: ${result.stderr}\n${result.stdout}',
      );
    }
  }

  Future<void> _runCLI(String playbookDir, List<String> options) async {
    _updateStatus(
      PlaybookStatus.running,
      'Running TrustedUninstaller CLI...',
      progress: 0.9,
    );

    final workDir = await _workingDirectory;
    final cliExe = '$workDir/CLI-Standalone/TrustedUninstaller.CLI.exe';

    if (!await File(cliExe).exists()) {
      throw Exception('TrustedUninstaller.CLI.exe not found');
    }

    // On Linux, we need wine to run .exe files
    String command;
    List<String> args;

    if (Platform.isWindows) {
      command = cliExe;
      args = [playbookDir, ...options];
    } else {
      // Check if wine is available
      final wineCheck = await Process.run('which', ['wine']);
      if (wineCheck.exitCode != 0) {
        throw Exception(
          'Wine not found. Please install wine to run Windows executables.',
        );
      }
      command = 'wine';
      args = [cliExe, playbookDir, ...options];
    }

    final process = await Process.start(
      command,
      args,
      workingDirectory: '$workDir/CLI-Standalone',
      runInShell: true,
    );

    final output = StringBuffer();

    process.stdout.listen((data) {
      final text = String.fromCharCodes(data);
      output.write(text);
      _outputLog = output.toString();
      notifyListeners();
    });

    process.stderr.listen((data) {
      final text = String.fromCharCodes(data);
      output.write(text);
      _outputLog = output.toString();
      notifyListeners();
    });

    final exitCode = await process.exitCode;

    if (exitCode != 0) {
      throw Exception(
        'CLI exited with code $exitCode. Check output log for details.',
      );
    }
  }

  void reset() {
    _status = PlaybookStatus.idle;
    _statusMessage = '';
    _progress = 0.0;
    _errorMessage = null;
    _outputLog = null;
    _currentConfig = null;
    notifyListeners();
  }

  // Method to prepare playbook (download and extract, but don't run)
  Future<String?> preparePlaybook(Playbook playbook) async {
    try {
      _errorMessage = null;
      _outputLog = null;
      _progress = 0.0;
      _currentConfig = null;

      // Create initial toast notification
      _currentToastId = _toastService.addNotification(
        title: 'Preparing playbook...',
        status: ToastStatus.pending,
      );

      final workDir = await _workingDirectory;
      final cliDir = Directory('$workDir/CLI-Standalone');

      // Step 1: Download and extract CLI if not present
      if (!await cliDir.exists() ||
          !await File(
            '$workDir/CLI-Standalone/TrustedUninstaller.CLI.exe',
          ).exists()) {
        await _downloadAndExtractCLI(workDir);
      } else {
        _updateStatus(
          PlaybookStatus.idle,
          'CLI already downloaded',
          progress: 0.1,
        );
      }

      // Step 2: Download playbook
      await _downloadPlaybook(playbook, workDir);

      // Step 3: Extract playbook and parse config
      final playbookDir = await _extractPlaybook(playbook, workDir);

      _updateStatus(PlaybookStatus.idle, 'Playbook ready', progress: 1.0);

      return playbookDir;
    } catch (e) {
      _setError(e.toString());
      return null;
    }
  }
}
