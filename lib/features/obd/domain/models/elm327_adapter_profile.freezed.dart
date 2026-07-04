// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elm327_adapter_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Elm327AdapterProfile _$Elm327AdapterProfileFromJson(Map<String, dynamic> json) {
  return _Elm327AdapterProfile.fromJson(json);
}

/// @nodoc
mixin _$Elm327AdapterProfile {
  String get adapterName => throw _privateConstructorUsedError;
  String get firmwareVersion => throw _privateConstructorUsedError;
  String get voltage => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  List<String> get capabilities => throw _privateConstructorUsedError;
  bool get isClone => throw _privateConstructorUsedError;
  int get cloneScore => throw _privateConstructorUsedError; // 0 to 100
  List<String> get supportedCommands => throw _privateConstructorUsedError;
  int get responseDelayMs => throw _privateConstructorUsedError;
  int get maxBuffer => throw _privateConstructorUsedError;
  double get successRate => throw _privateConstructorUsedError;
  int get avgLatencyMs => throw _privateConstructorUsedError;
  int get initTimeMs => throw _privateConstructorUsedError;
  DateTime get lastSeen => throw _privateConstructorUsedError;

  /// Serializes this Elm327AdapterProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Elm327AdapterProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Elm327AdapterProfileCopyWith<Elm327AdapterProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Elm327AdapterProfileCopyWith<$Res> {
  factory $Elm327AdapterProfileCopyWith(
    Elm327AdapterProfile value,
    $Res Function(Elm327AdapterProfile) then,
  ) = _$Elm327AdapterProfileCopyWithImpl<$Res, Elm327AdapterProfile>;
  @useResult
  $Res call({
    String adapterName,
    String firmwareVersion,
    String voltage,
    String protocol,
    List<String> capabilities,
    bool isClone,
    int cloneScore,
    List<String> supportedCommands,
    int responseDelayMs,
    int maxBuffer,
    double successRate,
    int avgLatencyMs,
    int initTimeMs,
    DateTime lastSeen,
  });
}

/// @nodoc
class _$Elm327AdapterProfileCopyWithImpl<
  $Res,
  $Val extends Elm327AdapterProfile
