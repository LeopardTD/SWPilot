import 'package:equatable/equatable.dart';

/// Represents the final outcome/result of an automation execution.
class AutomationResult extends Equatable {
  final bool success;
  final String message;
  final DateTime finishedAt;

  const AutomationResult({
    required this.success,
    required this.message,
    required this.finishedAt,
  });

  AutomationResult copyWith({
    bool? success,
    String? message,
    DateTime? finishedAt,
  }) {
    return AutomationResult(
      success: success ?? this.success,
      message: message ?? this.message,
      finishedAt: finishedAt ?? this.finishedAt,
    );
  }

  @override
  List<Object?> get props => [success, message, finishedAt];
}
