import 'package:dio/dio.dart';
import 'package:shop_app/Core/Network/error_message_network.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Data/Models/login_model.dart';
import 'package:shop_app/Domain/useCase/login_use_case.dart';

abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> sendLogin(LoginParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  @override
  Future<LoginModel> sendLogin(LoginParameters parameters) async {
    final response = await Dio().post(
      'https://student.valuxapps.com/api/login',
      data: {"email": parameters.email, "password": parameters.password},
    );
    if (response.statusCode == 200) {
      print(response);
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageNetwork: ErrorMessageNetwork.fromJson(
          response.data,
        ),
      );
    }
  }
}
