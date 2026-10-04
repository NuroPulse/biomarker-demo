import 'dart:io';

import 'package:biomarker_demo/core/errors/_errors.dart';
import 'package:biomarker_demo/features/sessions/data/datasources/_datasources.dart';
import 'package:biomarker_demo/features/sessions/data/repositories/_repositories.dart';
import 'package:biomarker_demo/services/storage/_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../support/session_fixtures.dart';

void main() {
  late Directory root;
  late HiveService hive;
  late SessionRepositoryImpl repository;

  setUp(() async {
    root = Directory.systemTemp.createTempSync('session_repo_test_');
    Hive.init(root.path);
    hive = HiveService();
    await hive.openBoxes();
    repository = SessionRepositoryImpl(
      SessionLocalDatasource(hive),
      SessionFileDatasource(resolveRoot: () async => root),
    );
  });

  tearDown(() async {
    await Hive.close();
    root.deleteSync(recursive: true);
  });

  test('saves a session and reads it back', () async {
    await repository.saveSession(sessionFixture(), signalsFixture());

    final loaded = await repository.getSession('session-1');

    expect(loaded.subjectCode, 'S01');
    expect(loaded.result.status.name, 'tremor');
  });

  // The app restarts between recordings and history views. After a reopen, Hive
  // hands back nested maps as Map<dynamic, dynamic>, which the in-memory test
  // never does.
  test('reads sessions after the boxes are reopened from disk', () async {
    await repository.saveSession(sessionFixture(), signalsFixture());

    await Hive.close();
    await hive.openBoxes();

    final sessions = await repository.getSessions();
    expect(sessions.map((s) => s.id), ['session-1']);
  });

  test('lists sessions newest first', () async {
    await repository.saveSession(
      sessionFixture(id: 'older', createdAt: DateTime.utc(2026, 10, 1)),
      signalsFixture(),
    );
    await repository.saveSession(
      sessionFixture(id: 'newer', createdAt: DateTime.utc(2026, 10, 2)),
      signalsFixture(),
    );

    final sessions = await repository.getSessions();

    expect(sessions.map((s) => s.id), ['newer', 'older']);
  });

  test('delete removes both the Hive entry and the files', () async {
    await repository.saveSession(sessionFixture(), signalsFixture());

    await repository.deleteSession('session-1');

    expect(await repository.getSessions(), isEmpty);
    final dir = Directory(
      '${root.path}${Platform.pathSeparator}sessions${Platform.pathSeparator}session-1',
    );
    expect(dir.existsSync(), isFalse);
  });

  test('getSession throws StorageFailure for an unknown id', () async {
    await expectLater(
      repository.getSession('missing'),
      throwsA(isA<StorageFailure>()),
    );
  });

  test('shareSession throws ExportFailure when there are no files', () async {
    await expectLater(
      repository.shareSession('missing'),
      throwsA(isA<ExportFailure>()),
    );
  });
}
