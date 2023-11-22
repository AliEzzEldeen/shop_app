import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Login&Register/Domain/Entities/register.dart';
import 'package:shop_app/Features/Login&Register/Domain/UseCase/register_use_case.dart';

abstract class BaseRegisterRepo{
  Future<Either<Failure,Register>> sendSignUp(SignUpParameters parameters);
}
