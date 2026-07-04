import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../services/di_service.dart';
import '../../domain/repositories/sync_repository.dart';
import '../../domain/usecases/sync_now.dart';

part 'sync_providers.g.dart';

@riverpod
SyncRepository syncRepository(SyncRepositoryRef ref) {
  return sl<SyncRepository>();
}

@riverpod
SyncNow syncNowUseCase(SyncNowUseCaseRef ref) {
  return SyncNow(ref.watch(syncRepositoryProvider));
}
