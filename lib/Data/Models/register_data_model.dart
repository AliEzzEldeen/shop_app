import 'package:shop_app/Domain/entities/register.dart';

class RegisterDataModel extends RegisterData {
  RegisterDataModel({
    required super.email,
    required super.name,
    required super.phone,
    required super.id,
    required super.image,
    required super.token,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        token: json['token'],
      );
}
