import 'package:dartz/dartz.dart';
import 'package:qr_code/core/base/base_failure.dart';
import 'package:qr_code/features/auth/data/datasources/login_datasource.dart';
import 'package:qr_code/features/auth/domain/entities/login_entity.dart';
import 'package:qr_code/features/auth/domain/repositories/login_repo.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});
  @override
  Future<Either<Failure, LoginEnity>> getLoginUser(
      String email, String password) async {
    try {
      var loginUser = await loginDataSource.getLoginUserApi(email, password);
      return Right(loginUser);
    } on BaseFailure catch (e) {
      return Left(BaseFailure(message: e.message, code: 500));
    } on BaseException catch (e) {
      return Left(BaseException(message: e.message, code: 500));
    }
  }
}
