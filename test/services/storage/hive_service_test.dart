import 'dart:io';

import 'package:biomarker_demo/services/storage/_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() {
  late Directory dir;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('hive_service_test_');
    Hive.init(dir.path);
  });

  tearDown(() async {
    await Hive.close();
    dir.deleteSync(recursive: true);
  });

  test('throws StateError when a box is read before it is opened', () {
    final service = HiveService();

    expect(() => service.sessions, throwsStateError);
    expect(() => service.settings, throwsStateError);
  });

  test('opens the sessions and settings boxes', () async {
    final service = HiveService();

    await service.openBoxes();

    expect(service.sessions.name, HiveService.sessionsBoxName);
    expect(service.settings.name, HiveService.settingsBoxName);
  });

  test('stores and reads back a JSON map', () async {
    final service = HiveService();
    await service.openBoxes();

    await service.sessions.put('session-1', {
      'subjectCode': 'S01',
      'condition': 'rest',
    });

    expect(service.sessions.get('session-1'), {
      'subjectCode': 'S01',
      'condition': 'rest',
    });
  });
}
