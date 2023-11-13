import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/enum.dart';
import 'package:shop_app/Domain/entities/login.dart';
import 'package:shop_app/Domain/useCase/login_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.sendLoginUseCase) : super(const LoginState()) {
    on<SendLoginEvent>(sendLoginEvent);
  }

  final LoginUseCase sendLoginUseCase;

  FutureOr<void> sendLoginEvent(
      SendLoginEvent event, Emitter<LoginState> emit) async {
    final result = await sendLoginUseCase(
        LoginParameters(email: event.email, password: event.password));
    result.fold(
      (l) => emit(state.copyWith(
          loginState: RequestState.error, loginMessage: l.message)),
      (r) => emit(
        state.copyWith(login: r, loginState: RequestState.isLoaded),
      ),
    );
  }
}
