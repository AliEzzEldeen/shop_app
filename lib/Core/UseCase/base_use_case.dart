import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/error/failure.dart';


abstract class BaseUsecase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}