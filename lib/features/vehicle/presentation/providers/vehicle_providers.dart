import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/di_service.dart';
import '../../domain/repositories/vehicle_repository.dart';
import '../../domain/usecases/create_vehicle.dart';
import '../../domain/usecases/update_vehicle.dart';
import '../../domain/usecases/delete_vehicle.dart';
import '../../domain/usecases/get_vehicle.dart';
import '../../domain/usecases/search_vehicle.dart';

part 'vehicle_providers.g.dart';

@riverpod
VehicleRepository vehicleRepository(VehicleRepositoryRef ref) {
  return sl<VehicleRepository>();
}

@riverpod
CreateVehicle createVehicleUseCase(CreateVehicleUseCaseRef ref) {
  return CreateVehicle(ref.watch(vehicleRepositoryProvider));
}

@riverpod
UpdateVehicle updateVehicleUseCase(UpdateVehicleUseCaseRef ref) {
  return UpdateVehicle(ref.watch(vehicleRepositoryProvider));
}

@riverpod
DeleteVehicle deleteVehicleUseCase(DeleteVehicleUseCaseRef ref) {
  return DeleteVehicle(ref.watch(vehicleRepositoryProvider));
}

@riverpod
GetVehicle getVehicleUseCase(GetVehicleUseCaseRef ref) {
  return GetVehicle(ref.watch(vehicleRepositoryProvider));
}

@riverpod
SearchVehicle searchVehicleUseCase(SearchVehicleUseCaseRef ref) {
  return SearchVehicle(ref.watch(vehicleRepositoryProvider));
}
