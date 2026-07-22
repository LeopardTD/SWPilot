import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/application/services/automation_executor.dart';
import 'package:swpilot/features/automation/application/services/automation_logger.dart';
import 'package:swpilot/features/automation/application/services/automation_pipeline.dart';
import 'package:swpilot/features/automation/application/services/automation_queue.dart';
import 'package:swpilot/features/automation/application/services/automation_session_manager.dart';
import 'package:swpilot/features/automation/domain/entities/automation_result.dart';
import 'package:swpilot/features/automation/domain/entities/automation_session.dart';
import 'package:swpilot/features/automation/domain/entities/automation_task.dart';
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
  late AutomationLogger logger;

  setUp(() {
    logger = const AutomationLogger();
  });

  final task = AutomationTask(
    id: const AutomationId('log-task-1'),
    name: const TaskName('Logger Task'),
    description: 'Task for testing logger',
    status: AutomationStatus.idle,
    type: AutomationTaskType.generic,
    createdAt: DateTime(2026, 1, 1),
  );

  test('AutomationLogger methods execute without error', () {
    expect(() => logger.logSession('Session Test'), returnsNormally);
    expect(() => logger.logQueue('Queue Test'), returnsNormally);
    expect(() => logger.logPipeline('Pipeline Test'), returnsNormally);
    expect(() => logger.logExecutor('Executor Test'), returnsNormally);
    expect(() => logger.logWarning('WARN', 'Warning Test'), returnsNormally);
    expect(() => logger.logError('ERR', 'Error Test'), returnsNormally);
  });

  test('Services integrated with AutomationLogger run seamlessly', () async {
    final repo = FakeAutomationRepository();
    final sessionManager = AutomationSessionManager(repo, logger: logger);
    final queue = AutomationQueue(logger: logger);
    final pipeline = AutomationPipeline(logger: logger);
    final executor = AutomationExecutor(repo, logger: logger);

    // Session log test
    final session = await sessionManager.createSession(sessionId: const SessionId('sess-log'));
    expect(session, isNotNull);

    // Queue log test
    queue.addTask(task);
    final polled = queue.poll();
    expect(polled, equals(task));

    // Pipeline log test
    final pipelineResult = pipeline.process(task, session: session);
    expect(pipelineResult.isReady, isTrue);

    // Executor log test
    final execResult = await executor.execute(pipelineResult);
    expect(execResult.success, isTrue);

    await sessionManager.closeSession();
  });
}
