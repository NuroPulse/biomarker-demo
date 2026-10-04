import 'dart:io';

import 'package:biomarker_demo/features/sessions/data/datasources/session_file_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/session_fixtures.dart';

void main() {
  late Directory root;
  late SessionFileDatasource files;

  setUp(() {
    root = Directory.systemTemp.createTempSync('session_files_test_');
    files = SessionFileDatasource(resolveRoot: () async => root);
  });

  tearDown(() {
    root.deleteSync(recursive: true);
  });

  test(
    'writes three CSV files and meta.json into the session folder',
    () async {
      await files.writeSession('session-1', signalsFixture(), {
        'sessionId': 'session-1',
      });

      final dir = await files.sessionDirectory('session-1');
      expect(
        File(
          '${dir.path}${Platform.pathSeparator}user_acc.csv',
        ).readAsStringSync(),
        startsWith('t_us,x,y,z\n'),
      );
      expect(
        File('${dir.path}${Platform.pathSeparator}acc_raw.csv').existsSync(),
        isTrue,
      );
      expect(
        File('${dir.path}${Platform.pathSeparator}gyro.csv').existsSync(),
        isTrue,
      );
      expect(
        File(
          '${dir.path}${Platform.pathSeparator}meta.json',
        ).readAsStringSync(),
        contains('"sessionId": "session-1"'),
      );
    },
  );

  test('lists the files that exist, in share order', () async {
    await files.writeSession('session-1', signalsFixture(), {
      'sessionId': 'session-1',
    });

    final paths = await files.sessionFiles('session-1');

    expect(paths.map((p) => p.split(Platform.pathSeparator).last), [
      'user_acc.csv',
      'acc_raw.csv',
      'gyro.csv',
      'meta.json',
    ]);
  });

  test('deleteSession removes the whole folder', () async {
    await files.writeSession('session-1', signalsFixture(), {
      'sessionId': 'session-1',
    });

    await files.deleteSession('session-1');

    final dir = await files.sessionDirectory('session-1');
    expect(dir.existsSync(), isFalse);
    expect(await files.sessionFiles('session-1'), isEmpty);
  });

  test('deleteSession is a no-op for an unknown session', () async {
    await expectLater(files.deleteSession('missing'), completes);
  });
}
