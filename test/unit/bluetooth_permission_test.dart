import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/bluetooth/data/services/permission_service_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BluetoothPermissionServiceImpl Unit Tests', () {
    late BluetoothPermissionServiceImpl service;

    setUp(() {
      service = BluetoothPermissionServiceImpl();
    });

    test('hasPermissions returns boolean without error', () async {
      final hasPerm = await service.hasPermissions();
      expect(hasPerm, isA<bool>());
    });

    test('requestPermissions handles permission request flow gracefully', () async {
      final res = await service.requestPermissions();
      expect(res.isSuccess || res.isFailure, true);
    });
  });
}
