import 'automation_exception.dart';

/// Exception thrown when an error occurs during automation pipeline validation or preparation.
class PipelineException extends AutomationException {
  PipelineException(super.message, [super.cause, super.timestamp]);
}
