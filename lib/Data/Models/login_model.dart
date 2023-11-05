import 'package:shop_app/Data/Models/login_data_model.dart';
import 'package:shop_app/Domain/entities/login.dart';


class LoginModel extends Login {
  LoginModel({
    required super.status,
    required super.data,
    required super.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return LoginModel(status: false, data: null, message: "Invalid JSON data");
    }

    if (json['status'] is bool && json['data'] is Map<String, dynamic> && json['message'] is String) {
      return LoginModel(
        status: json['status'],
        data: LoginDataModel.fromJson(json['data']),
        message: json['message'],
      );

    } else {
      return LoginModel(status: false, data: null, message: "Invalid JSON structure");
    }

  }

}