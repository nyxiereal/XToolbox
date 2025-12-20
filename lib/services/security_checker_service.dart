import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:process_run/shell.dart';

class SecurityCheckerService {
  /// Check if the app is running with administrator privileges
  static Future<bool> isRunningAsAdmin() async {
    if (!Platform.isWindows) {
      return true; // Non-Windows platforms don't need this
    }

    try {
      final shell = Shell();
      final result = await shell.run('net session');
      // If this command succeeds, we're running as admin
      return result.first.exitCode == 0;
    } catch (e) {
      return false;
    }
  }

  /// Check if Windows Defender is enabled
  static Future<bool> isWindowsDefenderEnabled() async {
    if (!Platform.isWindows) return false;

    try {
      final shell = Shell();
      // Check Windows Defender status using PowerShell
      final result = await shell.run(
        'powershell -Command "Get-MpComputerStatus | Select-Object -ExpandProperty RealTimeProtectionEnabled"',
      );

      if (result.first.exitCode == 0) {
        final output = result.first.stdout.toString().trim().toLowerCase();
        return output == 'true';
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking Windows Defender status: $e');
      }
      return false;
    }
  }

  /// Open Windows Defender settings page
  static Future<void> openWindowsDefenderSettings() async {
    if (!Platform.isWindows) return;

    try {
      final shell = Shell();
      await shell.run('start windowsdefender://');
    } catch (e) {
      // Fallback to Settings app
      try {
        final shell = Shell();
        await shell.run('start ms-settings:windowsdefender');
      } catch (e2) {
        if (kDebugMode) {
          print('Error opening Windows Defender settings: $e2');
        }
      }
    }
  }

  /// Request admin elevation (restart app as admin)
  static Future<bool> requestAdminElevation() async {
    if (!Platform.isWindows) return true;

    try {
      // Get current executable path
      final exePath = Platform.resolvedExecutable;

      // Restart with admin privileges using PowerShell
      final shell = Shell();
      await shell.run(
        'powershell -Command "Start-Process \'$exePath\' -Verb RunAs"',
      );

      // Exit current non-admin instance
      exit(0);
    } catch (e) {
      if (kDebugMode) {
        print('Error requesting admin elevation: $e');
      }
      return false;
    }
  }
}
