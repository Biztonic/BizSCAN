// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnostic_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiagnosticReport _$DiagnosticReportFromJson(Map<String, dynamic> json) {
  return _DiagnosticReport.fromJson(json);
}

/// @nodoc
mixin _$DiagnosticReport {
  String get reportId => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get reportNumber => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  String get generatedBy => throw _privateConstructorUsedError;
  String get reportType => throw _privateConstructorUsedError;
  String get reportVersion => throw _privateConstructorUsedError;
  String get reportStatus =>
      throw _privateConstructorUsedError; // 'draft', 'finalized', 'signed', 'archived'
  CustomerInformation? get customerInfo => throw _privateConstructorUsedError;
  WorkshopInformation? get workshopInfo => throw _privateConstructorUsedError;
  List<ReportSection> get sections => throw _privateConstructorUsedError;
  String get digitalHash => throw _privateConstructorUsedError;
  String get technicianSignature => throw _privateConstructorUsedError;
  String get customerSignature => throw _privateConstructorUsedError;

  /// Serializes this DiagnosticReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosticReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosticReportCopyWith<DiagnosticReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticReportCopyWith<$Res> {
  factory $DiagnosticReportCopyWith(
    DiagnosticReport value,
    $Res Function(DiagnosticReport) then,
  ) = _$DiagnosticReportCopyWithImpl<$Res, DiagnosticReport>;
  @useResult
  $Res call({
    String reportId,
    String vehicleId,
    String sessionId,
    String reportNumber,
    DateTime generatedAt,
    String generatedBy,
    String reportType,
    String reportVersion,
    String reportStatus,
    CustomerInformation? customerInfo,
    WorkshopInformation? workshopInfo,
    List<ReportSection> sections,
    String digitalHash,
    String technicianSignature,
    String customerSignature,
  });

  $CustomerInformationCopyWith<$Res>? get customerInfo;
  $WorkshopInformationCopyWith<$Res>? get workshopInfo;
}

