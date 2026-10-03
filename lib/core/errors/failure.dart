part 'sensor_failure.dart';
part 'storage_failure.dart';
part 'analysis_failure.dart';
part 'export_failure.dart';

/// Failures thrown by repositories and services and caught by Cubits.
///
/// [message] is developer-facing English, meant for logs only. Never show it
/// to the user. The presentation layer maps each subtype to Indonesian text
/// (CLAUDE.md section 4).
///
/// Subtypes live in part files because a sealed class can only be extended
/// from its own library.
sealed class Failure implements Exception {
  const Failure(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}
