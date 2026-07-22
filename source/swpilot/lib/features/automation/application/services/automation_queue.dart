import 'dart:collection';
import '../../domain/entities/automation_task.dart';
import 'automation_logger.dart';

/// In-memory First-In, First-Out (FIFO) queue for managing [AutomationTask] execution order.
class AutomationQueue {
  final ListQueue<AutomationTask> _queue = ListQueue<AutomationTask>();
  final AutomationLogger? _logger;

  /// Creates an [AutomationQueue] with optional [AutomationLogger].
  AutomationQueue({this._logger});

  /// Adds an [AutomationTask] to the end of the queue.
  void addTask(AutomationTask task) {
    _queue.addLast(task);
    _logger?.logQueue('Task Added: ${task.name.value} (${task.id.value})');
  }

  /// Views the next task in the queue without removing it.
  ///
  /// Returns `null` if the queue is empty.
  AutomationTask? peek() {
    if (_queue.isEmpty) return null;
    return _queue.first;
  }

  /// Retrieves and removes the first task from the queue.
  ///
  /// Returns `null` if the queue is empty.
  AutomationTask? poll() {
    if (_queue.isEmpty) return null;
    final task = _queue.removeFirst();
    _logger?.logQueue('Task Removed via Poll: ${task.name.value} (${task.id.value})');
    return task;
  }

  /// Removes the first task from the queue.
  ///
  /// Returns the removed [AutomationTask], or `null` if the queue was empty.
  AutomationTask? removeFirst() {
    if (_queue.isEmpty) return null;
    final task = _queue.removeFirst();
    _logger?.logQueue('Task Removed: ${task.name.value} (${task.id.value})');
    return task;
  }

  /// Clears all tasks from the queue.
  void clear() {
    _queue.clear();
    _logger?.logQueue('Queue Cleared.');
  }

  /// Returns the number of tasks currently in the queue.
  int get size => _queue.length;

  /// Checks if the queue contains no tasks.
  bool get isEmpty => _queue.isEmpty;

  /// Returns a snapshot list of current tasks in the queue.
  List<AutomationTask> toList() {
    return List<AutomationTask>.unmodifiable(_queue);
  }
}
