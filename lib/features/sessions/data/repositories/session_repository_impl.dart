import 'package:share_plus/share_plus.dart';

import '../../../../core/errors/_errors.dart';
import '../../domain/entity/session_entity.dart';
import '../../domain/entity/session_signals.dart';
import '../../domain/repositories/session_repository.dart';
import '../datasources/session_file_datasource.dart';
import '../datasources/session_local_datasource.dart';
import '../models/session_model.dart';

class SessionRepositoryImpl implements SessionRepository {
  const SessionRepositoryImpl(this._local, this._files);

  final SessionLocalDatasource _local;
  final SessionFileDatasource _files;

  @override
  Future<List<SessionEntity>> getSessions() {
    return _guard('Reading sessions', () async {
      final sessions = [
        for (final json in _local.readAll())
          SessionModel.fromJson(json).toEntity(),
      ];
      sessions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return sessions;
    });
  }

  @override
  Future<SessionEntity> getSession(String id) {
    return _guard('Reading session $id', () async {
      final json = _local.read(id);
      if (json == null) throw StorageFailure('Session $id not found');
      return SessionModel.fromJson(json).toEntity();
    });
  }

  @override
  Future<void> saveSession(SessionEntity session, SessionSignals signals) {
    return _guard('Saving session ${session.id}', () async {
      final json = SessionModel.fromEntity(session).toJson();
      await _files.writeSession(session.id, signals, json);
      try {
        await _local.write(session.id, json);
      } catch (_) {
        // The files are useless without the Hive entry. A failed cleanup is
        // reported by the original error below, so it is not rethrown here.
        await _files.deleteSession(session.id).catchError((_) {});
        rethrow;
      }
    });
  }

  @override
  Future<void> deleteSession(String id) {
    return _guard('Deleting session $id', () async {
      await _local.delete(id);
      await _files.deleteSession(id);
    });
  }

  @override
  Future<void> shareSession(String id) async {
    final List<String> paths;
    try {
      paths = await _files.sessionFiles(id);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        ExportFailure('Could not list files for session $id: $error'),
        stackTrace,
      );
    }
    if (paths.isEmpty) {
      throw ExportFailure('No files found for session $id');
    }

    final result = await SharePlus.instance.share(
      ShareParams(
        files: [for (final path in paths) XFile(path)],
        subject: 'Sesi NuroPulse $id',
      ),
    );
    if (result.status == ShareResultStatus.unavailable) {
      throw ExportFailure('Share is unavailable on this device');
    }
  }

  /// Passes Failure subclasses through unchanged and wraps anything else in
  /// StorageFailure, so Cubits only ever see Failure types.
  Future<T> _guard<T>(String operation, Future<T> Function() body) async {
    try {
      return await body();
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        StorageFailure('$operation failed: $error'),
        stackTrace,
      );
    }
  }
}
