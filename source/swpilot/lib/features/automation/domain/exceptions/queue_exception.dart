import 'automation_exception.dart';

/// Exception thrown when an error occurs during automation queue operations.
class QueueException extends AutomationException {
  QueueException(super.message, [super.cause, super.timestamp]);
}
