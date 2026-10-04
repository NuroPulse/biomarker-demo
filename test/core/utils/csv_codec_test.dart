import 'dart:typed_data';

import 'package:biomarker_demo/core/utils/_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('writes the header and one row per sample', () {
    final csv = CsvCodec.encodeTrace(
      Int64List.fromList([1790899200012345, 1790899200022345]),
      Float64List.fromList([0.021, 0.5]),
      Float64List.fromList([-0.043, 0.25]),
      Float64List.fromList([0.008, 1.0]),
    );

    final lines = csv.trim().split('\n');
    expect(lines.first, 't_us,x,y,z');
    expect(lines[1], '1790899200012345,0.021,-0.043,0.008');
    expect(lines, hasLength(3));
  });
}
