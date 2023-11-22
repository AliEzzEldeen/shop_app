part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class SendRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String phone;

  const SendRegisterEvent(
    this.name,
    this.email,
    this.password,
    this.phone,
  );

  @override
  List<Object> get props => [
        name,
        email,
        password,
        phone,
      ];
}
