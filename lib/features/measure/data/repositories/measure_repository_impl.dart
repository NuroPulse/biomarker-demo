import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../core/errors/_errors.dart';
import '../../../../dsp/_dsp.dart';
import '../../../sessions/domain/entity/session_device.dart';
import '../../../sessions/domain/entity/session_entity.dart';
import '../../../sessions/domain/entity/session_labels.dart';
import '../../../sessions/domain/entity/session_result.dart';
import '../../../sessions/domain/entity/session_sampling.dart';
import '../../../sessions/domain/entity/session_signals.dart';
import '../../../sessions/domain/entity/signal_trace.dart';
import '../../../sessions/domain/repositories/session_repository.dart';
import '../../domain/entity/live_window.dart';
import '../../domain/entity/measure_outcome.dart';
import '../../domain/repositories/measure_repository.dart';
import '../datasources/sensor_datasource.dart';

class MeasureRepositoryImpl implements MeasureRepository {
  MeasureRepositoryImpl(
    this._sensors,
    this._sessions,
    this._dspConfig, [
    Uuid? uuid,
  ]) : _uuid = uuid ?? const Uuid();

  final SensorDatasource _sensors;
  final SessionRepository _sessions;
  final DspConfig _dspConfig;
  final Uuid _uuid;

  final _userAcc = <RawSample>[];
  final _accRaw = <RawSample>[];
  final _gyro = <RawSample>[];
  final _subscriptions = <StreamSubscription<RawSample>>[];
  Object? _sensorError;

  @override
  Future<void> startRecording() async {
    _clearBuffers();
    try {
      _subscriptions
        ..add(_listen(_sensors.userAccelerometer(), _userAcc))
        ..add(_listen(_sensors.accelerometer(), _accRaw))
        ..add(_listen(_sensors.gyroscope(), _gyro));
      await WakelockPlus.enable();
    } catch (error, stackTrace) {
      await cancelRecording();
      Error.throwWithStackTrace(
        SensorFailure('Failed to start sensors: $error'),
        stackTrace,
      );
    }
  }

  StreamSubscription<RawSample> _listen(
    Stream<RawSample> stream,
    List<RawSample> buffer,
  ) {
    return stream.listen(
      buffer.add,
      onError: (Object error) => _sensorError ??= error,
    );
  }

  @override
  LiveWindow liveWindow(int samples) {
    final start = _userAcc.length > samples ? _userAcc.length - samples : 0;
    final window = _userAcc.sublist(start);
    return LiveWindow(
      x: Float64List.fromList([for (final s in window) s.x]),
      y: Float64List.fromList([for (final s in window) s.y]),
      z: Float64List.fromList([for (final s in window) s.z]),
    );
  }

  @override
  Future<void> cancelRecording() async {
    await _stopListening();
    _clearBuffers();
  }

  @override
  Future<MeasureOutcome> finishRecording(SessionLabels labels) async {
    // Read the error before stopping, because stopping clears it.
    final error = _sensorError;
    await _stopListening();
    if (error != null) {
      _clearBuffers();
      throw SensorFailure('Sensor stream failed: $error');
    }

    final signals = _buildSignals();
    _clearBuffers();

    final result = await _analyze(signals.userAcc);
    final session = await _buildSession(labels, result);
    await _sessions.saveSession(session, signals);
    return MeasureOutcome(session: session, result: result);
  }

  Future<TremorResult> _analyze(SignalTrace trace) async {
    // Analysis uses the gravity-removed stream. Raw acceleration and gyro are
    // saved for offline comparison. Section 11 of CLAUDE.md lists this choice
    // as something to verify on a device.
    final input = DspInput(tUs: trace.tUs, x: trace.x, y: trace.y, z: trace.z);
    final config = _dspConfig;
    try {
      return await Isolate.run(() => TremorPipeline(config).analyze(input));
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        AnalysisFailure('DSP pipeline failed: $error'),
        stackTrace,
      );
    }
  }

  Future<SessionEntity> _buildSession(
    SessionLabels labels,
    TremorResult result,
  ) async {
    final device = await _deviceInfo();
    final packageInfo = await PackageInfo.fromPlatform();
    final qc = result.qc;
    final features = result.features;

    return SessionEntity(
      id: _uuid.v4(),
      createdAt: DateTime.now(),
      subjectCode: labels.subjectCode,
      hand: labels.hand,
      condition: labels.condition,
      repetition: labels.repetition,
      simulatedFrequencyHz: labels.simulatedFrequencyHz,
      notes: labels.notes,
      device: SessionDevice(
        model: device.model,
        os: device.os,
        appVersion: packageInfo.version,
      ),
      sampling: SessionSampling(
        requestedPeriodUs: SensorDatasource.samplingPeriod.inMicroseconds,
        effectiveFsHz: qc.effectiveFsHz,
        jitter: qc.jitter,
        maxGapMs: qc.maxGapMs,
      ),
      algoVersion: _dspConfig.algoVersion,
      result: SessionResult(
        status: result.status,
        gates: result.gates,
        features: features,
      ),
    );
  }

  Future<({String model, String os})> _deviceInfo() async {
    if (!Platform.isAndroid) {
      return (
        model: Platform.operatingSystem,
        os: Platform.operatingSystemVersion,
      );
    }
    final info = await DeviceInfoPlugin().androidInfo;
    return (model: info.model, os: 'Android ${info.version.release}');
  }

  SessionSignals _buildSignals() {
    return SessionSignals(
      userAcc: _toTrace(_userAcc),
      accRaw: _toTrace(_accRaw),
      gyro: _toTrace(_gyro),
    );
  }

  SignalTrace _toTrace(List<RawSample> samples) {
    return SignalTrace(
      tUs: Int64List.fromList([for (final s in samples) s.tUs]),
      x: Float64List.fromList([for (final s in samples) s.x]),
      y: Float64List.fromList([for (final s in samples) s.y]),
      z: Float64List.fromList([for (final s in samples) s.z]),
    );
  }

  Future<void> _stopListening() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    _subscriptions.clear();
    _sensorError = null;
    await WakelockPlus.disable();
  }

  void _clearBuffers() {
    _userAcc.clear();
    _accRaw.clear();
    _gyro.clear();
  }
}
