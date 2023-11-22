part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.registerMessage = '',
    this.register,
    this.registerState = RequestState.isLoading,
  });

  final Register? register;
  final RequestState registerState;
  final String registerMessage;

  RegisterState copyWith({
    Register? register,
    RequestState? registerState,
    String? registerMessage,
  }) {
    return RegisterState(
      registerMessage: registerMessage ?? this.registerMessage,
      register: register ?? register,
      registerState:  registerState ?? this.registerState,
    );
  }

  @override
  List<Object?> get props => [register,registerState,registerMessage];
}
