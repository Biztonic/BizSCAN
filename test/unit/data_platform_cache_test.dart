import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bizscan/core/utils/cache_manager.dart';

void main() {
  group('CacheManager Unit Tests', () {
    late SharedPreferences prefs;
    late CacheManager cacheManager;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      cacheManager = CacheManager(prefs);
    });

    test('should save to cache and retrieve value', () {
      cacheManager.set<String>(
        key: 'username',
        value: 'rohan_sharma',
        ttl: const Duration(minutes: 5),
      );

      final val = cacheManager.get<String>('username');
      expect(val, 'rohan_sharma');
    });

    test('should fall back to disk cache if memory cache is empty', () async {
      // Direct mock write to SharedPreferences simulating disk cache hydration
      await prefs.setString(
        'cache_token',
        '{"data":"session_123456","expiry":"${DateTime.now().add(const Duration(minutes: 5)).toIso8601String()}"}',
      );

      final val = cacheManager.get<String>('token');
      expect(val, 'session_123456');
    });

    test('should return null and invalidate if cache entry has expired (TTL)', () async {
      cacheManager.set<String>(
        key: 'temp_key',
        value: 'expired_data',
        ttl: const Duration(milliseconds: 1),
      );

      // Wait for expiration
      await Future.delayed(const Duration(milliseconds: 5));

      final val = cacheManager.get<String>('temp_key');
      expect(val, isNull);
    });

    test('should invalidate cache keys correctly', () {
      cacheManager.set<String>(
        key: 'api_data',
        value: 'success_response',
        ttl: const Duration(minutes: 10),
      );

      cacheManager.invalidate('api_data');
      final val = cacheManager.get<String>('api_data');
      expect(val, isNull);
    });
  });
}
