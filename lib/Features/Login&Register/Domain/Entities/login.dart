import 'package:shop_app/Features/Login&Register/Domain/Entities/login_data.dart';

class Login {
  final bool status;
  final String message;
  final LoginData? data;

  Login({
    required this.status,
    required this.message,
    required this.data,
  });

  List<Object?> get props => [status, message, data];
}
