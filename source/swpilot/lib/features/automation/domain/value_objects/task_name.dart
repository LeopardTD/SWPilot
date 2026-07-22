import 'package:equatable/equatable.dart';

/// Value object representing an immutable Task Name.
class TaskName extends Equatable {
  final String value;

  const TaskName(this.value);

  @override
  List<Object?> get props => [value];

  @override
  String toString() => value;
}
