import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Data/DataSource/register_data_source.dart';
import 'package:shop_app/Domain/Repository/base_register_repo.dart';
import 'package:shop_app/Domain/entities/register.dart';
import 'package:shop_app/Domain/useCase/register_use_case.dart';

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
