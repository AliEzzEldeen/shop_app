import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Login&Register/Data/DataSure/register_data_source.dart';
import 'package:shop_app/Features/Login&Register/Domain/Repository/base_register_repo.dart';
import 'package:shop_app/Features/Login&Register/Domain/Entities/register.dart';
import 'package:shop_app/Features/Login&Register/Domain/UseCase/register_use_case.dart';

class RegisterRepository extends BaseRegisterRepo {
  final BaseRegisterRemoteDataSource baseRegisterRemoteDataSource;

  RegisterRepository(this.baseRegisterRemoteDataSource);

  @override
  Future<Either<Failure, Register>> sendSignUp(
      SignUpParameters parameters) async {
    final result = await baseRegisterRemoteDataSource.sendRegister(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }
}
