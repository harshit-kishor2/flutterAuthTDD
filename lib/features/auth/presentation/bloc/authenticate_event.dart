part of 'authenticate_bloc.dart';

abstract class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonClicked extends AuthenticateEvent {
  final String username;
  final String password;
  const LoginButtonClicked(
    this.username,
    this.password,
  );

  @override
  List<Object> get props => [username, password];
}

class RegisterButtonClicked extends AuthenticateEvent {
  final String username;
  final String password;
  final String firstname;
  final String lastname;
  final String email;
  const RegisterButtonClicked(
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.email,
  );

  @override
  List<Object> get props => [username, password, firstname, lastname, email];
}
