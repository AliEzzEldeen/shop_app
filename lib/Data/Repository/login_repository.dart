import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Data/DataSource/login_data_source.dart';
import 'package:shop_app/Domain/Repository/base_login_repo.dart';
import 'package:shop_app/Domain/entities/login.dart';
import 'package:shop_app/Domain/useCase/login_use_case.dart';

class LoginRepository extends BaseLoginRepo{
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);
  @override
  Future<Either<Failure, Login>> sendLogin(LoginParameters parameters) async {
    final result = await baseLoginRemoteDataSource.sendLogin(parameters);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }
}