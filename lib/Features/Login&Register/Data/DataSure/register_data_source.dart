import 'package:dio/dio.dart';
import 'package:shop_app/Core/Network/error_message_network.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Features/Login&Register/Data/Models/register_model.dart';
import 'package:shop_app/Features/Login&Register/Domain/UseCase/register_use_case.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<RegisterModel> sendRegister(SignUpParameters parameters);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<RegisterModel> sendRegister(SignUpParameters parameters) async {
    final response =
        await Dio().post('https://student.valuxapps.com/api/register', data: {
      "email": parameters.email,
      "name": parameters.name,
      "password": parameters.password,
      "phone": parameters.phone,
    });
    if (response.statusCode == 200) {
      print(response.data);
      return RegisterModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageNetwork: ErrorMessageNetwork.fromJson(
          response.data,
        ),
      );
    }
  }
}
