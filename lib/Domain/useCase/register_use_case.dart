import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Domain/Repository/base_register_repo.dart';
import 'package:shop_app/Domain/entities/register.dart';

class RegisterUseCase extends BaseUsecase<Register, SignUpParameters> {
  final BaseRegisterRepo baseRegisterRepo;

  RegisterUseCase(this.baseRegisterRepo);

  @override
  Future<Either<Failure, Register>> call(SignUpParameters parameters) async {
    return await baseRegisterRepo.sendSignUp(parameters as SignUpParameters);
  }
}

class SignUpParameters extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;

  const SignUpParameters({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
        phone,
      ];
}
