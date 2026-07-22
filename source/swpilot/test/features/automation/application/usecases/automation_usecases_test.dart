import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/core/usecases/usecase.dart';
import 'package:swpilot/features/automation/application/usecases/get_active_session_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/get_automation_result_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/get_automation_status_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/pause_automation_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/resume_automation_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/start_automation_use_case.dart';
import 'package:swpilot/features/automation/application/usecases/stop_automation_use_case.dart';
import 'package:swpilot/features/automation/domain/entities/automation_result.dart';
import 'package:swpilot/features/automation/domain/entities/automation_session.dart';
import 'package:swpilot/features/automation/domain/entities/automation_task.dart';
import 'package:swpilot/features/automation/domain/enums/automation_status.dart';
import 'package:swpilot/features/automation/domain/repositories/automation_repository.dart';
import 'package:swpilot/features/automation/domain/value_objects/automation_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/session_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/task_name.dart';

class FakeAutomationRepository implements AutomationRepository {
  AutomationSession? activeSession;
  AutomationResult? lastResult;
  AutomationStatus currentStatus = AutomationStatus.idle;

  @override
  Future<AutomationSession> startAutomation({required AutomationTask task}) async {
    activeSession = AutomationSession(
      sessionId: const SessionId('sess-100'),
      startedAt: DateTime(2026, 1, 1),
      currentState: AutomationStatus.running,
    );
    currentStatus = AutomationStatus.running;
    return activeSession!;
  }

  @override
  Future<AutomationResult> stopAutomation({required SessionId sessionId}) async {
    lastResult = AutomationResult(
      success: true,
      message: 'Stopped session $sessionId',
      finishedAt: DateTime(2026, 1, 1),
    );
    currentStatus = AutomationStatus.completed;
    return lastResult!;
  }

  @override
  Future<AutomationSession> pauseAutomation({required SessionId sessionId}) async {
    activeSession = activeSession?.copyWith(currentState: AutomationStatus.paused);
    currentStatus = AutomationStatus.paused;
    return activeSession!;
  }

  @override
  Future<AutomationSession> resumeAutomation({required SessionId sessionId}) async {
    activeSession = activeSession?.copyWith(currentState: AutomationStatus.running);
    currentStatus = AutomationStatus.running;
    return activeSession!;
  }

  @override
  Future<AutomationStatus> getAutomationStatus() async => currentStatus;

  @override
  Future<AutomationSession?> getActiveSession() async => activeSession;

  @override
  Future<AutomationResult?> getAutomationResult({required SessionId sessionId}) async => lastResult;
}

void main() {
  late FakeAutomationRepository repository;

  setUp(() {
    repository = FakeAutomationRepository();
  });

  final sampleTask = AutomationTask(
    id: const AutomationId('task-1'),
    name: const TaskName('Test Task'),
    description: 'Task description',
    status: AutomationStatus.idle,
    createdAt: DateTime(2026, 1, 1),
  );

  const sessionId = SessionId('sess-100');

  test('StartAutomationUseCase delegates to repository.startAutomation', () async {
    final useCase = StartAutomationUseCase(repository);
    final session = await useCase(sampleTask);

    expect(session.sessionId, equals(sessionId));
    expect(session.currentState, equals(AutomationStatus.running));
  });

  test('StopAutomationUseCase delegates to repository.stopAutomation', () async {
    final useCase = StopAutomationUseCase(repository);
    final result = await useCase(sessionId);

    expect(result.success, isTrue);
    expect(result.message, contains('sess-100'));
  });

  test('PauseAutomationUseCase delegates to repository.pauseAutomation', () async {
    await repository.startAutomation(task: sampleTask);
    final useCase = PauseAutomationUseCase(repository);

    final session = await useCase(sessionId);
    expect(session.currentState, equals(AutomationStatus.paused));
  });

  test('ResumeAutomationUseCase delegates to repository.resumeAutomation', () async {
    await repository.startAutomation(task: sampleTask);
    await repository.pauseAutomation(sessionId: sessionId);
    final useCase = ResumeAutomationUseCase(repository);

    final session = await useCase(sessionId);
    expect(session.currentState, equals(AutomationStatus.running));
  });

  test('GetAutomationStatusUseCase delegates to repository.getAutomationStatus', () async {
    final useCase = GetAutomationStatusUseCase(repository);
    final status = await useCase(const NoParams());

    expect(status, equals(AutomationStatus.idle));
  });

  test('GetActiveSessionUseCase delegates to repository.getActiveSession', () async {
    final useCase = GetActiveSessionUseCase(repository);
    var session = await useCase(const NoParams());
    expect(session, isNull);

    await repository.startAutomation(task: sampleTask);
    session = await useCase(const NoParams());
    expect(session, isNotNull);
  });

  test('GetAutomationResultUseCase delegates to repository.getAutomationResult', () async {
    final useCase = GetAutomationResultUseCase(repository);
    var result = await useCase(sessionId);
    expect(result, isNull);

    await repository.stopAutomation(sessionId: sessionId);
    result = await useCase(sessionId);
    expect(result, isNotNull);
  });
}
