import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PingResult {
  final String host;
  final bool ok;
  final int? ms;
  final String? error;

  PingResult({required this.host, required this.ok, this.ms, this.error});
}

class NetworkCheckerService extends ChangeNotifier {
  final Map<String, PingResult> _results = {};
  bool _checking = false;

  bool get checking => _checking;
  Map<String, PingResult> get results => Map.unmodifiable(_results);

  /// Checks the given list of hosts using HTTP HEAD and measures time.
  Future<void> checkHosts(
    List<String> hosts, {
    Duration timeout = const Duration(seconds: 6),
  }) async {
    _checking = true;
    notifyListeners();
    final futures = hosts.map((h) => _ping(h, timeout));
    await Future.wait(futures);
    _checking = false;
    notifyListeners();
  }

  Future<void> _ping(String host, Duration timeout) async {
    final start = DateTime.now();
    try {
      final uri = Uri.parse(host);
      // Use HEAD where possible to be light-weight, fallback to GET.
      final resp = await http.head(uri).timeout(timeout);
      final ms = DateTime.now().difference(start).inMilliseconds;
      _results[host] = PingResult(
        host: host,
        ok: resp.statusCode >= 200 && resp.statusCode < 400,
        ms: ms,
      );
    } catch (e) {
      // try GET as a fallback
      try {
        final uri = Uri.parse(host);
        final resp = await http.get(uri).timeout(timeout);
        final ms = DateTime.now().difference(start).inMilliseconds;
        _results[host] = PingResult(
          host: host,
          ok: resp.statusCode >= 200 && resp.statusCode < 400,
          ms: ms,
        );
      } catch (e2) {
        _results[host] = PingResult(
          host: host,
          ok: false,
          error: e2.toString(),
        );
      }
    }
  }
}
