import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Domain/entities/login.dart';
import 'package:shop_app/Domain/useCase/login_use_case.dart';

abstract class BaseLoginRepo{
  Future<Either<Failure,Login>> sendLogin(LoginParameters parameters);
}