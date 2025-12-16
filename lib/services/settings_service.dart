import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends ChangeNotifier {
  static const _autoUpdateKey = 'auto_update_enabled';
  static const _lastUpdateCheckKey = 'update_last_check_ms';

  SharedPreferences? _prefs;
  bool _autoUpdate = true;

  SettingsService() {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    _autoUpdate = _prefs?.getBool(_autoUpdateKey) ?? true;
    notifyListeners();
  }

  bool get autoUpdate => _autoUpdate;

  Future<void> setAutoUpdate(bool value) async {
    _autoUpdate = value;
    await _prefs?.setBool(_autoUpdateKey, value);
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
