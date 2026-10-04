import '../entity/session_entity.dart';
import '../entity/session_signals.dart';

/// Persists sessions. Implementations throw Failure subclasses.
abstract class SessionRepository {
  /// Newest first.
  Future<List<SessionEntity>> getSessions();

  Future<SessionEntity> getSession(String id);

  /// Writes the CSV files and meta.json, then the Hive entry. Partial writes
  /// are rolled back.
  Future<void> saveSession(SessionEntity session, SessionSignals signals);

  Future<void> deleteSession(String id);

  /// Opens the system share sheet with the session's files.
  Future<void> shareSession(String id);
}
