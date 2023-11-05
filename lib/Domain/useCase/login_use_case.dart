import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Domain/Repository/base_login_repo.dart';
import 'package:shop_app/Domain/entities/login.dart';

class LoginUseCase extends BaseUsecase<Login, LoginParameters> {
  final BaseLoginRepo baseLoginRepo;

  LoginUseCase(this.baseLoginRepo);

  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters) async {
    return await baseLoginRepo.sendLogin(parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({required this.email, required this.password});

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
