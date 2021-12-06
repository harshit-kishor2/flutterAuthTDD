import 'package:dartz/dartz.dart';
import 'package:qr_code/core/base/base_failure.dart';
import 'package:qr_code/features/auth/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEnity>> getLoginUser(
    String username,
    String password,
  );
}
