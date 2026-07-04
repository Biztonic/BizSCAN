import '../../../../core/errors/result.dart';
import '../models/settings_model.dart';

abstract class SettingsRepository {
  Future<Result<SettingsModel>> saveSettings(SettingsModel settings);
  Future<Result<SettingsModel>> getSettings();
  Stream<SettingsModel> watchSettings();
  Future<Result<void>> syncSettings();
}
