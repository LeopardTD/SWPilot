import 'package:equatable/equatable.dart';
import 'failure_type.dart';

/// Immutable representation of an automation failure for application/presentation layers.
class AutomationFailure extends Equatable {
  final FailureType type;
  final String message;
  final Object? originalException;

  const AutomationFailure({
    required this.type,
    required this.message,
    this.originalException,
  });

  @override
  List<Object?> get props => [type, message, originalException];
}