>
    implements $Elm327AdapterProfileCopyWith<$Res> {
  _$Elm327AdapterProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Elm327AdapterProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adapterName = null,
    Object? firmwareVersion = null,
    Object? voltage = null,
    Object? protocol = null,
    Object? capabilities = null,
    Object? isClone = null,
    Object? cloneScore = null,
    Object? supportedCommands = null,
    Object? responseDelayMs = null,
    Object? maxBuffer = null,
    Object? successRate = null,
    Object? avgLatencyMs = null,
    Object? initTimeMs = null,
    Object? lastSeen = null,
  }) {
    return _then(
      _value.copyWith(
            adapterName:
                null == adapterName
                    ? _value.adapterName
                    : adapterName // ignore: cast_nullable_to_non_nullable
                        as String,
            firmwareVersion:
                null == firmwareVersion
                    ? _value.firmwareVersion
                    : firmwareVersion // ignore: cast_nullable_to_non_nullable
                        as String,
            voltage:
                null == voltage
                    ? _value.voltage
                    : voltage // ignore: cast_nullable_to_non_nullable
                        as String,
            protocol:
                null == protocol
                    ? _value.protocol
                    : protocol // ignore: cast_nullable_to_non_nullable
                        as String,
            capabilities:
                null == capabilities
                    ? _value.capabilities
                    : capabilities // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            isClone:
                null == isClone
                    ? _value.isClone
                    : isClone // ignore: cast_nullable_to_non_nullable
                        as bool,
            cloneScore:
                null == cloneScore
                    ? _value.cloneScore
                    : cloneScore // ignore: cast_nullable_to_non_nullable
                        as int,
            supportedCommands:
                null == supportedCommands
                    ? _value.supportedCommands
                    : supportedCommands // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            responseDelayMs:
                null == responseDelayMs
                    ? _value.responseDelayMs
                    : responseDelayMs // ignore: cast_nullable_to_non_nullable
                        as int,
            maxBuffer:
                null == maxBuffer
                    ? _value.maxBuffer
                    : maxBuffer // ignore: cast_nullable_to_non_nullable
                        as int,
            successRate:
                null == successRate
                    ? _value.successRate
                    : successRate // ignore: cast_nullable_to_non_nullable
                        as double,
            avgLatencyMs:
                null == avgLatencyMs
                    ? _value.avgLatencyMs
                    : avgLatencyMs // ignore: cast_nullable_to_non_nullable
                        as int,
            initTimeMs:
                null == initTimeMs
                    ? _value.initTimeMs
                    : initTimeMs // ignore: cast_nullable_to_non_nullable
                        as int,
            lastSeen:
                null == lastSeen
                    ? _value.lastSeen
                    : lastSeen // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$Elm327AdapterProfileImplCopyWith<$Res>
    implements $Elm327AdapterProfileCopyWith<$Res> {
  factory _$$Elm327AdapterProfileImplCopyWith(
    _$Elm327AdapterProfileImpl value,
    $Res Function(_$Elm327AdapterProfileImpl) then,
  ) = __$$Elm327AdapterProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String adapterName,
    String firmwareVersion,
    String voltage,
    String protocol,
    List<String> capabilities,
    bool isClone,
    int cloneScore,
    List<String> supportedCommands,
    int responseDelayMs,
    int maxBuffer,
    double successRate,
    int avgLatencyMs,
    int initTimeMs,
    DateTime lastSeen,
  });
}

/// @nodoc
class __$$Elm327AdapterProfileImplCopyWithImpl<$Res>
    extends _$Elm327AdapterProfileCopyWithImpl<$Res, _$Elm327AdapterProfileImpl>
    implements _$$Elm327AdapterProfileImplCopyWith<$Res> {
  __$$Elm327AdapterProfileImplCopyWithImpl(
    _$Elm327AdapterProfileImpl _value,
    $Res Function(_$Elm327AdapterProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Elm327AdapterProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adapterName = null,
    Object? firmwareVersion = null,
    Object? voltage = null,
    Object? protocol = null,
    Object? capabilities = null,
    Object? isClone = null,
    Object? cloneScore = null,
    Object? supportedCommands = null,
    Object? responseDelayMs = null,
    Object? maxBuffer = null,
    Object? successRate = null,
    Object? avgLatencyMs = null,
    Object? initTimeMs = null,
    Object? lastSeen = null,
  }) {
    return _then(
      _$Elm327AdapterProfileImpl(
        adapterName:
            null == adapterName
                ? _value.adapterName
                : adapterName // ignore: cast_nullable_to_non_nullable
                    as String,
        firmwareVersion:
            null == firmwareVersion
                ? _value.firmwareVersion
                : firmwareVersion // ignore: cast_nullable_to_non_nullable
                    as String,
        voltage:
            null == voltage
                ? _value.voltage
                : voltage // ignore: cast_nullable_to_non_nullable
                    as String,
        protocol:
            null == protocol
                ? _value.protocol
                : protocol // ignore: cast_nullable_to_non_nullable
                    as String,
        capabilities:
            null == capabilities
                ? _value._capabilities
                : capabilities // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        isClone:
            null == isClone
                ? _value.isClone
                : isClone // ignore: cast_nullable_to_non_nullable
                    as bool,
        cloneScore:
            null == cloneScore
                ? _value.cloneScore
                : cloneScore // ignore: cast_nullable_to_non_nullable
                    as int,
        supportedCommands:
            null == supportedCommands
                ? _value._supportedCommands
                : supportedCommands // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        responseDelayMs:
            null == responseDelayMs
                ? _value.responseDelayMs
                : responseDelayMs // ignore: cast_nullable_to_non_nullable
                    as int,
        maxBuffer:
            null == maxBuffer
                ? _value.maxBuffer
                : maxBuffer // ignore: cast_nullable_to_non_nullable
                    as int,
        successRate:
            null == successRate
                ? _value.successRate
                : successRate // ignore: cast_nullable_to_non_nullable
                    as double,
        avgLatencyMs:
            null == avgLatencyMs
                ? _value.avgLatencyMs
                : avgLatencyMs // ignore: cast_nullable_to_non_nullable
                    as int,
        initTimeMs:
            null == initTimeMs
                ? _value.initTimeMs
                : initTimeMs // ignore: cast_nullable_to_non_nullable
                    as int,
        lastSeen:
            null == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$Elm327AdapterProfileImpl implements _Elm327AdapterProfile {
  const _$Elm327AdapterProfileImpl({
    required this.adapterName,
    required this.firmwareVersion,
    this.voltage = '12.0V',
    required this.protocol,
    final List<String> capabilities = const [],
    this.isClone = false,
    this.cloneScore = 0,
    final List<String> supportedCommands = const [],
    this.responseDelayMs = 20,
    this.maxBuffer = 512,
    this.successRate = 1.0,
    this.avgLatencyMs = 30,
    this.initTimeMs = 1500,
    required this.lastSeen,
  }) : _capabilities = capabilities,
       _supportedCommands = supportedCommands;

  factory _$Elm327AdapterProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$Elm327AdapterProfileImplFromJson(json);

  @override
  final String adapterName;
  @override
  final String firmwareVersion;
  @override
  @JsonKey()
  final String voltage;
  @override
  final String protocol;
  final List<String> _capabilities;
  @override
  @JsonKey()
  List<String> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  @override
  @JsonKey()
  final bool isClone;
  @override
  @JsonKey()
  final int cloneScore;
  // 0 to 100
  final List<String> _supportedCommands;
  // 0 to 100
  @override
  @JsonKey()
  List<String> get supportedCommands {
    if (_supportedCommands is EqualUnmodifiableListView)
      return _supportedCommands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedCommands);
  }

  @override
  @JsonKey()
  final int responseDelayMs;
  @override
  @JsonKey()
  final int maxBuffer;
  @override
  @JsonKey()
  final double successRate;
  @override
  @JsonKey()
  final int avgLatencyMs;
  @override
  @JsonKey()
  final int initTimeMs;
  @override
  final DateTime lastSeen;

  @override
  String toString() {
    return 'Elm327AdapterProfile(adapterName: $adapterName, firmwareVersion: $firmwareVersion, voltage: $voltage, protocol: $protocol, capabilities: $capabilities, isClone: $isClone, cloneScore: $cloneScore, supportedCommands: $supportedCommands, responseDelayMs: $responseDelayMs, maxBuffer: $maxBuffer, successRate: $successRate, avgLatencyMs: $avgLatencyMs, initTimeMs: $initTimeMs, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Elm327AdapterProfileImpl &&
            (identical(other.adapterName, adapterName) ||
                other.adapterName == adapterName) &&
            (identical(other.firmwareVersion, firmwareVersion) ||
                other.firmwareVersion == firmwareVersion) &&
            (identical(other.voltage, voltage) || other.voltage == voltage) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            const DeepCollectionEquality().equals(
              other._capabilities,
              _capabilities,
            ) &&
            (identical(other.isClone, isClone) || other.isClone == isClone) &&
            (identical(other.cloneScore, cloneScore) ||
                other.cloneScore == cloneScore) &&
            const DeepCollectionEquality().equals(
              other._supportedCommands,
              _supportedCommands,
            ) &&
            (identical(other.responseDelayMs, responseDelayMs) ||
                other.responseDelayMs == responseDelayMs) &&
            (identical(other.maxBuffer, maxBuffer) ||
                other.maxBuffer == maxBuffer) &&
            (identical(other.successRate, successRate) ||
                other.successRate == successRate) &&
            (identical(other.avgLatencyMs, avgLatencyMs) ||
                other.avgLatencyMs == avgLatencyMs) &&
            (identical(other.initTimeMs, initTimeMs) ||
                other.initTimeMs == initTimeMs) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    adapterName,
    firmwareVersion,
    voltage,
    protocol,
    const DeepCollectionEquality().hash(_capabilities),
    isClone,
    cloneScore,
    const DeepCollectionEquality().hash(_supportedCommands),
    responseDelayMs,
    maxBuffer,
    successRate,
    avgLatencyMs,
    initTimeMs,
    lastSeen,
  );

  /// Create a copy of Elm327AdapterProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Elm327AdapterProfileImplCopyWith<_$Elm327AdapterProfileImpl>
  get copyWith =>
      __$$Elm327AdapterProfileImplCopyWithImpl<_$Elm327AdapterProfileImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$Elm327AdapterProfileImplToJson(this);
  }
}

abstract class _Elm327AdapterProfile implements Elm327AdapterProfile {
  const factory _Elm327AdapterProfile({
    required final String adapterName,
    required final String firmwareVersion,
    final String voltage,
    required final String protocol,
    final List<String> capabilities,
    final bool isClone,
    final int cloneScore,
    final List<String> supportedCommands,
    final int responseDelayMs,
    final int maxBuffer,
    final double successRate,
    final int avgLatencyMs,
    final int initTimeMs,
    required final DateTime lastSeen,
  }) = _$Elm327AdapterProfileImpl;

  factory _Elm327AdapterProfile.fromJson(Map<String, dynamic> json) =
      _$Elm327AdapterProfileImpl.fromJson;

  @override
  String get adapterName;
  @override
  String get firmwareVersion;
  @override
  String get voltage;
  @override
  String get protocol;
  @override
  List<String> get capabilities;
  @override
  bool get isClone;
  @override
  int get cloneScore; // 0 to 100
  @override
  List<String> get supportedCommands;
  @override
  int get responseDelayMs;
  @override
  int get maxBuffer;
  @override
  double get successRate;
  @override
  int get avgLatencyMs;
  @override
  int get initTimeMs;
  @override
  DateTime get lastSeen;

  /// Create a copy of Elm327AdapterProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Elm327AdapterProfileImplCopyWith<_$Elm327AdapterProfileImpl>
  get copyWith => throw _privateConstructorUsedError;
}
