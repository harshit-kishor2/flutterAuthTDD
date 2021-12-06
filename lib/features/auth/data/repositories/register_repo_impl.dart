import 'package:dartz/dartz.dart';
import 'package:qr_code/core/base/base_failure.dart';
import 'package:qr_code/core/util/global_utility.dart';
import 'package:qr_code/features/auth/data/datasources/register_datasource.dart';
import 'package:qr_code/features/auth/domain/entities/user_entity.dart';
import 'package:qr_code/features/auth/domain/repositories/register_repo.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource registerDataSource;

  RegisterRepositoryImpl({required this.registerDataSource});
  @override
  Future<Either<Failure, UserEntity>> postRegisterUser(
      username, password, firstName, lastName, email) async {
    try {
      var registerUser = await registerDataSource.postUserApi(
          username, password, firstName, lastName, email);
      printWarning("Login $registerUser ");
      return Right(registerUser);
    } on BaseFailure catch (e) {
      return Left(BaseFailure(message: e.message, code: 500));
    } on BaseException catch (e) {
      return Left(BaseException(message: e.message, code: 500));
    }
  }
}
