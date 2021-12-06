import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code/core/util/global_utility.dart';
import 'package:qr_code/core/util/shared_preference.dart';

import 'package:qr_code/features/auth/domain/entities/login_entity.dart';
import 'package:qr_code/features/auth/domain/entities/user_entity.dart';
import 'package:qr_code/features/auth/domain/usecases/login_usecase.dart';
import 'package:qr_code/features/auth/domain/usecases/register_usecase.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final LoginUsecase loginUseCase;
  final RegisterUsecase registrUseCase;
  final SharedPreferenceModule sharedPreferenceModule;
  AuthenticateBloc({
    required this.loginUseCase,
    required this.registrUseCase,
    required this.sharedPreferenceModule,
  }) : super(AuthenticateInitial()) {
    //Login Event
    on<LoginButtonClicked>((event, emit) async {
      emit(AuthLoadingState());
      final loginFailedOrSuccess = await loginUseCase(
          LoginParams(username: event.username, password: event.password));
      loginFailedOrSuccess.fold((l) => emit(const AuthFailureState()),
          (r) => emit(LoginLoadedState(loginEntity: r)));
    });

    //Register event
    on<RegisterButtonClicked>((event, emit) async {
      emit(AuthLoadingState());
      final registerFailedOrSuccess = await registrUseCase(RegisterParams(
          username: event.username,
          password: event.password,
          email: event.email,
          firstName: event.firstname,
          lastName: event.lastname));
      printWarning('registerFailedOrSuccess $registerFailedOrSuccess');
      registerFailedOrSuccess.fold((l) => emit(const AuthFailureState()),
          (r) => emit(RegisterLoadedState(userEntity: r)));
    });
  }
}
