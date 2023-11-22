import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';
import 'package:shop_app/Features/Home/Domain/Repository/base_home_repo.dart';

class ProductUseCase extends BaseUsecase<List<ProductsData>,NoParameters>{
  final BaseHomeRepository baseHomeRepository;

  ProductUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<ProductsData>>> call(NoParameters parameters)async {
   return await baseHomeRepository.getProduct();
  }
}