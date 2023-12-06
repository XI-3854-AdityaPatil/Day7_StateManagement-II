import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String statusCode;
  final String message;

  const Failure(
    this.statusCode,
    this.message,
  );

  @override
  List<Object> get props => [message, statusCode];
}
