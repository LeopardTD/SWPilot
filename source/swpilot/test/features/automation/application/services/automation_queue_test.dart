import 'package:flutter_test/flutter_test.dart';
import 'package:swpilot/features/automation/application/services/automation_queue.dart';
import 'package:swpilot/features/automation/domain/entities/automation_task.dart';
import 'package:swpilot/features/automation/domain/enums/automation_status.dart';
import 'package:swpilot/features/automation/domain/enums/automation_task_type.dart';
import 'package:swpilot/features/automation/domain/value_objects/automation_id.dart';
import 'package:swpilot/features/automation/domain/value_objects/task_name.dart';

void main() {
  late AutomationQueue queue;

  setUp(() {
    queue = AutomationQueue();
  });

  final taskA = AutomationTask(
    id: const AutomationId('task-a'),
    name: const TaskName('Task A'),
    description: 'First Task',
    status: AutomationStatus.idle,
    type: AutomationTaskType.login,
    createdAt: DateTime(2026, 1, 1),
  );

  final taskB = AutomationTask(
    id: const AutomationId('task-b'),
    name: const TaskName('Task B'),
    description: 'Second Task',
    status: AutomationStatus.idle,
    type: AutomationTaskType.checkIn,
    createdAt: DateTime(2026, 1, 1),
  );

  final taskC = AutomationTask(
    id: const AutomationId('task-c'),
    name: const TaskName('Task C'),
    description: 'Third Task',
    status: AutomationStatus.idle,
    type: AutomationTaskType.navigation,
    createdAt: DateTime(2026, 1, 1),
  );

  test('initial queue is empty', () {
    expect(queue.isEmpty, isTrue);
    expect(queue.size, equals(0));
    expect(queue.peek(), isNull);
    expect(queue.poll(), isNull);
    expect(queue.removeFirst(), isNull);
    expect(queue.toList(), isEmpty);
  });

  test('addTask enqueues items and updates size/isEmpty', () {
    queue.addTask(taskA);
    expect(queue.isEmpty, isFalse);
    expect(queue.size, equals(1));

    queue.addTask(taskB);
    expect(queue.size, equals(2));
  });

  test('FIFO ordering with peek and poll', () {
    queue.addTask(taskA);
    queue.addTask(taskB);
    queue.addTask(taskC);

    // peek does not remove taskA
    expect(queue.peek(), equals(taskA));
    expect(queue.size, equals(3));

    // poll retrieves taskA and removes it
    expect(queue.poll(), equals(taskA));
    expect(queue.size, equals(2));

    // next peek is taskB
    expect(queue.peek(), equals(taskB));

    expect(queue.poll(), equals(taskB));
    expect(queue.poll(), equals(taskC));

    // queue is now empty
    expect(queue.isEmpty, isTrue);
    expect(queue.poll(), isNull);
  });

  test('removeFirst removes first item', () {
    queue.addTask(taskA);
    queue.addTask(taskB);

    final removed = queue.removeFirst();
    expect(removed, equals(taskA));
    expect(queue.size, equals(1));
    expect(queue.peek(), equals(taskB));
  });

  test('clear removes all items from queue', () {
    queue.addTask(taskA);
    queue.addTask(taskB);
    queue.addTask(taskC);
    expect(queue.size, equals(3));

    queue.clear();
    expect(queue.isEmpty, isTrue);
    expect(queue.size, equals(0));
    expect(queue.toList(), isEmpty);
  });

  test('toList returns snapshot of current queue state', () {
    queue.addTask(taskA);
    queue.addTask(taskB);

    final snapshot = queue.toList();
    expect(snapshot, equals([taskA, taskB]));

    // Mutating snapshot does not affect original queue if unmodifiable
    expect(() => snapshot.add(taskC), throwsUnsupportedError);
  });
}
