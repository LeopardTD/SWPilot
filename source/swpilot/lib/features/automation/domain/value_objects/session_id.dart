import 'package:equatable/equatable.dart';

/// Value object representing a unique Session identifier.
class SessionId extends Equatable {
  final String value;

  const SessionId(this.value);

  @override
  List<Object?> get props => [value];

  @override
  String toString() => value;
}
