import 'automation_exception.dart';

/// Exception thrown when an error occurs during automation session operations.
class SessionException extends AutomationException {
  SessionException(super.message, [super.cause, super.timestamp]);
}
