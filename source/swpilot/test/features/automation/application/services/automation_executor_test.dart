import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/application/services/automation_executor.dart';
import 'package:swpilot/features/automation/domain/entities/automation_result.dart';
import 'package:swpilot/features/automation/domain/entities/automation_session.dart';
import 'package:swpilot/features/automation/domain/entities/automation_task.dart';
import 'package:swpilot/features/automation/domain/entities/pipeline_result.dart';
import 'package:swpilot/features/automation/domain/enums/automation_status.dart';
import 'package:swpilot/features/automation/domain/enums/automation_task_type.dart';
import 'package:swpilot/features/automation/domain/repositories/automation_repository.dart';
import 'package:swpilot/features/automation/domain/value_objects/automation_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/session_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/task_name.dart';

class FakeAutomationRepository implements AutomationRepository {
  @override
  Future<AutomationSession> startAutomation({required AutomationTask task}) async => throw UnimplementedError();

  @override
  Future<AutomationResult> stopAutomation({required SessionId sessionId}) async => throw UnimplementedError();

  @override
  Future<AutomationSession> pauseAutomation({required SessionId sessionId}) async => throw UnimplementedError();

  @override
  Future<AutomationSession> resumeAutomation({required SessionId sessionId}) async => throw UnimplementedError();

  @override
  Future<AutomationStatus> getAutomationStatus() async => AutomationStatus.idle;

  @override
  Future<AutomationSession?> getActiveSession() async => null;

  @override
  Future<AutomationResult?> getAutomationResult({required SessionId sessionId}) async => null;
}

void main() {
  late FakeAutomationRepository repository;
  late AutomationExecutor executor;

  setUp(() {
    repository = FakeAutomationRepository();
    executor = AutomationExecutor(repository);
  });

  final sampleTask = AutomationTask(
    id: const AutomationId('task-exec-1'),
    name: const TaskName('Executor Task'),
    description: 'Task for testing executor',
    status: AutomationStatus.idle,
    type: AutomationTaskType.generic,
    createdAt: DateTime(2026, 1, 1),
  );

  test('execute rejects pipeline result when isReady is false', () async {
    final unreadyResult = PipelineResult(
      task: sampleTask,
      isReady: false,
      message: 'Validation failed',
      timestamp: DateTime(2026, 1, 1),
    );

    final result = await executor.execute(unreadyResult);

    expect(result.success, isFalse);
    expect(result.message, contains('rejected'));
  });

  test('execute completes successfully when pipeline result isReady is true', () async {
    final readyResult = PipelineResult(
      task: sampleTask,
      isReady: true,
      message: 'Validation passed',
      timestamp: DateTime(2026, 1, 1),
    );

    final result = await executor.execute(readyResult);

    expect(result.success, isTrue);
    expect(result.message, contains('executed successfully'));
  });

  test('reject produces explicit failed AutomationResult', () {
    final unreadyResult = PipelineResult(
      task: sampleTask,
      isReady: false,
      message: 'Task missing dependency',
      timestamp: DateTime(2026, 1, 1),
    );

    final rejected = executor.reject(unreadyResult);

    expect(rejected.success, isFalse);
    expect(rejected.message, contains('Task missing dependency'));
  });
}
