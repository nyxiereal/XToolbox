import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:process_run/shell.dart';
import 'toast_notification_service.dart';
import 'download_service.dart';
import '../models/asset.dart';

enum InstallResult { success, failed, packageManagerNotInstalled, cancelled }

class InstallHandlerService {
  final ToastNotificationService _toastService;
  final DownloadService _downloadService;

  InstallHandlerService(this._toastService, this._downloadService);

  /// Main install handler that processes install methods with auto-retry logic
  Future<InstallResult> handleInstall({
    required InstallMethod method,
    required String appName,
  }) async {
    String? toastId;

    try {
      toastId = _toastService.addNotification(
        title: 'Installing $appName',
        message: 'Using ${method.type.displayName}...',
        status: ToastStatus.pending,
      );

      switch (method.type) {
        case InstallType.directDownload:
          return await _handleDirectDownload(method, appName, toastId);

        case InstallType.winget:
          return await _handleWinget(method, appName, toastId);

        case InstallType.chocolatey:
          return await _handleChocolatey(method, appName, toastId);

        case InstallType.scoop:
          return await _handleScoop(method, appName, toastId);

        case InstallType.powershell:
          return await _handlePowershell(method, appName, toastId);

        case InstallType.microsoftStore:
          return await _handleMicrosoftStore(method, appName, toastId);
      }
    } catch (e) {
      if (toastId != null) {
        _toastService.updateNotification(
          id: toastId,
          status: ToastStatus.error,
          message: 'Installation failed: ${e.toString()}',
        );
      }
      if (kDebugMode) {
        print('Install error: $e');
      }
      return InstallResult.failed;
    }
  }

