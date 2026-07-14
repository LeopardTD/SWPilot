import 'package:shared_preferences/shared_preferences.dart';

/// Lightweight wrapper around `SharedPreferences` to manage asynchronous key-value persistence.
class StorageService {
  StorageService._();

  static SharedPreferences? _prefs;

  /// Initializes the storage persistence framework.
  static Future<void> initialize() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Read a cached object of type T associated with the given key.
  static T? read<T>(String key) {
    if (_prefs == null) {
      throw StateError(
        'StorageService must be initialized before reading values.',
      );
    }
    if (T == String) {
      return _prefs!.getString(key) as T?;
    } else if (T == int) {
      return _prefs!.getInt(key) as T?;
    } else if (T == double) {
      return _prefs!.getDouble(key) as T?;
    } else if (T == bool) {
      return _prefs!.getBool(key) as T?;
    } else if (T == List<String>) {
      return _prefs!.getStringList(key) as T?;
    }
    return _prefs!.get(key) as T?;
  }

  /// Write a cached object of type T associated with the given key.
  static Future<bool> write<T>(String key, T value) async {
    if (_prefs == null) {
      throw StateError(
        'StorageService must be initialized before writing values.',
      );
    }
    if (value is String) {
      return _prefs!.setString(key, value);
    } else if (value is int) {
      return _prefs!.setInt(key, value);
    } else if (value is double) {
      return _prefs!.setDouble(key, value);
    } else if (value is bool) {
      return _prefs!.setBool(key, value);
    } else if (value is List<String>) {
      return _prefs!.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported storage type: ${value.runtimeType}');
    }
  }

  /// Remove the cached value linked to a specific key.
  static Future<bool> remove(String key) async {
    if (_prefs == null) {
      throw StateError(
        'StorageService must be initialized before removing keys.',
      );
    }
    return _prefs!.remove(key);
  }

  /// Wipe all cached configurations in local storage.
  static Future<bool> clear() async {
    if (_prefs == null) {
      throw StateError(
        'StorageService must be initialized before clearing data.',
      );
    }
    return _prefs!.clear();
  }
}
