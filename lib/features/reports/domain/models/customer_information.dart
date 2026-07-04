import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_information.freezed.dart';
part 'customer_information.g.dart';

@freezed
class CustomerInformation with _$CustomerInformation {
  const factory CustomerInformation({
    required String customerName,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String address,
  }) = _CustomerInformation;

  factory CustomerInformation.fromJson(Map<String, dynamic> json) =>
      _$CustomerInformationFromJson(json);
}
