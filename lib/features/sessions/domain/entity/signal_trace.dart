import 'dart:typed_data';

/// One sensor stream: microsecond timestamps and three axes.
class SignalTrace {
  const SignalTrace({
    required this.tUs,
    required this.x,
    required this.y,
    required this.z,
  });

  final Int64List tUs;
  final Float64List x;
  final Float64List y;
  final Float64List z;
}
