import '../../domain/entities/automation_session.dart';
import '../../domain/entities/automation_task.dart';
import '../../domain/entities/pipeline_result.dart';
import '../../domain/enums/automation_status.dart';
import 'automation_logger.dart';

/// Stateless service responsible for validating and preparing an [AutomationTask] before execution.
class AutomationPipeline {
  final AutomationLogger? _logger;

  /// Creates an [AutomationPipeline] with optional [AutomationLogger].
  AutomationPipeline({this._logger});

  /// Validates whether a given [task] is ready and eligible for processing.
  bool validate(AutomationTask? task, {AutomationSession? session}) {
    _logger?.logPipeline('Pipeline Validation Started for task ${task?.id.value ?? "null"}');
    if (task == null) {
      _logger?.logPipeline('Pipeline Validation Failed: Null task.');
      return false;
    }
    if (task.status == AutomationStatus.failed || task.status == AutomationStatus.cancelled) {
      _logger?.logPipeline('Pipeline Validation Failed: Task in ${task.status} state.');
      return false;
    }
    _logger?.logPipeline('Pipeline Validation Passed for task ${task.id.value}');
    return true;
  }

  /// Prepares the [task] context before execution.
  bool prepare(AutomationTask task) {
    _logger?.logPipeline('Pipeline Prepared for task ${task.id.value}');
    return true;
  }

  /// Evaluates whether a [result] is ready for execution by the Executor.
  bool isReady(PipelineResult result) {
    return result.isReady;
  }

  /// Processes [task] through validation and preparation stages, returning a [PipelineResult].
  PipelineResult process(AutomationTask task, {AutomationSession? session}) {
    final now = DateTime.now();

    if (!validate(task, session: session)) {
      return PipelineResult(
        task: task,
        isReady: false,
        message: 'Task validation failed.',
        timestamp: now,
      );
    }

    final isPrepared = prepare(task);
    if (!isPrepared) {
      return PipelineResult(
        task: task,
        isReady: false,
        message: 'Task preparation failed.',
        timestamp: now,
      );
    }

    return PipelineResult(
      task: task,
      isReady: true,
      message: 'Task validated and prepared successfully.',
      timestamp: now,
    );
  }
}
