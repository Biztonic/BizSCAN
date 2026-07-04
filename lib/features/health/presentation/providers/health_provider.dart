import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/repositories/health_repository.dart';

part 'health_provider.g.dart';

@riverpod
class HealthStateNotifier extends _$HealthStateNotifier {
  late final HealthRepository _repository;

  @override
  FutureOr<String> build() {
    _repository = sl<HealthRepository>();
    return 'No analysis run. Connect OBD scanner first.';
  }

  Future<void> runAnalysis(List<String> dtcs, Map<String, double> sensorData) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await _repository.analyzeVehicleHealth(dtcs, sensorData);
      return result.fold(
        (value) => value,
        (failure) => throw Exception(failure.message),
      );
    });
  }
}
