// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MaintenanceRecord _$MaintenanceRecordFromJson(Map<String, dynamic> json) {
  return _MaintenanceRecord.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceRecord {
  String get serviceId => throw _privateConstructorUsedError;
  DateTime get performedDate => throw _privateConstructorUsedError;
  int get odometer => throw _privateConstructorUsedError;
  String get workshop => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get invoiceNumber => throw _privateConstructorUsedError;
  int get nextDueKm => throw _privateConstructorUsedError;
  DateTime get nextDueDate => throw _privateConstructorUsedError;

  /// Serializes this MaintenanceRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceRecordCopyWith<MaintenanceRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceRecordCopyWith<$Res> {
  factory $MaintenanceRecordCopyWith(
    MaintenanceRecord value,
    $Res Function(MaintenanceRecord) then,
  ) = _$MaintenanceRecordCopyWithImpl<$Res, MaintenanceRecord>;
  @useResult
  $Res call({
    String serviceId,
    DateTime performedDate,
    int odometer,
    String workshop,
    String notes,
    String invoiceNumber,
    int nextDueKm,
    DateTime nextDueDate,
  });
}

/// @nodoc
class _$MaintenanceRecordCopyWithImpl<$Res, $Val extends MaintenanceRecord>
    implements $MaintenanceRecordCopyWith<$Res> {
  _$MaintenanceRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? performedDate = null,
    Object? odometer = null,
    Object? workshop = null,
    Object? notes = null,
    Object? invoiceNumber = null,
    Object? nextDueKm = null,
    Object? nextDueDate = null,
  }) {
    return _then(
      _value.copyWith(
            serviceId:
                null == serviceId
                    ? _value.serviceId
                    : serviceId // ignore: cast_nullable_to_non_nullable
                        as String,
            performedDate:
                null == performedDate
                    ? _value.performedDate
                    : performedDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            odometer:
                null == odometer
                    ? _value.odometer
                    : odometer // ignore: cast_nullable_to_non_nullable
                        as int,
            workshop:
                null == workshop
                    ? _value.workshop
                    : workshop // ignore: cast_nullable_to_non_nullable
                        as String,
            notes:
                null == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String,
            invoiceNumber:
                null == invoiceNumber
                    ? _value.invoiceNumber
                    : invoiceNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            nextDueKm:
                null == nextDueKm
                    ? _value.nextDueKm
                    : nextDueKm // ignore: cast_nullable_to_non_nullable
                        as int,
            nextDueDate:
                null == nextDueDate
                    ? _value.nextDueDate
                    : nextDueDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MaintenanceRecordImplCopyWith<$Res>
    implements $MaintenanceRecordCopyWith<$Res> {
  factory _$$MaintenanceRecordImplCopyWith(
    _$MaintenanceRecordImpl value,
    $Res Function(_$MaintenanceRecordImpl) then,
  ) = __$$MaintenanceRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String serviceId,
    DateTime performedDate,
    int odometer,
    String workshop,
    String notes,
    String invoiceNumber,
    int nextDueKm,
    DateTime nextDueDate,
  });
}

/// @nodoc
class __$$MaintenanceRecordImplCopyWithImpl<$Res>
    extends _$MaintenanceRecordCopyWithImpl<$Res, _$MaintenanceRecordImpl>
    implements _$$MaintenanceRecordImplCopyWith<$Res> {
  __$$MaintenanceRecordImplCopyWithImpl(
    _$MaintenanceRecordImpl _value,
    $Res Function(_$MaintenanceRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? performedDate = null,
    Object? odometer = null,
    Object? workshop = null,
    Object? notes = null,
    Object? invoiceNumber = null,
    Object? nextDueKm = null,
    Object? nextDueDate = null,
  }) {
    return _then(
      _$MaintenanceRecordImpl(
        serviceId:
            null == serviceId
                ? _value.serviceId
                : serviceId // ignore: cast_nullable_to_non_nullable
                    as String,
        performedDate:
            null == performedDate
                ? _value.performedDate
                : performedDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        odometer:
            null == odometer
                ? _value.odometer
                : odometer // ignore: cast_nullable_to_non_nullable
                    as int,
        workshop:
            null == workshop
                ? _value.workshop
                : workshop // ignore: cast_nullable_to_non_nullable
                    as String,
        notes:
            null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String,
        invoiceNumber:
            null == invoiceNumber
                ? _value.invoiceNumber
                : invoiceNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        nextDueKm:
            null == nextDueKm
                ? _value.nextDueKm
                : nextDueKm // ignore: cast_nullable_to_non_nullable
                    as int,
        nextDueDate:
            null == nextDueDate
                ? _value.nextDueDate
                : nextDueDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceRecordImpl implements _MaintenanceRecord {
  const _$MaintenanceRecordImpl({
    required this.serviceId,
    required this.performedDate,
    required this.odometer,
    this.workshop = 'Authorized Service Station',
    this.notes = '',
    this.invoiceNumber = '',
    required this.nextDueKm,
    required this.nextDueDate,
  });

  factory _$MaintenanceRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceRecordImplFromJson(json);

  @override
  final String serviceId;
  @override
  final DateTime performedDate;
  @override
  final int odometer;
  @override
  @JsonKey()
  final String workshop;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final String invoiceNumber;
  @override
  final int nextDueKm;
  @override
  final DateTime nextDueDate;

  @override
  String toString() {
    return 'MaintenanceRecord(serviceId: $serviceId, performedDate: $performedDate, odometer: $odometer, workshop: $workshop, notes: $notes, invoiceNumber: $invoiceNumber, nextDueKm: $nextDueKm, nextDueDate: $nextDueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceRecordImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.performedDate, performedDate) ||
                other.performedDate == performedDate) &&
            (identical(other.odometer, odometer) ||
                other.odometer == odometer) &&
            (identical(other.workshop, workshop) ||
                other.workshop == workshop) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.nextDueKm, nextDueKm) ||
                other.nextDueKm == nextDueKm) &&
            (identical(other.nextDueDate, nextDueDate) ||
                other.nextDueDate == nextDueDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    serviceId,
    performedDate,
    odometer,
    workshop,
    notes,
    invoiceNumber,
    nextDueKm,
    nextDueDate,
  );

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceRecordImplCopyWith<_$MaintenanceRecordImpl> get copyWith =>
      __$$MaintenanceRecordImplCopyWithImpl<_$MaintenanceRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceRecordImplToJson(this);
  }
}

abstract class _MaintenanceRecord implements MaintenanceRecord {
  const factory _MaintenanceRecord({
    required final String serviceId,
    required final DateTime performedDate,
    required final int odometer,
    final String workshop,
    final String notes,
    final String invoiceNumber,
    required final int nextDueKm,
    required final DateTime nextDueDate,
  }) = _$MaintenanceRecordImpl;

  factory _MaintenanceRecord.fromJson(Map<String, dynamic> json) =
      _$MaintenanceRecordImpl.fromJson;

  @override
  String get serviceId;
  @override
  DateTime get performedDate;
  @override
  int get odometer;
  @override
  String get workshop;
  @override
  String get notes;
  @override
  String get invoiceNumber;
  @override
  int get nextDueKm;
  @override
  DateTime get nextDueDate;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceRecordImplCopyWith<_$MaintenanceRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
