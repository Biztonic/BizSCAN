import 'package:flutter_test/flutter_test.dart';
import 'package:bizscan/features/obd/data/transports/mock_obd_transport.dart';
import 'package:bizscan/features/obd/domain/models/obd_command.dart';
import 'package:bizscan/features/obd/domain/services/elm327_command_queue.dart';
import 'package:bizscan/features/obd/domain/services/elm327_command_pipeline.dart';

void main() {
  group('Elm327CommandQueue & Pipeline Unit Tests', () {
    late MockObdTransport transport;
    late Elm327CommandPipeline pipeline;

    setUp(() {
      transport = MockObdTransport();
      pipeline = Elm327CommandPipeline(transport);
    });

    tearDown(() async {
      await transport.dispose();
    });

    test('Elm327CommandQueue prevents duplicates and orders by priority', () {
      final queue = Elm327CommandQueue(maxQueueSize: 10);
      final cmdLow = ObdCommand(command: '010D', type: 'PID', priority: 3, createdAt: DateTime.now());
      final cmdHigh = ObdCommand(command: '010C', type: 'PID', priority: 1, createdAt: DateTime.now());
      final cmdDup = ObdCommand(command: '010C', type: 'PID', priority: 1, createdAt: DateTime.now());

      expect(queue.enqueue(cmdLow), true);
      expect(queue.enqueue(cmdHigh), true);
      expect(queue.enqueue(cmdDup), false); // duplicate rejected

      expect(queue.length, 2);
      final first = queue.dequeue();
      expect(first?.command, '010C'); // Higher priority dequeued first
    });

    test('executeDirect sends command through transport and cleans response', () async {
      await transport.connect('00:11:22:33:44:55');

      final cmd = ObdCommand(command: '010C', type: 'PID', priority: 1, createdAt: DateTime.now());
      final res = await pipeline.executeDirect(cmd);

      expect(res.isSuccess, true);
      final response = res.getOrNull!;
      expect(response.isValid, true);
      expect(response.parsedData?['cleaned'], '41 0C 0B F4');
    });
  });
}
