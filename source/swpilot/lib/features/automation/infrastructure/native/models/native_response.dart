import 'package:equatable/equatable.dart';

/// Represents a response received from the native automation bridge.
class NativeResponse extends Equatable {
  final bool success;
  final Map<String, dynamic> data;
  final String message;

  const NativeResponse({
    required this.success,
    this.data = const {},
    this.message = '',
  });

  @override
  List<Object?> get props => [success, data, message];
}
