import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/repositories/health_repository.dart';
import '../../domain/usecases/save_health.dart';

part 'health_providers.g.dart';

@riverpod
HealthRepository healthRepository(HealthRepositoryRef ref) {
  return sl<HealthRepository>();
}

@riverpod
SaveHealth saveHealthUseCase(SaveHealthUseCaseRef ref) {
  return SaveHealth(ref.watch(healthRepositoryProvider));
}
