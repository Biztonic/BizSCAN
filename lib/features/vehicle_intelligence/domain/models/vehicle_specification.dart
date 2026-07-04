import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_specification.freezed.dart';
part 'vehicle_specification.g.dart';

@freezed
class VehicleSpecification with _$VehicleSpecification {
  const factory VehicleSpecification({
    @Default('4.0 Litres (5W-30)') String engineOilCapacity,
    @Default('6.5 Litres') String coolantCapacity,
    @Default('7.2 Litres (ATF WS)') String transmissionFluidCapacity,
    @Default('DOT 4') String brakeFluidSpecification,
    @Default('Electric Power Steering (EPS)') String powerSteeringFluid,
    @Default('50 Litres') String fuelTankCapacity,
    @Default('12V 60Ah') String batteryCapacity,
    @Default('32 PSI (2.2 Bar)') String tyrePressureFront,
    @Default('30 PSI (2.1 Bar)') String tyrePressureRear,
    @Default('205/55 R16') String wheelSize,
    @Default(750) int idleRPM,
    @Default(6500) int redlineRPM,
  }) = _VehicleSpecification;

  factory VehicleSpecification.fromJson(Map<String, dynamic> json) =>
      _$VehicleSpecificationFromJson(json);
}
