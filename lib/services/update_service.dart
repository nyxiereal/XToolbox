import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateInfo {
  final String latestVersion;
  final bool updateAvailable;

  UpdateInfo({required this.latestVersion, required this.updateAvailable});
}

/// Simple update checker that queries GitHub releases for the repo
class UpdateService extends ChangeNotifier {
  bool _checking = false;
  UpdateInfo? _info;
  String? _error;
  SharedPreferences? _prefs;

  static const _lastCheckKey = 'update_last_check_ms';
  static const Duration _minInterval = Duration(hours: 12);

  bool get checking => _checking;
  UpdateInfo? get info => _info;
  String? get error => _error;

  /// Checks GitHub releases for `owner/repo` and compares with [currentVersion].
  /// Returns the resolved [UpdateInfo] or throws on HTTP errors.
  Future<UpdateInfo?> checkForUpdate({
    required String owner,
    required String repo,
    required String currentVersion,
    bool force = false,
  }) async {
    _checking = true;
    _error = null;
    notifyListeners();

    _prefs ??= await SharedPreferences.getInstance();
    final lastMs = _prefs?.getInt(_lastCheckKey);
    if (!force && lastMs != null) {
      final last = DateTime.fromMillisecondsSinceEpoch(lastMs);
      if (DateTime.now().difference(last) < _minInterval) {
        // Too soon to check again; return cached info (if any)
        _checking = false;
        notifyListeners();
        return _info;
      }
    }

    try {
      final url = Uri.https(
        'api.github.com',
        '/repos/$owner/$repo/releases/latest',
      );
      final resp = await http
          .get(url, headers: {'Accept': 'application/vnd.github.v3+json'})
          .timeout(const Duration(seconds: 8));
      if (resp.statusCode != 200) {
        _error = 'HTTP ${resp.statusCode}';
        _checking = false;
        // save last check time even on HTTP error to avoid hammering
        await _prefs?.setInt(_lastCheckKey, DateTime.now().millisecondsSinceEpoch);
        notifyListeners();
        return null;
      }

      final data = json.decode(resp.body) as Map<String, dynamic>;
      final String tag = (data['tag_name'] ?? data['name'] ?? '') as String;
      final latest = tag.startsWith('v') ? tag.substring(1) : tag;
      final available = _isNewer(latest, currentVersion);
      _info = UpdateInfo(latestVersion: latest, updateAvailable: available);
      await _prefs?.setInt(_lastCheckKey, DateTime.now().millisecondsSinceEpoch);
      _checking = false;
      notifyListeners();
      return _info;
    } catch (e) {
      _error = e.toString();
      _checking = false;
      // record attempt time on exception too
      await _prefs?.setInt(_lastCheckKey, DateTime.now().millisecondsSinceEpoch);
      notifyListeners();
      return null;
    }
  }

  bool _isNewer(String a, String b) {
    // naive semver-ish compare: split numeric parts and compare.
    final pa = a
        .split(RegExp(r'[^0-9]+'))
        .where((s) => s.isNotEmpty)
        .map(int.parse)
        .toList();
    final pb = b
        .split(RegExp(r'[^0-9]+'))
        .where((s) => s.isNotEmpty)
        .map(int.parse)
        .toList();
    final n = pa.length > pb.length ? pa.length : pb.length;
    for (var i = 0; i < n; i++) {
      final ai = i < pa.length ? pa[i] : 0;
      final bi = i < pb.length ? pb[i] : 0;
      if (ai > bi) return true;
      if (ai < bi) return false;
    }
    return false;
  }
}

// stub
