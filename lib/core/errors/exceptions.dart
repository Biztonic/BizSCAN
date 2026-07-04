class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({this.message = 'A server error occurred', this.statusCode});

  @override
  String toString() => 'ServerException: $message (Status Code: $statusCode)';
}

class CacheException implements Exception {
  final String message;

  const CacheException({this.message = 'A cache/storage error occurred'});

  @override
  String toString() => 'CacheException: $message';
}

class BluetoothException implements Exception {
  final String message;
  final String? code;

  const BluetoothException({this.message = 'Bluetooth error occurred', this.code});

  @override
  String toString() => 'BluetoothException: $message (Code: $code)';
}

class OBDException implements Exception {
  final String message;
  final String? command;

  const OBDException({this.message = 'OBD communication error occurred', this.command});

  @override
  String toString() => 'OBDException: $message (Command: $command)';
}

class NetworkException implements Exception {
  final String message;

  const NetworkException({this.message = 'No internet connection'});

  @override
  String toString() => 'NetworkException: $message';
}

class ValidationException implements Exception {
  final String message;

  const ValidationException(this.message);

  @override
  String toString() => 'ValidationException: $message';
}

class AuthException implements Exception {
  final String message;

  const AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}
