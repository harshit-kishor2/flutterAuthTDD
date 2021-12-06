import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code/core/base/base_failure.dart';
import 'package:qr_code/core/base/usecase.dart';
import 'package:qr_code/features/auth/domain/entities/user_entity.dart';
import 'package:qr_code/features/auth/domain/repositories/register_repo.dart';

class RegisterUsecase implements UseCase<UserEntity, RegisterParams> {
  final RegisterRepository registerRepository;

  RegisterUsecase({required this.registerRepository});

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    return await registerRepository.postRegisterUser(
      params.username,
      params.password,
      params.firstName,
      params.lastName,
      params.email,
    );
  }
}

//Parameter for function call
class RegisterParams extends Equatable {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  const RegisterParams({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
  @override
  List<Object> get props => [username, password, firstName, lastName, email];
}
