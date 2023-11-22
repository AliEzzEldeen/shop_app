import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Login&Register/Domain/Entities/login.dart';
import 'package:shop_app/Features/Login&Register/Domain/UseCase/login_use_case.dart';

abstract class BaseLoginRepo{
  Future<Either<Failure,Login>> sendLogin(LoginParameters parameters);
}