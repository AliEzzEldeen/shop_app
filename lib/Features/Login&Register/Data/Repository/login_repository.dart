import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Login&Register/Data/DataSure/login_data_source.dart';
import 'package:shop_app/Features/Login&Register/Domain/Repository/base_login_repo.dart';
import 'package:shop_app/Features/Login&Register/Domain/Entities/login.dart';
import 'package:shop_app/Features/Login&Register/Domain/UseCase/login_use_case.dart';

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