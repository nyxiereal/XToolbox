import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends ChangeNotifier {
  static const _autoUpdateKey = 'auto_update_enabled';
  static const _lastUpdateCheckKey = 'update_last_check_ms';
  static const _downloadPathKey = 'download_path';
  static const _httpsOnlyKey = 'https_only_mode';
  static const _bandwidthLimitKey = 'bandwidth_limit_kbps';
  static const _installPreferenceKey = 'install_preference_order';

  SharedPreferences? _prefs;
  bool _autoUpdate = true;
  String? _downloadPath;
  bool _httpsOnly = false;
  int? _bandwidthLimit; // in KB/s, null = unlimited
  List<String> _installPreference = [
    'direct_download',
    'powershell',
    'winget',
    'chocolatey',
    'scoop',
  ];

  SettingsService() {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    _autoUpdate = _prefs?.getBool(_autoUpdateKey) ?? true;
    _downloadPath = _prefs?.getString(_downloadPathKey);
    _httpsOnly = _prefs?.getBool(_httpsOnlyKey) ?? false;
    _bandwidthLimit = _prefs?.getInt(_bandwidthLimitKey);

    final prefOrder = _prefs?.getStringList(_installPreferenceKey);
    if (prefOrder != null && prefOrder.isNotEmpty) {
      _installPreference = prefOrder;
    }

    notifyListeners();
  }

  bool get autoUpdate => _autoUpdate;
  String? get downloadPath => _downloadPath;
  bool get httpsOnly => _httpsOnly;
  int? get bandwidthLimit => _bandwidthLimit;
  List<String> get installPreference => List.unmodifiable(_installPreference);

  Future<void> setAutoUpdate(bool value) async {
    _autoUpdate = value;
    await _prefs?.setBool(_autoUpdateKey, value);
    notifyListeners();
  }

  Future<void> setDownloadPath(String? path) async {
    _downloadPath = path;
    if (path == null) {
      await _prefs?.remove(_downloadPathKey);
    } else {
      await _prefs?.setString(_downloadPathKey, path);
    }
    notifyListeners();
  }

  Future<void> setHttpsOnly(bool value) async {
    _httpsOnly = value;
    await _prefs?.setBool(_httpsOnlyKey, value);
    notifyListeners();
  }

  Future<void> setBandwidthLimit(int? kbps) async {
    _bandwidthLimit = kbps;
    if (kbps == null) {
      await _prefs?.remove(_bandwidthLimitKey);
    } else {
      await _prefs?.setInt(_bandwidthLimitKey, kbps);
    }
    notifyListeners();
  }

  Future<void> setInstallPreference(List<String> order) async {
    _installPreference = order;
    await _prefs?.setStringList(_installPreferenceKey, order);
    notifyListeners();
  }

  DateTime? get lastUpdateCheck {
    final ms = _prefs?.getInt(_lastUpdateCheckKey);
    if (ms == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(ms);
  }

  Future<void> setLastUpdateCheck(DateTime dt) async {
    await _prefs?.setInt(_lastUpdateCheckKey, dt.millisecondsSinceEpoch);
    notifyListeners();
  }
}
