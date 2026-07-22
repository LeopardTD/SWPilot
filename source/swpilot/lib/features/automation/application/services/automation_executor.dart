import '../../domain/entities/automation_result.dart';
import '../../domain/entities/pipeline_result.dart';
import '../../domain/enums/automation_status.dart';
import '../../domain/repositories/automation_repository.dart';
import '../../domain/state_machine/automation_state_machine.dart';
import 'automation_logger.dart';

/// Application service foundation responsible for executing tasks validated by the pipeline.
class AutomationExecutor {
  final AutomationRepository _repository;
  final AutomationLogger? _logger;

  /// Reference to the injected repository.
  AutomationRepository get repository => _repository;

  /// Creates an [AutomationExecutor] by injecting [AutomationRepository] and optional [AutomationLogger].
  AutomationExecutor(this._repository, {this._logger});

  /// Rejects execution when a [pipelineResult] is not ready.
  AutomationResult reject(PipelineResult pipelineResult) {
    _logger?.logExecutor('Execution Rejected for task ${pipelineResult.task.id.value}: ${pipelineResult.message}');
    return AutomationResult(
      success: false,
      message: 'Execution rejected: ${pipelineResult.message}',
      finishedAt: DateTime.now(),
    );
  }

  /// Executes a task provided by [pipelineResult].
  ///
  /// Evaluates readiness, applies [AutomationStateMachine] lifecycle transitions,
  /// and returns an [AutomationResult].
  Future<AutomationResult> execute(PipelineResult pipelineResult) async {
    if (!pipelineResult.isReady) {
      return reject(pipelineResult);
    }

    _logger?.logExecutor('Execution Started for task ${pipelineResult.task.name.value} (${pipelineResult.task.id.value})');

    var stateMachine = const AutomationStateMachine(currentState: AutomationStatus.preparing);
    stateMachine = stateMachine.transitionTo(AutomationStatus.running) ?? stateMachine;

    final now = DateTime.now();

    // Simulated execution completion
    stateMachine = stateMachine.transitionTo(AutomationStatus.completed) ?? stateMachine;

    final result = AutomationResult(
      success: true,
      message: 'Task "${pipelineResult.task.name.value}" executed successfully via pipeline.',
      finishedAt: now,
    );

    _logger?.logExecutor('Execution Completed for task ${pipelineResult.task.name.value} (${pipelineResult.task.id.value})');
    return result;
  }
}
