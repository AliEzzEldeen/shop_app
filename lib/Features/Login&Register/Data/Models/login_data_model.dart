import 'package:shop_app/Features/Login&Register/Domain/Entities/login_data.dart';

class LoginDataModel extends LoginData {
  LoginDataModel({
    required super.id,
    required super.points,
    required super.credit,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.token,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        id: json["id"],
        points: json["points"],
        credit: json["credit"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        token: json["token"],
      );
}
