import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../../../core/utils/_utils.dart';
import '../../domain/entity/session_signals.dart';
import '../../domain/entity/signal_trace.dart';

/// Session folders under the app documents directory:
/// `<documents>/sessions/<sessionId>/` holding `user_acc.csv`, `acc_raw.csv`,
/// `gyro.csv`, and `meta.json`.
class SessionFileDatasource {
  SessionFileDatasource({Future<Directory> Function()? resolveRoot})
    : _resolveRoot = resolveRoot ?? getApplicationDocumentsDirectory;

  final Future<Directory> Function() _resolveRoot;

  static const userAccFile = 'user_acc.csv';
  static const accRawFile = 'acc_raw.csv';
  static const gyroFile = 'gyro.csv';
  static const metaFile = 'meta.json';

  Future<Directory> sessionDirectory(String id) async {
    final root = await _resolveRoot();
    final separator = Platform.pathSeparator;
    return Directory('${root.path}${separator}sessions$separator$id');
  }

  /// Writes all four files. On failure the folder is removed, so no half-written
  /// session is left behind.
  Future<void> writeSession(
    String id,
    SessionSignals signals,
    Map<String, dynamic> meta,
  ) async {
    final dir = await sessionDirectory(id);
    try {
      await dir.create(recursive: true);
      await _writeTrace(dir, userAccFile, signals.userAcc);
      await _writeTrace(dir, accRawFile, signals.accRaw);
      await _writeTrace(dir, gyroFile, signals.gyro);
      const encoder = JsonEncoder.withIndent('  ');
      await File(_join(dir, metaFile)).writeAsString(encoder.convert(meta));
    } catch (_) {
      if (await dir.exists()) await dir.delete(recursive: true);
      rethrow;
    }
  }

  Future<void> deleteSession(String id) async {
    final dir = await sessionDirectory(id);
    if (await dir.exists()) await dir.delete(recursive: true);
  }

  /// Existing files of one session, in the order they should be shared.
  Future<List<String>> sessionFiles(String id) async {
    final dir = await sessionDirectory(id);
    final names = [userAccFile, accRawFile, gyroFile, metaFile];
    return [
      for (final name in names)
        if (await File(_join(dir, name)).exists()) _join(dir, name),
    ];
  }

  Future<void> _writeTrace(Directory dir, String name, SignalTrace trace) {
    final csv = CsvCodec.encodeTrace(trace.tUs, trace.x, trace.y, trace.z);
    return File(_join(dir, name)).writeAsString(csv);
  }

  String _join(Directory dir, String name) =>
      '${dir.path}${Platform.pathSeparator}$name';
}
