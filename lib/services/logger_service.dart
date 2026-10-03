import 'package:logger/logger.dart';

/// The only logging entry point. Wraps package:logger so no code calls print
/// (CLAUDE.md section 4). Log messages are developer-facing English.
class LoggerService {
  LoggerService({Logger? logger}) : _logger = logger ?? Logger();

  final Logger _logger;

  void debug(String message) => _logger.d(message);

  void info(String message) => _logger.i(message);

  void warning(String message) => _logger.w(message);

  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
