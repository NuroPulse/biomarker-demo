import 'package:sensors_plus/sensors_plus.dart';

/// One reading with the sensor's own timestamp in microseconds (CLAUDE.md
/// section 6). Never use array index or DateTime.now().
class RawSample {
  const RawSample({
    required this.tUs,
    required this.x,
    required this.y,
    required this.z,
  });

  final int tUs;
  final double x;
  final double y;
  final double z;
}

/// Thin wrapper over sensors_plus. Each stream is requested once per recording,
/// all with the same period, because the streams are shared (CLAUDE.md
/// section 6).
class SensorDatasource {
  static const samplingPeriod = Duration(milliseconds: 10);

  Stream<RawSample> userAccelerometer() {
    return userAccelerometerEventStream(samplingPeriod: samplingPeriod).map(
      (event) => RawSample(
        tUs: event.timestamp.microsecondsSinceEpoch,
        x: event.x,
        y: event.y,
        z: event.z,
      ),
    );
  }

  Stream<RawSample> accelerometer() {
    return accelerometerEventStream(samplingPeriod: samplingPeriod).map(
      (event) => RawSample(
        tUs: event.timestamp.microsecondsSinceEpoch,
        x: event.x,
        y: event.y,
        z: event.z,
      ),
    );
  }

  Stream<RawSample> gyroscope() {
    return gyroscopeEventStream(samplingPeriod: samplingPeriod).map(
      (event) => RawSample(
        tUs: event.timestamp.microsecondsSinceEpoch,
        x: event.x,
        y: event.y,
        z: event.z,
      ),
    );
  }
}
