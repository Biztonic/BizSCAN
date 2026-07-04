import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_profile.freezed.dart';
part 'vehicle_profile.g.dart';

@freezed
class VehicleProfile with _$VehicleProfile {
  const factory VehicleProfile({
    required String vehicleId,
    required String vin,
    required String manufacturer,
    required String brand,
    required String model,
    @Default('') String generation,
    @Default('') String variant,
    @Default('Sedan') String bodyType,
    required int modelYear,
    required String engineCode,
    @Default('In-Line 4') String engineType,
    @Default('2.0L') String displacement,
    @Default('Petrol') String fuelType,
    @Default('Automatic') String transmission,
    @Default('FWD') String drivetrain,
    @Default('Euro 6') String emissionStandard,
    @Default('ISO 15765-4 (CAN 11bit 500k)') String obdProtocol,
    @Default(['ECU_ENGINE', 'ECU_TRANSMISSION', 'ECU_ABS', 'ECU_AIRBAG']) List<String> ecuList,
    @Default('12V Lead-Acid') String batteryType,
    @Default('India') String countryOfOrigin,
    required DateTime createdAt,
  }) = _VehicleProfile;

  factory VehicleProfile.fromJson(Map<String, dynamic> json) =>
      _$VehicleProfileFromJson(json);
}
