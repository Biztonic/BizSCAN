import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/repositories/pid_repository.dart';
import '../../domain/usecases/save_pid.dart';

part 'obd_providers.g.dart';

@riverpod
PidRepository pidRepository(PidRepositoryRef ref) {
  return sl<PidRepository>();
}

@riverpod
SavePid savePidUseCase(SavePidUseCaseRef ref) {
  return SavePid(ref.watch(pidRepositoryProvider));
}
