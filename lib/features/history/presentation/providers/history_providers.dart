import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/repositories/scan_repository.dart';
import '../../domain/usecases/create_scan.dart';
import '../../domain/usecases/finish_scan.dart';
import '../../domain/usecases/watch_history.dart';

part 'history_providers.g.dart';

@riverpod
ScanRepository scanRepository(ScanRepositoryRef ref) {
  return sl<ScanRepository>();
}

@riverpod
CreateScan createScanUseCase(CreateScanUseCaseRef ref) {
  return CreateScan(ref.watch(scanRepositoryProvider));
}

@riverpod
FinishScan finishScanUseCase(FinishScanUseCaseRef ref) {
  return FinishScan(ref.watch(scanRepositoryProvider));
}

@riverpod
WatchHistory watchHistoryUseCase(WatchHistoryUseCaseRef ref) {
  return WatchHistory(ref.watch(scanRepositoryProvider));
}
