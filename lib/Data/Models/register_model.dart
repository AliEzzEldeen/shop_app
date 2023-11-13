import 'package:shop_app/Data/Models/register_data_model.dart';
import 'package:shop_app/Domain/entities/register.dart';

class RegisterModel extends Register {
  RegisterModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return RegisterModel(status: false, data: null, message: json['message']);
    }

    if (json['status'] is bool && json['data'] is Map<String, dynamic> && json['message'] is String) {
      return RegisterModel(
        status: json['status'] ?? false,
        data: json['data'] != null? RegisterDataModel.fromJson(json['data']): null,
        message: json['message'] ?? '',
      );

    } else {
      return RegisterModel(status: false, data: null, message:json['message'] );
    }

  }

}
