import '../../../../services/storage/_storage.dart';

/// Hive access for session metadata. Stores JSON maps only.
class SessionLocalDatasource {
  SessionLocalDatasource(this._hive);

  final HiveService _hive;

  List<Map<String, dynamic>> readAll() {
    return [for (final value in _hive.sessions.values) _toJsonMap(value)];
  }

  Map<String, dynamic>? read(String id) {
    final value = _hive.sessions.get(id);
    return value == null ? null : _toJsonMap(value);
  }

  /// Hive returns nested maps as `Map<dynamic, dynamic>` after a reopen, and the
  /// generated fromJson casts them to `Map<String, dynamic>`, so the whole tree
  /// is converted here.
  static Map<String, dynamic> _toJsonMap(Map<dynamic, dynamic> map) {
    return {
      for (final entry in map.entries)
        entry.key as String: _toJsonValue(entry.value),
    };
  }

  static Object? _toJsonValue(Object? value) {
    return switch (value) {
      Map() => _toJsonMap(value),
      List() => [for (final item in value) _toJsonValue(item)],
      _ => value,
    };
  }

  Future<void> write(String id, Map<String, dynamic> json) {
    return _hive.sessions.put(id, json);
  }

  Future<void> delete(String id) {
    return _hive.sessions.delete(id);
  }
}
