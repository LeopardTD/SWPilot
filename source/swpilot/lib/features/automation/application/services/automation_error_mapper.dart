import '../../domain/exceptions/automation_exception.dart';
import '../../domain/exceptions/executor_exception.dart';
import '../../domain/exceptions/pipeline_exception.dart';
import '../../domain/exceptions/queue_exception.dart';
import '../../domain/exceptions/repository_exception.dart';
import '../../domain/exceptions/session_exception.dart';
import '../../domain/failures/automation_failure.dart';
import '../../domain/failures/failure_type.dart';

/// Application service responsible for mapping exceptions into [AutomationFailure] objects.
class AutomationErrorMapper {
  /// Creates an [AutomationErrorMapper].
  const AutomationErrorMapper();

  /// Maps an exception into a domain [AutomationFailure].
  AutomationFailure map(Object error) {
    if (error is SessionException) {
      return AutomationFailure(
        type: FailureType.session,
        message: error.message,
        originalException: error,
      );
    }

    if (error is QueueException) {
      return AutomationFailure(
        type: FailureType.queue,
        message: error.message,
        originalException: error,
      );
    }

    if (error is PipelineException) {
      return AutomationFailure(
        type: FailureType.pipeline,
        message: error.message,
        originalException: error,
      );
    }

    if (error is ExecutorException) {
      return AutomationFailure(
        type: FailureType.executor,
        message: error.message,
        originalException: error,
      );
    }

    if (error is RepositoryException) {
      return AutomationFailure(
        type: FailureType.repository,
        message: error.message,
        originalException: error,
      );
    }

    if (error is AutomationException) {
      return AutomationFailure(
        type: FailureType.unknown,
        message: error.message,
        originalException: error,
      );
    }

    return AutomationFailure(
      type: FailureType.unknown,
      message: error.toString(),
      originalException: error,
    );
  }
}
