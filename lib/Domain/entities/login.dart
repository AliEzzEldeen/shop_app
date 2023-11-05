import 'package:shop_app/Domain/entities/login_data.dart';

class Login {
  final bool status;
  final String message;
  final LoginData? data;

  Login({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}
