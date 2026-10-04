import 'dart:typed_data';

/// Writes sensor traces as CSV (CLAUDE.md section 6): a header row, then one
/// row per sample, values in the sensor's native units.
class CsvCodec {
  const CsvCodec._();

  static const header = 't_us,x,y,z';

  static String encodeTrace(
    Int64List tUs,
    Float64List x,
    Float64List y,
    Float64List z,
  ) {
    final buffer = StringBuffer()..writeln(header);
    for (var i = 0; i < tUs.length; i++) {
      buffer.writeln('${tUs[i]},${x[i]},${y[i]},${z[i]}');
    }
    return buffer.toString();
  }
}
