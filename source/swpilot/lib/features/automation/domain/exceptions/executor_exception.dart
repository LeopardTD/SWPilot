import 'automation_exception.dart';

/// Exception thrown when an error occurs during automation task execution.
class ExecutorException extends AutomationException {
  ExecutorException(super.message, [super.cause, super.timestamp]);
}
