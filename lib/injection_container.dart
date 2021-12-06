import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code/core/util/shared_preference.dart';
import 'package:qr_code/features/auth/data/datasources/login_datasource.dart';
import 'package:qr_code/features/auth/data/datasources/register_datasource.dart';
import 'package:qr_code/features/auth/data/repositories/login_repo_impl.dart';
import 'package:qr_code/features/auth/data/repositories/register_repo_impl.dart';
import 'package:qr_code/features/auth/domain/repositories/login_repo.dart';
import 'package:qr_code/features/auth/domain/repositories/register_repo.dart';
import 'package:qr_code/features/auth/domain/usecases/login_usecase.dart';
import 'package:qr_code/features/auth/domain/usecases/register_usecase.dart';
import 'package:qr_code/features/auth/presentation/bloc/authenticate_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; //sl=> service locator

Future<void> init() async {
  //start

/* ==================================== Features ====================================== */

  //! blocs
  sl.registerFactory(
    () => AuthenticateBloc(
        loginUseCase: sl(), registrUseCase: sl(), sharedPreferenceModule: sl()),
  );

  //! useCases
  sl.registerLazySingleton(() => LoginUsecase(loginRepository: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(registerRepository: sl()));

  //! repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(loginDataSource: sl()),
  );
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(registerDataSource: sl()),
  );

  //! datasource
  sl.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(client: sl()));
  sl.registerLazySingleton<RegisterDataSource>(
      () => RegisterDataSourceImpl(client: sl()));

/* =================================== External ======================================= */

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<SharedPreferenceModule>(
      () => SharedPreferenceModule(pref: sl<SharedPreferences>()));

  sl.registerLazySingleton(() => http.Client());

  //End
}
