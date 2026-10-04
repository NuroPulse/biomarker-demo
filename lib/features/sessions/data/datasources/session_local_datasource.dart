import '../../../../services/storage/_storage.dart';

/// Hive access for session metadata. Stores JSON maps only.
class SessionLocalDatasource {
  SessionLocalDatasource(this._hive);

  final HiveService _hive;

  List<Map<String, dynamic>> readAll() {
    return [
      for (final value in _hive.sessions.values)
        Map<String, dynamic>.from(value),
    ];
  }

  Map<String, dynamic>? read(String id) {
    final value = _hive.sessions.get(id);
    return value == null ? null : Map<String, dynamic>.from(value);
  }

  Future<void> write(String id, Map<String, dynamic> json) {
    return _hive.sessions.put(id, json);
  }

  Future<void> delete(String id) {
    return _hive.sessions.delete(id);
  }
}
