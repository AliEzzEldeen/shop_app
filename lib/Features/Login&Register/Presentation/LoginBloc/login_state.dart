part of 'login_bloc.dart';

 class LoginState extends Equatable {
  const LoginState({
    this.login,
    this.loginState = RequestState.isLoading,
    this.LoginMessage = '',
  });

  final Login? login;
  final RequestState? loginState;
  final String? LoginMessage;

  LoginState copyWith({
    Login? login,
    RequestState? loginState,
    String? loginMessage,
  }) {
    return LoginState(
        login: login ?? this.login,
        LoginMessage: loginMessage ?? this.LoginMessage,
        loginState: loginState ?? this.loginState);
  }

  @override
  List<Object?> get props => [login, loginState, LoginMessage];
}

