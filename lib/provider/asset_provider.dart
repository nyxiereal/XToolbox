import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/asset.dart';

class AssetProvider extends ChangeNotifier {
  List<Asset> _assets = [];
  bool _isLoading = false;
  String? _error;

  List<Asset> get assets => _assets;
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<Asset> getAssetsByCategory(String category) {
    return _assets.where((asset) => asset.category == category).toList();
  }

  Asset? getAssetById(String id) {
    try {
      return _assets.firstWhere((asset) => asset.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> loadAssets() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final String jsonString = await rootBundle.loadString(
        'assets/asset_list.json',
      );
      final List<dynamic> jsonData = json.decode(jsonString);
      _assets = jsonData.map((json) => Asset.fromJson(json)).toList();
      _error = null;
    } catch (e) {
      _error = 'Failed to load assets: $e';
      _assets = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
