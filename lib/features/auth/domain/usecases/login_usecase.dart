import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code/core/base/base_failure.dart';
import 'package:qr_code/core/base/usecase.dart';
import 'package:qr_code/features/auth/domain/entities/login_entity.dart';
import 'package:qr_code/features/auth/domain/repositories/login_repo.dart';

class LoginUsecase implements UseCase<LoginEnity, LoginParams> {
  final LoginRepository loginRepository;

  LoginUsecase({required this.loginRepository});

  @override
  Future<Either<Failure, LoginEnity>> call(LoginParams params) async {
    return await loginRepository.getLoginUser(params.username, params.password);
  }
}

//Parameter for function call
class LoginParams extends Equatable {
  final String username;
  final String password;
  const LoginParams({required this.username, required this.password});
  @override
  List<Object> get props => [username, password];
}
