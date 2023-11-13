import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/enum.dart';
import 'package:shop_app/Domain/entities/register.dart';
import 'package:shop_app/Domain/useCase/register_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerUseCase) : super(const RegisterState()) {
    on<SendRegisterEvent>(sendLoginEvent);
  }

  final RegisterUseCase registerUseCase;

  FutureOr<void> sendLoginEvent(
      SendRegisterEvent event, Emitter<RegisterState> emit) async {
    final result = await registerUseCase(SignUpParameters(
      name: event.name,
      email: event.email,
      password: event.password,
      phone: event.phone,
    ));
    result.fold((l) => emit(state.copyWith(
      registerState: RequestState.error,
      registerMessage: l.message,
    )), (r) => emit(state.copyWith(
      register: r, registerState: RequestState.isLoaded
    )));
  }
}
