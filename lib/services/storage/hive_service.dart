import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../core/errors/_errors.dart';

/// Owns the two Hive boxes. Stores JSON maps only. Raw signals never go into
/// Hive; they live in CSV files (CLAUDE.md section 6).
class HiveService {
  static const sessionsBoxName = 'sessions';
  static const settingsBoxName = 'settings';

  Box<Map>? _sessions;
  Box<Map>? _settings;

  /// Call once from main.dart before runApp.
  Future<void> init() async {
    await Hive.initFlutter();
    await openBoxes();
  }

  /// Opens the boxes without initializing the Hive directory. Tests call
  /// this after Hive.init(path) with a temporary directory.
  Future<void> openBoxes() async {
    try {
      _sessions = await Hive.openBox<Map>(sessionsBoxName);
      _settings = await Hive.openBox<Map>(settingsBoxName);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        StorageFailure('Failed to open Hive boxes: $error'),
        stackTrace,
      );
    }
  }

  Box<Map> get sessions => _requireOpen(_sessions, sessionsBoxName);

  Box<Map> get settings => _requireOpen(_settings, settingsBoxName);

  Box<Map> _requireOpen(Box<Map>? box, String name) {
    if (box == null) {
      throw StateError('Hive box "$name" is not open. Call init() first.');
    }
    return box;
  }
}
