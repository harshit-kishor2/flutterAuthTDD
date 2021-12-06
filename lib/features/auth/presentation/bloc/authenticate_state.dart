part of 'authenticate_bloc.dart';

abstract class AuthenticateState extends Equatable {
  const AuthenticateState();

  @override
  List<Object> get props => [];
}

class AuthenticateInitial extends AuthenticateState {}

class AuthLoadingState extends AuthenticateState {}

class AuthFailureState extends AuthenticateState {
  const AuthFailureState();

  @override
  List<Object> get props => [];
}

class LoginLoadedState extends AuthenticateState {
  final LoginEnity loginEntity;
  const LoginLoadedState({required this.loginEntity});

  @override
  List<Object> get props => [loginEntity];
}

class RegisterLoadedState extends AuthenticateState {
  final UserEntity userEntity;
  const RegisterLoadedState({
    required this.userEntity,
  });

  @override
  List<Object> get props => [];
}