  Future<InstallResult> _handleDirectDownload(
    InstallMethod method,
    String appName,
    String toastId,
  ) async {
    if (method.url == null) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'No download URL provided',
      );
      return InstallResult.failed;
    }

    _toastService.updateNotification(
      id: toastId,
      status: ToastStatus.inProgress,
      message: 'Starting download...',
    );

    final result = await _downloadService.downloadFile(
      url: method.url!,
      displayName: appName,
      filename: method.filename,
      needsExtraction: method.needsExtraction,
      extractPath: method.executablePath,
      autoComplete: false, // We'll handle the completion toast
    );

    if (result != null) {
      // Execute the downloaded file
      _toastService.updateNotification(
        id: toastId,
        message: 'Launching installer...',
      );

      try {
        String executablePath;

        if (method.needsExtraction && method.executablePath != null) {
          // If extracted, look for the executable in the extracted directory
          executablePath = '$result/${method.executablePath}';
        } else {
          // Use the downloaded file directly
          executablePath = result;
        }

        bool launched = false;

        if (Platform.isWindows) {
          // On Windows, launch the installer. Files may be briefly locked by
          // antivirus or the download process — retry a few times.
          const maxAttempts = 5;
          for (var attempt = 1; attempt <= maxAttempts; attempt++) {
            launched = await _runCommand('start "" "$executablePath"', toastId);
            if (launched) break;
            // back off a bit before retrying
            await Future.delayed(Duration(milliseconds: 200 * attempt));
          }
        } else {
          // On Linux, make executable and run
          final chmodOk = await _runCommand(
            'chmod +x "$executablePath"',
            toastId,
          );
          if (chmodOk) {
            launched = await _runCommand('"$executablePath"', toastId);
          }
        }

        if (launched) {
          _toastService.updateNotification(
            id: toastId,
            status: ToastStatus.success,
            message: 'Installer launched',
          );
          return InstallResult.success;
        } else {
          _toastService.updateNotification(
            id: toastId,
            status: ToastStatus.error,
            message: 'Failed to launch installer after multiple attempts',
          );
          return InstallResult.failed;
        }
      } catch (e) {
        _toastService.updateNotification(
          id: toastId,
          status: ToastStatus.error,
          message: 'Failed to launch installer: ${e.toString()}',
        );
        return InstallResult.failed;
      }
    } else {
      return InstallResult.failed;
    }
  }

  Future<InstallResult> _handleWinget(
    InstallMethod method,
    String appName,
    String toastId,
  ) async {
    if (method.packageId == null) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'No package ID provided',
      );
      return InstallResult.failed;
    }

    // Check if winget is installed
    final isInstalled = await _isCommandAvailable('winget');

    if (!isInstalled) {
      _toastService.updateNotification(
        id: toastId,
        message: 'Winget not found. Installing winget...',
      );

      // Attempt to install winget
      final installResult = await _installWinget(toastId);
      if (!installResult) {
        _toastService.updateNotification(
          id: toastId,
          status: ToastStatus.error,
          message: 'Failed to install winget. Please install manually.',
        );
        return InstallResult.packageManagerNotInstalled;
      }

      _toastService.updateNotification(
        id: toastId,
        message: 'Winget installed. Retrying installation...',
      );
    }

    // Run winget install
    _toastService.updateNotification(
      id: toastId,
      status: ToastStatus.inProgress,
      message: 'Installing via winget...',
    );

    final result = await _runCommand(
      'winget install ${method.packageId} --accept-package-agreements --accept-source-agreements',
      toastId,
    );

    if (result) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.success,
        message: 'Installed successfully',
      );
      return InstallResult.success;
    } else {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'Installation failed',
      );
      return InstallResult.failed;
    }
  }

  Future<InstallResult> _handleChocolatey(
    InstallMethod method,
    String appName,
    String toastId,
  ) async {
    if (method.packageId == null) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'No package ID provided',
      );
      return InstallResult.failed;
    }

    // Check if chocolatey is installed
    final isInstalled = await _isCommandAvailable('choco');

    if (!isInstalled) {
      _toastService.updateNotification(
        id: toastId,
        message: 'Chocolatey not found. Installing chocolatey...',
      );

      // Attempt to install chocolatey
      final installResult = await _installChocolatey(toastId);
      if (!installResult) {
        _toastService.updateNotification(
          id: toastId,
          status: ToastStatus.error,
          message: 'Failed to install chocolatey. Please install manually.',
        );
        return InstallResult.packageManagerNotInstalled;
      }

      _toastService.updateNotification(
        id: toastId,
        message: 'Chocolatey installed. Retrying installation...',
      );
    }

    // Run choco install
    _toastService.updateNotification(
      id: toastId,
      status: ToastStatus.inProgress,
      message: 'Installing via chocolatey...',
    );

    final result = await _runCommand(
      'choco install ${method.packageId} -y',
      toastId,
    );

    if (result) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.success,
        message: 'Installed successfully',
      );
      return InstallResult.success;
    } else {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'Installation failed',
      );
      return InstallResult.failed;
    }
  }

  Future<InstallResult> _handleScoop(
    InstallMethod method,
    String appName,
    String toastId,
  ) async {
    if (method.packageId == null) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'No package ID provided',
      );
      return InstallResult.failed;
    }

    final isInstalled = await _isCommandAvailable('scoop');

    if (!isInstalled) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'Scoop not installed. Please install from scoop.sh',
      );
      return InstallResult.packageManagerNotInstalled;
    }

    _toastService.updateNotification(
      id: toastId,
      status: ToastStatus.inProgress,
      message: 'Installing via scoop...',
    );

    final result = await _runCommand(
      'scoop install ${method.packageId}',
      toastId,
    );

    if (result) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.success,
        message: 'Installed successfully',
      );
      return InstallResult.success;
    } else {
      return InstallResult.failed;
    }
  }

  Future<InstallResult> _handlePowershell(
    InstallMethod method,
    String appName,
    String toastId,
  ) async {
    if (method.command == null) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'No command provided',
      );
      return InstallResult.failed;
    }

    _toastService.updateNotification(
      id: toastId,
      status: ToastStatus.inProgress,
      message: 'Running PowerShell command...',
    );

    final result = await _runCommand(method.command!, toastId);

    if (result) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.success,
        message: 'Command executed successfully',
      );
      return InstallResult.success;
    } else {
      return InstallResult.failed;
    }
  }

  Future<InstallResult> _handleMicrosoftStore(
    InstallMethod method,
    String appName,
    String toastId,
  ) async {
    if (method.storeId == null) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'No store ID provided',
      );
      return InstallResult.failed;
    }

    _toastService.updateNotification(
      id: toastId,
      status: ToastStatus.inProgress,
      message: 'Opening Microsoft Store...',
    );

    try {
      // Launch Microsoft Store
      final url = 'ms-windows-store://pdp/?ProductId=${method.storeId}';
      if (Platform.isWindows) {
        final result = await _runCommand(
          'start "" "$url"',
          toastId,
          silent: true,
        );

        if (result) {
          _toastService.updateNotification(
            id: toastId,
            status: ToastStatus.success,
            message: 'Microsoft Store opened',
          );
          return InstallResult.success;
        } else {
          throw Exception('Failed to launch Microsoft Store');
        }
      } else {
        _toastService.updateNotification(
          id: toastId,
          status: ToastStatus.error,
          message: 'Microsoft Store is only available on Windows',
        );
        return InstallResult.failed;
      }
    } catch (e) {
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message: 'Failed to open Microsoft Store',
      );
      return InstallResult.failed;
    }
  }

  Future<bool> _isCommandAvailable(String command) async {
    try {
      final shell = Shell();
      if (Platform.isWindows) {
        await shell.run('where $command');
      } else {
        await shell.run('which $command');
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _installWinget(String toastId) async {
    try {
      // Winget comes with Windows 11 and Windows 10 with App Installer.
      // First, check whether App Installer is already present (Get-AppxPackage).
      try {
        final shell = Shell();
        // Check user-level App Installer first (no -AllUsers to avoid permission issues)
        final results = await shell.run(
          'powershell -NoProfile -Command "Get-AppxPackage -Name Microsoft.DesktopAppInstaller | Select-Object -ExpandProperty Name"',
        );

        final out = results.isNotEmpty
            ? results.last.stdout.toString().trim()
            : '';
        if (out.isNotEmpty) {
          // App Installer is installed at the user level; return success so caller can retry winget.
          return true;
        }
      } catch (e) {
        final err = e.toString();
        // If we get an UnauthorizedAccessException, inform the user and open the Store
        if (err.contains('Unauthorized') ||
            err.contains('Access Denied') ||
            err.contains('Odmowa')) {
          _toastService.updateNotification(
            id: toastId,
            status: ToastStatus.error,
            message:
                'Permission denied when checking App Installer. Please run the app as Administrator or install "App Installer" from the Microsoft Store. Opening Store...',
          );

          await _runCommand(
            'start "" "ms-windows-store://search/?query=App%20Installer"',
            toastId,
            silent: true,
          );

          return false;
        }
        // otherwise ignore and attempt registration below
      }

      // Attempt to register App Installer via Add-AppxPackage. This will fail
      // when the package isn't staged on disk; in that case we fallback to
      // opening the Microsoft Store search page for the user to install it.
      final registerCmd =
          r"$progressPreference = 'silentlyContinue'; Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe";

      final registered = await _runCommand(registerCmd, toastId);

      if (registered) return true;

      // If registration failed, open Microsoft Store search for App Installer
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.error,
        message:
            'Failed to register App Installer automatically. Opening Microsoft Store to help you install App Installer (search: "App Installer").',
      );

      // Open store search for 'App Installer' to let the user install it interactively
      await _runCommand(
        'start "" "ms-windows-store://search/?query=App%20Installer"',
        toastId,
        silent: true,
      );

      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Error installing winget: $e');
      }
      return false;
    }
  }

  Future<bool> _installChocolatey(String toastId) async {
    try {
      // Official chocolatey installation command
      final command = '''
      Set-ExecutionPolicy Bypass -Scope Process -Force; 
      [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
      iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
      ''';

      return await _runCommand(command, toastId);
    } catch (e) {
      if (kDebugMode) {
        print('Error installing chocolatey: $e');
      }
      return false;
    }
  }

  Future<bool> _runCommand(
    String command,
    String toastId, {
    bool silent = false,
  }) async {
    try {
      final shell = Shell();

      // Run command based on platform
      if (Platform.isWindows) {
        // For Windows, use cmd for start command, otherwise run via PowerShell
        if (command.startsWith('start ')) {
          await shell.run('cmd /c $command');
        } else {
          // Use -NoProfile and -ExecutionPolicy Bypass and wrap the command
          // in an explicit script block to avoid issues with newlines/quotes.
          await shell.run(
            'powershell -NoProfile -ExecutionPolicy Bypass -Command "& { $command }"',
          );
        }
      } else {
        await shell.run(command);
      }

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Command execution error: $e');
      }
      if (!silent) {
        _toastService.updateNotification(
          id: toastId,
          status: ToastStatus.error,
          message: 'Command failed: ${e.toString()}',
        );
      }
      return false;
    }
  }
}
