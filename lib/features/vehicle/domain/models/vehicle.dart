import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String vehicleId,
    required String ownerId,
    required String nickname,
    required String manufacturer,
    required String model,
    required int year,
    required String fuelType,
    required double engineCapacity,
    required String vin,
    required String registrationNumber,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
