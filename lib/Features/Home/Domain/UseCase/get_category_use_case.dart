import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Domain/Entities/category.dart';
import 'package:shop_app/Features/Home/Domain/Repository/base_category_products.dart';

class GetCategoryUseCase extends BaseUsecase<List<Categories>,NoParameters>{
  final BaseCategoryRepository baseCategoryProducts;

  GetCategoryUseCase(this.baseCategoryProducts);

  @override
  Future<Either<Failure, List<Categories>>> call(NoParameters parameters) async {
    return await baseCategoryProducts.getCategory();
  }

}