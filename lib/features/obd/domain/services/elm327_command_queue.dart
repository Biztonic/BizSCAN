import '../models/obd_command.dart';

class Elm327CommandQueue {
  final int maxQueueSize;
  final List<ObdCommand> _queue = [];

  Elm327CommandQueue({this.maxQueueSize = 100});

  int get length => _queue.length;
  bool get isEmpty => _queue.isEmpty;
  bool get isNotEmpty => _queue.isNotEmpty;

  bool enqueue(ObdCommand command) {
    if (_queue.length >= maxQueueSize) return false;

    // Duplicate prevention: avoid enqueuing identical pending command string
    if (_queue.any((cmd) => cmd.command == command.command)) {
      return false;
    }

    _queue.add(command);
    // Sort by priority (1 = high, 2 = normal, 3 = low)
    _queue.sort((a, b) => a.priority.compareTo(b.priority));
    return true;
  }

  ObdCommand? dequeue() {
    if (_queue.isEmpty) return null;
    return _queue.removeAt(0);
  }

  void clear() {
    _queue.clear();
  }
}
