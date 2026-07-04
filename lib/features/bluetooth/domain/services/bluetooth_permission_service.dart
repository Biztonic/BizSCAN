import '../../../../core/errors/result.dart';

abstract class BluetoothPermissionService {
  Future<bool> hasPermissions();
  Future<Result<bool>> requestPermissions();
}
