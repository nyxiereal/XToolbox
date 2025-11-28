import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive_io.dart';
import 'toast_notification_service.dart';

class DownloadTask {
  final String id;
  final String url;
  final String? filename;
  final bool needsExtraction;
  final String? extractPath;

  DownloadTask({
    required this.id,
    required this.url,
    this.filename,
    this.needsExtraction = false,
    this.extractPath,
  });
}

class DownloadService {
  final ToastNotificationService _toastService;
  final Map<String, bool> _activeDownloads = {};

  DownloadService(this._toastService);

  Future<String?> downloadFile({
    required String url,
    required String displayName,
    String? filename,
    bool needsExtraction = false,
    String? extractPath,
    bool autoComplete = true,
  }) async {
    final taskId = DateTime.now().millisecondsSinceEpoch.toString();

    try {
      // Add toast notification
      final toastId = _toastService.addNotification(
        title: 'Downloading $displayName',
        message: 'Preparing download...',
        status: ToastStatus.pending,
      );

      _activeDownloads[taskId] = true;

      // Get downloads directory
      final downloadsDir = await getDownloadsDirectory();
      if (downloadsDir == null) {
        throw Exception('Could not access downloads directory');
      }

      // Determine filename
      final fileName = filename ?? url.split('/').last;
      final filePath = '${downloadsDir.path}/$fileName';

      // Update toast to in-progress
      _toastService.updateNotification(
        id: toastId,
        status: ToastStatus.inProgress,
        message: 'Downloading...',
        progress: 0.0,
      );

      // Download file with progress
      final file = File(filePath);
      final request = http.Request('GET', Uri.parse(url));

      // Add browser-like headers
      request.headers.addAll({
        'User-Agent':
            'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
        'Accept': '*/*',
        'Accept-Language': 'en-US,en;q=0.9',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Upgrade-Insecure-Requests': '1',
      });

      final response = await request.send();

      if (response.statusCode != 200) {
        throw Exception('Failed to download: ${response.statusCode}');
      }

      final contentLength = response.contentLength ?? 0;
      int bytesDownloaded = 0;

      final sink = file.openWrite();

      await response.stream
          .listen(
            (chunk) {
              bytesDownloaded += chunk.length;
              sink.add(chunk);

              if (contentLength > 0) {
                final progress = bytesDownloaded / contentLength;
                _toastService.updateNotification(
                  id: toastId,
                  progress: progress,
                  message:
                      'Downloaded ${_formatBytes(bytesDownloaded)} / ${_formatBytes(contentLength)}',
                );
              }
            },
            onDone: () async {
              await sink.close();
            },
            onError: (error) async {
              await sink.close();
              throw error;
            },
            cancelOnError: true,
          )
          .asFuture();

      // Extract if needed
      if (needsExtraction) {
        _toastService.updateNotification(
          id: toastId,
          message: 'Extracting...',
          progress: null,
        );

        final extractDir =
            extractPath ??
            '${downloadsDir.path}/${fileName.replaceAll(RegExp(r'\.(zip|tar\.gz|tar)$'), '')}';
        await _extractArchive(filePath, extractDir);

        if (autoComplete) {
          _toastService.updateNotification(
            id: toastId,
            status: ToastStatus.success,
            message: 'Extracted to $extractDir',
          );
        } else {
          // Remove the download toast, the caller will handle completion
          _toastService.removeNotification(toastId);
        }

        return extractDir;
      } else {
        if (autoComplete) {
          _toastService.updateNotification(
            id: toastId,
            status: ToastStatus.success,
            message: 'Saved to $filePath',
          );
        } else {
          // Remove the download toast, the caller will handle completion
          _toastService.removeNotification(toastId);
        }

        return filePath;
      }
    } catch (e) {
      final toastId = _toastService.notifications
          .where((n) => n.title.contains(displayName))
          .firstOrNull
          ?.id;

      if (toastId != null) {
        _toastService.updateNotification(
          id: toastId,
          status: ToastStatus.error,
          message: 'Failed: ${e.toString()}',
        );
      }

      if (kDebugMode) {
        print('Download error: $e');
      }

      return null;
    } finally {
      _activeDownloads.remove(taskId);
    }
  }

  Future<void> _extractArchive(String archivePath, String extractPath) async {
    final file = File(archivePath);
    final bytes = await file.readAsBytes();

    // Create extract directory
    final extractDir = Directory(extractPath);
    if (!await extractDir.exists()) {
      await extractDir.create(recursive: true);
    }

    // Extract based on file extension
    if (archivePath.endsWith('.zip')) {
      final archive = ZipDecoder().decodeBytes(bytes);
      for (final file in archive) {
        final filename = file.name;
        final filePath = '$extractPath/$filename';

        if (file.isFile) {
          final outFile = File(filePath);
          await outFile.create(recursive: true);
          await outFile.writeAsBytes(file.content as List<int>);
        } else {
          await Directory(filePath).create(recursive: true);
        }
      }
    } else if (archivePath.endsWith('.tar.gz') ||
        archivePath.endsWith('.tar')) {
      // Handle tar archives
      Archive archive;
      if (archivePath.endsWith('.tar.gz')) {
        final gzipBytes = GZipDecoder().decodeBytes(bytes);
        archive = TarDecoder().decodeBytes(gzipBytes);
      } else {
        archive = TarDecoder().decodeBytes(bytes);
      }

      for (final file in archive) {
        final filename = file.name;
        final filePath = '$extractPath/$filename';

        if (file.isFile) {
          final outFile = File(filePath);
          await outFile.create(recursive: true);
          await outFile.writeAsBytes(file.content as List<int>);
        } else {
          await Directory(filePath).create(recursive: true);
        }
      }
    }
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  bool isDownloading(String taskId) {
    return _activeDownloads.containsKey(taskId);
  }

  void cancelAllDownloads() {
    _activeDownloads.clear();
  }
}
