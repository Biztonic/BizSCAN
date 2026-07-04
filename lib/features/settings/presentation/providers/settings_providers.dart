import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/repositories/settings_repository.dart';

part 'settings_providers.g.dart';

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  return sl<SettingsRepository>();
}
