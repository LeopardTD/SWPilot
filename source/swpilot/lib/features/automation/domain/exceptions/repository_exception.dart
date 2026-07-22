import 'automation_exception.dart';

/// Exception thrown when an error occurs during automation repository operations.
class RepositoryException extends AutomationException {
  RepositoryException(super.message, [super.cause, super.timestamp]);
}
