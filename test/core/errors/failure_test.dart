import 'package:biomarker_demo/core/errors/_errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every failure is an Exception with its message', () {
    const failures = <Failure>[
      SensorFailure('sensor stream closed'),
      StorageFailure('box corrupt'),
      AnalysisFailure('bad config'),
      ExportFailure('share intent failed'),
    ];

    for (final failure in failures) {
      expect(failure, isA<Exception>());
      expect(failure.toString(), contains(failure.message));
    }
  });

  test('switch over Failure is exhaustive across all subtypes', () {
    String label(Failure failure) => switch (failure) {
      SensorFailure() => 'sensor',
      StorageFailure() => 'storage',
      AnalysisFailure() => 'analysis',
      ExportFailure() => 'export',
    };

    expect(label(const SensorFailure('x')), 'sensor');
    expect(label(const ExportFailure('x')), 'export');
  });
}
