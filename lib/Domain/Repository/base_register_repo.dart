import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Domain/entities/register.dart';
import 'package:shop_app/Domain/useCase/register_use_case.dart';

abstract class BaseRegisterRepo{
  Future<Either<Failure,Register>> sendSignUp(SignUpParameters parameters);
}
