import 'package:equatable/equatable.dart';

/// Value object representing a unique Automation identifier.
class AutomationId extends Equatable {
  final String value;

  const AutomationId(this.value);

  @override
  List<Object?> get props => [value];

  @override
  String toString() => value;
}
