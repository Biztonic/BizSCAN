import 'dart:convert';
import 'package:hive_ce/hive_ce.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/services/logging_service.dart';
import '../../domain/models/settings_model.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final Box<String> _settingsBox;
  final Box<String> _syncQueueBox;
  final FirestoreService _firestoreService;
  final LoggingService _logger;

  static const _settingsKey = 'user_settings';

  SettingsRepositoryImpl(
    this._settingsBox,
    this._syncQueueBox,
    this._firestoreService,
    this._logger,
  );

  SettingsModel _readFromBoxOrDefault() {
    final jsonStr = _settingsBox.get(_settingsKey);
    if (jsonStr != null) {
      try {
        return SettingsModel.fromJson(json.decode(jsonStr));
      } catch (e) {
        _logger.error('Error deserializing settings: $e');
      }
    }
    return const SettingsModel(
      language: 'en',
      theme: 'system',
      distanceUnit: 'metric',
      temperatureUnit: 'celsius',
      fuelUnit: 'liters',
      notifications: true,
    );
  }

  @override
  Future<Result<SettingsModel>> saveSettings(SettingsModel settings) async {
    try {
      final jsonStr = json.encode(settings.toJson());
      await _settingsBox.put(_settingsKey, jsonStr);

      final queueItem = {
        'id': _settingsKey,
        'type': 'user_settings',
        'action': 'update',
        'data': settings.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
      await _syncQueueBox.put('settings_$_settingsKey', json.encode(queueItem));

      return Result.success(settings);
    } catch (e) {
      return Result.failure(CacheFailure('Local write failed: $e'));
    }
  }

  @override
  Future<Result<SettingsModel>> getSettings() async {
    try {
      return Result.success(_readFromBoxOrDefault());
    } catch (e) {
      return Result.failure(CacheFailure('Local read failed: $e'));
    }
  }

  @override
  Stream<SettingsModel> watchSettings() async* {
    yield _readFromBoxOrDefault();
    await for (final _ in _settingsBox.watch()) {
      yield _readFromBoxOrDefault();
    }
  }

  @override
  Future<Result<void>> syncSettings() async {
    try {
      final result = await _firestoreService.getDocument('user_settings', _settingsKey);
      if (result.isSuccess) {
        final cloudDoc = result.getOrNull;
        if (cloudDoc != null) {
          final settings = SettingsModel.fromJson(cloudDoc);
          if (!_syncQueueBox.containsKey('settings_$_settingsKey')) {
            await _settingsBox.put(_settingsKey, json.encode(settings.toJson()));
          }
        }
      }
      return const Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure('Sync settings failed: $e'));
    }
  }
}
