import 'package:swpilot/services/logger/logger_service.dart';

/// Centralized logger wrapper for the Automation Module.
///
/// Formats automation event traces and delegates log printing to the global [LoggerService].
class AutomationLogger {
  /// Creates an instance of [AutomationLogger].
  const AutomationLogger();

  static const String _tag = '[AUTOMATION]';

  /// Logs session lifecycle events.
  void logSession(String message) {
    LoggerService.info('$_tag [SESSION] $message');
  }

  /// Logs queue operation events.
  void logQueue(String message) {
    LoggerService.info('$_tag [QUEUE] $message');
  }

  /// Logs pipeline validation and preparation events.
  void logPipeline(String message) {
    LoggerService.info('$_tag [PIPELINE] $message');
  }

  /// Logs task execution events.
  void logExecutor(String message) {
    LoggerService.info('$_tag [EXECUTOR] $message');
  }

  /// Logs warning events within the automation module.
  void logWarning(String category, String message, [dynamic error, StackTrace? stackTrace]) {
    LoggerService.warning('$_tag [$category] $message', error, stackTrace);
  }

  /// Logs error events within the automation module.
  void logError(String category, String message, [dynamic error, StackTrace? stackTrace]) {
    LoggerService.error('$_tag [$category] $message', error, stackTrace);
  }
}
