import 'package:equatable/equatable.dart';
import '../enums/native_operation.dart';

/// Represents a request sent through the native automation bridge.
class NativeRequest extends Equatable {
  final NativeOperation operation;
  final Map<String, dynamic> parameters;

  const NativeRequest({
    required this.operation,
    this.parameters = const {},
  });

  @override
  List<Object?> get props => [operation, parameters];
}
