import 'dart:async';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/result.dart';
import '../models/elm327_adapter_profile.dart';
import '../models/elm327_state.dart';
import '../models/obd_connection_state.dart';
import '../models/obd_command.dart';
import '../models/obd_response.dart';
import '../repositories/elm327_profile_repository.dart';
import 'connection_monitor.dart';
import 'elm327_capability_detector.dart';
import 'elm327_clone_detector.dart';
import 'elm327_command_pipeline.dart';
import 'elm327_command_scheduler.dart';
import 'elm327_initializer.dart';
import 'obd_transport.dart';

class Elm327Engine {
  final ObdTransport _transport;
  final Elm327Initializer _initializer = Elm327Initializer();
  final Elm327CapabilityDetector _capabilityDetector = Elm327CapabilityDetector();
  final Elm327CloneDetector _cloneDetector = Elm327CloneDetector();
  final Elm327ProfileRepository _profileRepository;
  final ConnectionMonitor _connectionMonitor;

  late final Elm327CommandPipeline _pipeline;
  late final Elm327CommandScheduler _scheduler;

  Elm327State _state = Elm327State.disconnected;
  Elm327AdapterProfile? _activeProfile;
  final StreamController<Elm327State> _stateController = StreamController<Elm327State>.broadcast();

  Elm327Engine(this._transport, this._profileRepository, this._connectionMonitor) {
    _pipeline = Elm327CommandPipeline(_transport);
    _scheduler = Elm327CommandScheduler(_pipeline);
  }

  Elm327State get state => _state;
  Elm327AdapterProfile? get activeProfile => _activeProfile;
  Stream<Elm327State> get stateStream => _stateController.stream;

  void _updateState(Elm327State newState) {
    _state = newState;
    _stateController.add(newState);
    _syncConnectionMonitor(newState);
  }

  void _syncConnectionMonitor(Elm327State s) {
    if (s == Elm327State.disconnected) _connectionMonitor.transitionTo(ObdConnectionState.disconnected);
    if (s == Elm327State.connecting) _connectionMonitor.transitionTo(ObdConnectionState.connecting);
    if (s == Elm327State.initializing) _connectionMonitor.transitionTo(ObdConnectionState.initializing);
    if (s == Elm327State.ready) _connectionMonitor.transitionTo(ObdConnectionState.ready);
    if (s == Elm327State.busy) _connectionMonitor.transitionTo(ObdConnectionState.busy);
    if (s == Elm327State.recovering) _connectionMonitor.transitionTo(ObdConnectionState.reconnecting);
  }

  Future<Result<Elm327AdapterProfile>> connectAndInitialize(String targetAddress) async {
    _updateState(Elm327State.connecting);

    final connRes = await _transport.connect(targetAddress);
    if (connRes.isFailure) {
      _updateState(Elm327State.disconnected);
      return Result.failure(connRes.failureOrNull!);
    }

    _updateState(Elm327State.initializing);

    final initRes = await _initializer.initializeSequence(_transport);
    if (initRes.isFailure) {
      _updateState(Elm327State.disconnected);
      await _transport.disconnect();
      return Result.failure(initRes.failureOrNull!);
    }

    final initData = initRes.getOrNull!;
    final capabilities = _capabilityDetector.detectCapabilities(initData);
    final cloneInfo = _cloneDetector.evaluateClone(initData);

    final profile = Elm327AdapterProfile(
      adapterName: initData.adapterInfo,
      firmwareVersion: initData.adapterInfo,
      voltage: initData.voltage,
      protocol: initData.protocol,
      capabilities: capabilities,
      isClone: cloneInfo.isClone,
      cloneScore: cloneInfo.cloneScore,
      initTimeMs: initData.durationMs,
      lastSeen: DateTime.now(),
    );

    _activeProfile = profile;
    await _profileRepository.saveProfile(targetAddress, profile);

    _updateState(Elm327State.ready);
    return Result.success(profile);
  }

  Future<Result<ObdResponse>> executeCommand(ObdCommand command) async {
    if (_state != Elm327State.ready && _state != Elm327State.busy) {
      return const Result.failure(ConnectionFailure('ELM327 Engine is not in ready state'));
    }

    _updateState(Elm327State.busy);
    final res = await _pipeline.executeDirect(command);

    if (res.isFailure && res.failureOrNull is Elm327FreezeFailure) {
      // Auto Recovery trigger on adapter freeze
      await recoverEngine(command);
    } else {
      _updateState(Elm327State.ready);
    }

    return res;
  }

  Future<void> recoverEngine(ObdCommand failedCommand) async {
    _updateState(Elm327State.recovering);
    await _transport.send('ATZ\r');
    await Future.delayed(const Duration(milliseconds: 500));

    final reinit = await _initializer.initializeSequence(_transport);
    if (reinit.isSuccess) {
      _updateState(Elm327State.ready);
      _pipeline.addCommand(failedCommand);
    } else {
      _updateState(Elm327State.disconnected);
    }
  }

  Future<void> disconnect() async {
    _scheduler.stop();
    _pipeline.cancelAll();
    await _transport.disconnect();
    _updateState(Elm327State.disconnected);
    _activeProfile = null;
  }

  void dispose() {
    _scheduler.stop();
    _stateController.close();
  }
}
