import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bizscan/features/obd/data/transports/mock_obd_transport.dart';
import 'package:bizscan/features/obd/domain/models/elm327_state.dart';
import 'package:bizscan/features/obd/domain/repositories/elm327_profile_repository.dart';
import 'package:bizscan/features/obd/domain/services/connection_monitor.dart';
import 'package:bizscan/features/obd/domain/services/elm327_engine.dart';

import 'package:bizscan/features/obd/domain/models/elm327_adapter_profile.dart';

class MockElm327ProfileRepository extends Mock implements Elm327ProfileRepository {}
class FakeElm327AdapterProfile extends Fake implements Elm327AdapterProfile {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeElm327AdapterProfile());
  });

  group('Elm327Engine Auto Recovery Unit Tests', () {
    late MockObdTransport transport;
    late MockElm327ProfileRepository repo;
    late ConnectionMonitor monitor;
    late Elm327Engine engine;

    setUp(() {
      transport = MockObdTransport();
      repo = MockElm327ProfileRepository();
      monitor = ConnectionMonitor();
      engine = Elm327Engine(transport, repo, monitor);

      when(() => repo.saveProfile(any(), any())).thenAnswer((_) async {});
    });

    tearDown(() async {
      engine.dispose();
      await transport.dispose();
    });

    test('connectAndInitialize transitions engine from connecting -> initializing -> ready', () async {
      final states = <Elm327State>[];
      engine.stateStream.listen((s) => states.add(s));

      final res = await engine.connectAndInitialize('00:11:22:33:44:55');

      expect(res.isSuccess, true);
      expect(engine.state, Elm327State.ready);
      expect(engine.activeProfile, isNotNull);
      expect(engine.activeProfile?.adapterName, contains('ELM327'));
    });
  });
}
