import 'package:dartz/dartz.dart';
import 'package:qr_code/core/base/base_failure.dart';
import 'package:qr_code/features/auth/domain/entities/user_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserEntity>> postRegisterUser(
    String username,
    String password,
    String firstName,
    String lastName,
    String email,
  );
}
