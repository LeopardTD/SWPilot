import '../../domain/entities/automation_result.dart';
import '../../domain/entities/automation_session.dart';
import '../../domain/entities/automation_task.dart';
import '../../domain/enums/automation_status.dart';
import '../../domain/repositories/automation_repository.dart';
import '../../domain/value_objects/session_id.dart';
import '../datasources/automation_local_datasource.dart';

/// Infrastructure implementation of [AutomationRepository] using in-memory local data source.
class AutomationRepositoryImpl implements AutomationRepository {
  final AutomationLocalDataSource _localDataSource;

  /// Creates an [AutomationRepositoryImpl] by injecting [AutomationLocalDataSource].
  AutomationRepositoryImpl(this._localDataSource);

  @override
  Future<AutomationSession> startAutomation({required AutomationTask task}) async {
    final sessionId = SessionId('session-${task.id.value}');
    final session = AutomationSession(
      sessionId: sessionId,
      startedAt: DateTime.now(),
      currentState: AutomationStatus.running,
    );

    _localDataSource.setActiveSession(session);
    _localDataSource.setStatus(AutomationStatus.running);

    return session;
  }

  @override
  Future<AutomationResult> stopAutomation({required SessionId sessionId}) async {
    final now = DateTime.now();
    final result = AutomationResult(
      success: true,
      message: 'Automation stopped for session ${sessionId.value}',
      finishedAt: now,
    );

    final activeSession = _localDataSource.getActiveSession();
    if (activeSession != null && activeSession.sessionId == sessionId) {
      final updatedSession = activeSession.copyWith(
        currentState: AutomationStatus.cancelled,
        finishedAt: now,
      );
      _localDataSource.setActiveSession(updatedSession);
    }

    _localDataSource.saveResult(sessionId, result);
    _localDataSource.setStatus(AutomationStatus.cancelled);

    return result;
  }

  @override
  Future<AutomationSession> pauseAutomation({required SessionId sessionId}) async {
    final activeSession = _localDataSource.getActiveSession();
    final currentSession = activeSession ??
        AutomationSession(
          sessionId: sessionId,
          startedAt: DateTime.now(),
          currentState: AutomationStatus.running,
        );

    final pausedSession = currentSession.copyWith(
      currentState: AutomationStatus.paused,
    );

    _localDataSource.setActiveSession(pausedSession);
    _localDataSource.setStatus(AutomationStatus.paused);

    return pausedSession;
  }

  @override
  Future<AutomationSession> resumeAutomation({required SessionId sessionId}) async {
    final activeSession = _localDataSource.getActiveSession();
    final currentSession = activeSession ??
        AutomationSession(
          sessionId: sessionId,
          startedAt: DateTime.now(),
          currentState: AutomationStatus.paused,
        );

    final resumedSession = currentSession.copyWith(
      currentState: AutomationStatus.running,
    );

    _localDataSource.setActiveSession(resumedSession);
    _localDataSource.setStatus(AutomationStatus.running);

    return resumedSession;
  }

  @override
  Future<AutomationStatus> getAutomationStatus() async {
    return _localDataSource.getStatus();
  }

  @override
  Future<AutomationSession?> getActiveSession() async {
    return _localDataSource.getActiveSession();
  }

  @override
  Future<AutomationResult?> getAutomationResult({required SessionId sessionId}) async {
    return _localDataSource.getResult(sessionId);
  }
}
