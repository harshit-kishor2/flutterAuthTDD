import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int code1;
  final String message1;

  const Failure({required this.message1, required this.code1});

  @override
  List<Object?> get props => [];
}

class BaseFailure extends Failure {
  final int code;
  final String message;

  const BaseFailure({required this.message, required this.code})
      : super(message1: message, code1: code);
}

class BaseException extends Failure implements Exception {
  final int code;
  final String message;

  const BaseException({required this.message, required this.code})
      : super(message1: message, code1: code);
}
