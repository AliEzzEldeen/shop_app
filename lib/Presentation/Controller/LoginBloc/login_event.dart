part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SendLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const SendLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
