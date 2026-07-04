import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheEntry<T> {
  final T data;
  final DateTime expiryTime;

  CacheEntry({required this.data, required this.expiryTime});

  bool get isExpired => DateTime.now().isAfter(expiryTime);
}

class CacheManager {
  final SharedPreferences _prefs;
  final Map<String, CacheEntry<dynamic>> _memoryCache = {};

  CacheManager(this._prefs);

  void set<T>({
    required String key,
    required T value,
    required Duration ttl,
  }) {
    final expiryTime = DateTime.now().add(ttl);
    _memoryCache[key] = CacheEntry(data: value, expiryTime: expiryTime);
    
    try {
      final diskData = {
        'data': value,
        'expiry': expiryTime.toIso8601String(),
      };
      _prefs.setString('cache_$key', json.encode(diskData));
    } catch (_) {
      // Silently catch disk cache serialization failures
    }
  }

  T? get<T>(String key) {
    final memEntry = _memoryCache[key];
    if (memEntry != null) {
      if (!memEntry.isExpired) {
        return memEntry.data as T;
      } else {
        _memoryCache.remove(key);
      }
    }

    final diskJson = _prefs.getString('cache_$key');
    if (diskJson != null) {
      try {
        final diskMap = json.decode(diskJson) as Map<String, dynamic>;
        final expiry = DateTime.parse(diskMap['expiry'] as String);
        if (DateTime.now().isBefore(expiry)) {
          final data = diskMap['data'] as T;
          _memoryCache[key] = CacheEntry(data: data, expiryTime: expiry);
          return data;
        } else {
          _prefs.remove('cache_$key');
        }
      } catch (_) {
        _prefs.remove('cache_$key');
      }
    }

    return null;
  }

  void invalidate(String key) {
    _memoryCache.remove(key);
    _prefs.remove('cache_$key');
  }

  void clear() {
    _memoryCache.clear();
    final keys = _prefs.getKeys().where((k) => k.startsWith('cache_')).toList();
    for (final k in keys) {
      _prefs.remove(k);
    }
  }
}
