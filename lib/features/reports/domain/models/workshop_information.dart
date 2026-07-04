import 'package:freezed_annotation/freezed_annotation.dart';

part 'workshop_information.freezed.dart';
part 'workshop_information.g.dart';

@freezed
class WorkshopInformation with _$WorkshopInformation {
  const factory WorkshopInformation({
    required String workshopName,
    @Default('') String logo,
    @Default('') String address,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String website,
    @Default('') String gstNumber,
    @Default('') String technicianName,
  }) = _WorkshopInformation;

  factory WorkshopInformation.fromJson(Map<String, dynamic> json) =>
      _$WorkshopInformationFromJson(json);
}
