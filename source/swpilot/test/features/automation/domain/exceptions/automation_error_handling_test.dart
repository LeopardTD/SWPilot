import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/application/services/automation_error_mapper.dart';
import 'package:swpilot/features/automation/domain/exceptions/automation_exception.dart';
import 'package:swpilot/features/automation/domain/exceptions/executor_exception.dart';
import 'package:swpilot/features/automation/domain/exceptions/pipeline_exception.dart';
import 'package:swpilot/features/automation/domain/exceptions/queue_exception.dart';
import 'package:swpilot/features/automation/domain/exceptions/repository_exception.dart';
import 'package:swpilot/features/automation/domain/exceptions/session_exception.dart';
import 'package:swpilot/features/automation/domain/failures/automation_failure.dart';
import 'package:swpilot/features/automation/domain/failures/failure_type.dart';

void main() {
  const mapper = AutomationErrorMapper();

  test('SessionException maps to FailureType.session', () {
    final exception = SessionException('Session error message');
    expect(exception, isA<AutomationException>());
    expect(exception.message, equals('Session error message'));

    final failure = mapper.map(exception);
    expect(failure.type, equals(FailureType.session));
    expect(failure.message, equals('Session error message'));
    expect(failure.originalException, equals(exception));
  });

  test('QueueException maps to FailureType.queue', () {
    final exception = QueueException('Queue error message');
    final failure = mapper.map(exception);
    expect(failure.type, equals(FailureType.queue));
    expect(failure.message, equals('Queue error message'));
  });

  test('PipelineException maps to FailureType.pipeline', () {
    final exception = PipelineException('Pipeline error message');
    final failure = mapper.map(exception);
    expect(failure.type, equals(FailureType.pipeline));
    expect(failure.message, equals('Pipeline error message'));
  });

  test('ExecutorException maps to FailureType.executor', () {
    final exception = ExecutorException('Executor error message');
    final failure = mapper.map(exception);
    expect(failure.type, equals(FailureType.executor));
    expect(failure.message, equals('Executor error message'));
  });

  test('RepositoryException maps to FailureType.repository', () {
    final exception = RepositoryException('Repository error message');
    final failure = mapper.map(exception);
    expect(failure.type, equals(FailureType.repository));
    expect(failure.message, equals('Repository error message'));
  });

  test('Generic error maps to FailureType.unknown', () {
    final genericError = StateError('Unexpected error');
    final failure = mapper.map(genericError);
    expect(failure.type, equals(FailureType.unknown));
    expect(failure.originalException, equals(genericError));
  });

  test('AutomationFailure supports value equality', () {
    const failure1 = AutomationFailure(
      type: FailureType.session,
      message: 'Error message',
    );
    const failure2 = AutomationFailure(
      type: FailureType.session,
      message: 'Error message',
    );

    expect(failure1, equals(failure2));
  });
}