/// @nodoc
class _$DiagnosticReportCopyWithImpl<$Res, $Val extends DiagnosticReport>
    implements $DiagnosticReportCopyWith<$Res> {
  _$DiagnosticReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosticReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? vehicleId = null,
    Object? sessionId = null,
    Object? reportNumber = null,
    Object? generatedAt = null,
    Object? generatedBy = null,
    Object? reportType = null,
    Object? reportVersion = null,
    Object? reportStatus = null,
    Object? customerInfo = freezed,
    Object? workshopInfo = freezed,
    Object? sections = null,
    Object? digitalHash = null,
    Object? technicianSignature = null,
    Object? customerSignature = null,
  }) {
    return _then(
      _value.copyWith(
            reportId:
                null == reportId
                    ? _value.reportId
                    : reportId // ignore: cast_nullable_to_non_nullable
                        as String,
            vehicleId:
                null == vehicleId
                    ? _value.vehicleId
                    : vehicleId // ignore: cast_nullable_to_non_nullable
                        as String,
            sessionId:
                null == sessionId
                    ? _value.sessionId
                    : sessionId // ignore: cast_nullable_to_non_nullable
                        as String,
            reportNumber:
                null == reportNumber
                    ? _value.reportNumber
                    : reportNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            generatedAt:
                null == generatedAt
                    ? _value.generatedAt
                    : generatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            generatedBy:
                null == generatedBy
                    ? _value.generatedBy
                    : generatedBy // ignore: cast_nullable_to_non_nullable
                        as String,
            reportType:
                null == reportType
                    ? _value.reportType
                    : reportType // ignore: cast_nullable_to_non_nullable
                        as String,
            reportVersion:
                null == reportVersion
                    ? _value.reportVersion
                    : reportVersion // ignore: cast_nullable_to_non_nullable
                        as String,
            reportStatus:
                null == reportStatus
                    ? _value.reportStatus
                    : reportStatus // ignore: cast_nullable_to_non_nullable
                        as String,
            customerInfo:
                freezed == customerInfo
                    ? _value.customerInfo
                    : customerInfo // ignore: cast_nullable_to_non_nullable
                        as CustomerInformation?,
            workshopInfo:
                freezed == workshopInfo
                    ? _value.workshopInfo
                    : workshopInfo // ignore: cast_nullable_to_non_nullable
                        as WorkshopInformation?,
            sections:
                null == sections
                    ? _value.sections
                    : sections // ignore: cast_nullable_to_non_nullable
                        as List<ReportSection>,
            digitalHash:
                null == digitalHash
                    ? _value.digitalHash
                    : digitalHash // ignore: cast_nullable_to_non_nullable
                        as String,
            technicianSignature:
                null == technicianSignature
                    ? _value.technicianSignature
                    : technicianSignature // ignore: cast_nullable_to_non_nullable
                        as String,
            customerSignature:
                null == customerSignature
                    ? _value.customerSignature
                    : customerSignature // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of DiagnosticReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerInformationCopyWith<$Res>? get customerInfo {
    if (_value.customerInfo == null) {
      return null;
    }

    return $CustomerInformationCopyWith<$Res>(_value.customerInfo!, (value) {
      return _then(_value.copyWith(customerInfo: value) as $Val);
    });
  }

  /// Create a copy of DiagnosticReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkshopInformationCopyWith<$Res>? get workshopInfo {
    if (_value.workshopInfo == null) {
      return null;
    }

    return $WorkshopInformationCopyWith<$Res>(_value.workshopInfo!, (value) {
      return _then(_value.copyWith(workshopInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiagnosticReportImplCopyWith<$Res>
    implements $DiagnosticReportCopyWith<$Res> {
  factory _$$DiagnosticReportImplCopyWith(
    _$DiagnosticReportImpl value,
    $Res Function(_$DiagnosticReportImpl) then,
  ) = __$$DiagnosticReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String reportId,
    String vehicleId,
    String sessionId,
    String reportNumber,
    DateTime generatedAt,
    String generatedBy,
    String reportType,
    String reportVersion,
    String reportStatus,
    CustomerInformation? customerInfo,
    WorkshopInformation? workshopInfo,
    List<ReportSection> sections,
    String digitalHash,
    String technicianSignature,
    String customerSignature,
  });

  @override
  $CustomerInformationCopyWith<$Res>? get customerInfo;
  @override
  $WorkshopInformationCopyWith<$Res>? get workshopInfo;
}

/// @nodoc
class __$$DiagnosticReportImplCopyWithImpl<$Res>
    extends _$DiagnosticReportCopyWithImpl<$Res, _$DiagnosticReportImpl>
    implements _$$DiagnosticReportImplCopyWith<$Res> {
  __$$DiagnosticReportImplCopyWithImpl(
    _$DiagnosticReportImpl _value,
    $Res Function(_$DiagnosticReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiagnosticReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? vehicleId = null,
    Object? sessionId = null,
    Object? reportNumber = null,
    Object? generatedAt = null,
    Object? generatedBy = null,
    Object? reportType = null,
    Object? reportVersion = null,
    Object? reportStatus = null,
    Object? customerInfo = freezed,
    Object? workshopInfo = freezed,
    Object? sections = null,
    Object? digitalHash = null,
    Object? technicianSignature = null,
    Object? customerSignature = null,
  }) {
    return _then(
      _$DiagnosticReportImpl(
        reportId:
            null == reportId
                ? _value.reportId
                : reportId // ignore: cast_nullable_to_non_nullable
                    as String,
        vehicleId:
            null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                    as String,
        sessionId:
            null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                    as String,
        reportNumber:
            null == reportNumber
                ? _value.reportNumber
                : reportNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        generatedAt:
            null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        generatedBy:
            null == generatedBy
                ? _value.generatedBy
                : generatedBy // ignore: cast_nullable_to_non_nullable
                    as String,
        reportType:
            null == reportType
                ? _value.reportType
                : reportType // ignore: cast_nullable_to_non_nullable
                    as String,
        reportVersion:
            null == reportVersion
                ? _value.reportVersion
                : reportVersion // ignore: cast_nullable_to_non_nullable
                    as String,
        reportStatus:
            null == reportStatus
                ? _value.reportStatus
                : reportStatus // ignore: cast_nullable_to_non_nullable
                    as String,
        customerInfo:
            freezed == customerInfo
                ? _value.customerInfo
                : customerInfo // ignore: cast_nullable_to_non_nullable
                    as CustomerInformation?,
        workshopInfo:
            freezed == workshopInfo
                ? _value.workshopInfo
                : workshopInfo // ignore: cast_nullable_to_non_nullable
                    as WorkshopInformation?,
        sections:
            null == sections
                ? _value._sections
                : sections // ignore: cast_nullable_to_non_nullable
                    as List<ReportSection>,
        digitalHash:
            null == digitalHash
                ? _value.digitalHash
                : digitalHash // ignore: cast_nullable_to_non_nullable
                    as String,
        technicianSignature:
            null == technicianSignature
                ? _value.technicianSignature
                : technicianSignature // ignore: cast_nullable_to_non_nullable
                    as String,
        customerSignature:
            null == customerSignature
                ? _value.customerSignature
                : customerSignature // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosticReportImpl implements _DiagnosticReport {
  const _$DiagnosticReportImpl({
    required this.reportId,
    required this.vehicleId,
    required this.sessionId,
    required this.reportNumber,
    required this.generatedAt,
    this.generatedBy = 'Senior Technician',
    this.reportType = 'Comprehensive Diagnostic',
    this.reportVersion = 'v1.0',
    this.reportStatus = 'draft',
    this.customerInfo,
    this.workshopInfo,
    final List<ReportSection> sections = const [],
    this.digitalHash = '',
    this.technicianSignature = '',
    this.customerSignature = '',
  }) : _sections = sections;

  factory _$DiagnosticReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosticReportImplFromJson(json);

  @override
  final String reportId;
  @override
  final String vehicleId;
  @override
  final String sessionId;
  @override
  final String reportNumber;
  @override
  final DateTime generatedAt;
  @override
  @JsonKey()
  final String generatedBy;
  @override
  @JsonKey()
  final String reportType;
  @override
  @JsonKey()
  final String reportVersion;
  @override
  @JsonKey()
  final String reportStatus;
  // 'draft', 'finalized', 'signed', 'archived'
  @override
  final CustomerInformation? customerInfo;
  @override
  final WorkshopInformation? workshopInfo;
  final List<ReportSection> _sections;
  @override
  @JsonKey()
  List<ReportSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  @JsonKey()
  final String digitalHash;
  @override
  @JsonKey()
  final String technicianSignature;
  @override
  @JsonKey()
  final String customerSignature;

  @override
  String toString() {
    return 'DiagnosticReport(reportId: $reportId, vehicleId: $vehicleId, sessionId: $sessionId, reportNumber: $reportNumber, generatedAt: $generatedAt, generatedBy: $generatedBy, reportType: $reportType, reportVersion: $reportVersion, reportStatus: $reportStatus, customerInfo: $customerInfo, workshopInfo: $workshopInfo, sections: $sections, digitalHash: $digitalHash, technicianSignature: $technicianSignature, customerSignature: $customerSignature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosticReportImpl &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.reportNumber, reportNumber) ||
                other.reportNumber == reportNumber) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.generatedBy, generatedBy) ||
                other.generatedBy == generatedBy) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            (identical(other.reportVersion, reportVersion) ||
                other.reportVersion == reportVersion) &&
            (identical(other.reportStatus, reportStatus) ||
                other.reportStatus == reportStatus) &&
            (identical(other.customerInfo, customerInfo) ||
                other.customerInfo == customerInfo) &&
            (identical(other.workshopInfo, workshopInfo) ||
                other.workshopInfo == workshopInfo) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.digitalHash, digitalHash) ||
                other.digitalHash == digitalHash) &&
            (identical(other.technicianSignature, technicianSignature) ||
                other.technicianSignature == technicianSignature) &&
            (identical(other.customerSignature, customerSignature) ||
                other.customerSignature == customerSignature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reportId,
    vehicleId,
    sessionId,
    reportNumber,
    generatedAt,
    generatedBy,
    reportType,
    reportVersion,
    reportStatus,
    customerInfo,
    workshopInfo,
    const DeepCollectionEquality().hash(_sections),
    digitalHash,
    technicianSignature,
    customerSignature,
  );

  /// Create a copy of DiagnosticReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosticReportImplCopyWith<_$DiagnosticReportImpl> get copyWith =>
      __$$DiagnosticReportImplCopyWithImpl<_$DiagnosticReportImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosticReportImplToJson(this);
  }
}

abstract class _DiagnosticReport implements DiagnosticReport {
  const factory _DiagnosticReport({
    required final String reportId,
    required final String vehicleId,
    required final String sessionId,
    required final String reportNumber,
    required final DateTime generatedAt,
    final String generatedBy,
    final String reportType,
    final String reportVersion,
    final String reportStatus,
    final CustomerInformation? customerInfo,
    final WorkshopInformation? workshopInfo,
    final List<ReportSection> sections,
    final String digitalHash,
    final String technicianSignature,
    final String customerSignature,
  }) = _$DiagnosticReportImpl;

  factory _DiagnosticReport.fromJson(Map<String, dynamic> json) =
      _$DiagnosticReportImpl.fromJson;

  @override
  String get reportId;
  @override
  String get vehicleId;
  @override
  String get sessionId;
  @override
  String get reportNumber;
  @override
  DateTime get generatedAt;
  @override
  String get generatedBy;
  @override
  String get reportType;
  @override
  String get reportVersion;
  @override
  String get reportStatus; // 'draft', 'finalized', 'signed', 'archived'
  @override
  CustomerInformation? get customerInfo;
  @override
  WorkshopInformation? get workshopInfo;
  @override
  List<ReportSection> get sections;
  @override
  String get digitalHash;
  @override
  String get technicianSignature;
  @override
  String get customerSignature;

  /// Create a copy of DiagnosticReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosticReportImplCopyWith<_$DiagnosticReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
