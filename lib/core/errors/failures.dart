import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class BluetoothFailure extends Failure {
  final String? code;
  const BluetoothFailure(super.message, {this.code});

  @override
  List<Object?> get props => [message, code];
}

class OBDFailure extends Failure {
  final String? command;
  const OBDFailure(super.message, {this.command});

  @override
  List<Object?> get props => [message, command];
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

class ParserFailure extends Failure {
  const ParserFailure(super.message);
}

class ProtocolFailure extends Failure {
  const ProtocolFailure(super.message);
}

class TransportFailure extends Failure {
  const TransportFailure(super.message);
}

class UnsupportedCommandFailure extends Failure {
  const UnsupportedCommandFailure(super.message);
}

class BluetoothDisabledFailure extends Failure {
  const BluetoothDisabledFailure(super.message);
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure(super.message);
}

class PairingFailure extends Failure {
  const PairingFailure(super.message);
}

class ConnectionLostFailure extends Failure {
  const ConnectionLostFailure(super.message);
}

class DeviceNotFoundFailure extends Failure {
  const DeviceNotFoundFailure(super.message);
}

class UnsupportedDeviceFailure extends Failure {
  const UnsupportedDeviceFailure(super.message);
}

class Elm327InitFailure extends Failure {
  const Elm327InitFailure(super.message);
}

class Elm327CloneFailure extends Failure {
  const Elm327CloneFailure(super.message);
}

class Elm327BusFailure extends Failure {
  const Elm327BusFailure(super.message);
}

class Elm327FreezeFailure extends Failure {
  const Elm327FreezeFailure(super.message);
}
