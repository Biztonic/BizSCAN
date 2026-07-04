import '../models/scan_session.dart';
import '../repositories/scan_repository.dart';

class WatchHistory {
  final ScanRepository repository;

  WatchHistory(this.repository);

  Stream<List<ScanSession>> call() {
    return repository.watchHistory();
  }
}
