import '../entities/automation_result.dart';
import '../entities/automation_session.dart';
import '../entities/automation_task.dart';
import '../enums/automation_status.dart';
import '../value_objects/session_id.dart';

/// Abstract repository contract for Automation Engine operations.
///
/// Defines high-level domain operations for managing automation tasks,
/// session states, and execution results without coupling to infrastructure implementations.
abstract class AutomationRepository {
  /// Starts executing the given [task] and initializes a new [AutomationSession].
  Future<AutomationSession> startAutomation({required AutomationTask task});

  /// Stops an active automation session identified by [sessionId] and returns the final [AutomationResult].
  Future<AutomationResult> stopAutomation({required SessionId sessionId});

  /// Pauses an active automation session identified by [sessionId].
  Future<AutomationSession> pauseAutomation({required SessionId sessionId});

  /// Resumes a paused automation session identified by [sessionId].
  Future<AutomationSession> resumeAutomation({required SessionId sessionId});

  /// Retrieves the current execution status of the automation engine.
  Future<AutomationStatus> getAutomationStatus();

  /// Retrieves the currently active automation session, if any.
  Future<AutomationSession?> getActiveSession();

  /// Retrieves the execution result for a specific [sessionId], if available.
  Future<AutomationResult?> getAutomationResult({required SessionId sessionId});
}
