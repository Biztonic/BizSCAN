import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../../domain/services/bluetooth_permission_service.dart';

class BluetoothPermissionServiceImpl implements BluetoothPermissionService {
  @override
  Future<bool> hasPermissions() async {
    if (!Platform.isAndroid) return true;

    final locStatus = await Permission.locationWhenInUse.status;
    final scanStatus = await Permission.bluetoothScan.status;
    final connectStatus = await Permission.bluetoothConnect.status;

    return locStatus.isGranted || scanStatus.isGranted || connectStatus.isGranted;
  }

  @override
  Future<Result<bool>> requestPermissions() async {
    if (!Platform.isAndroid) return const Result.success(true);

    try {
      final statuses = await [
        Permission.locationWhenInUse,
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
      ].request();

      final granted = statuses.values.any((status) => status.isGranted);
      if (granted) {
        return const Result.success(true);
      }
      return const Result.failure(PermissionDeniedFailure('Bluetooth and location permissions were denied'));
    } catch (e) {
      return Result.failure(PermissionDeniedFailure('Permission request failed: $e'));
    }
  }
}
