import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';
import 'package:shop_app/Features/Home/Domain/Repository/base_category_products.dart';

class GetCategoryProductUseCase
    extends BaseUsecase <List<ProductsData>, CategoryId> {
  final BaseCategoryRepository baseCategoryRepository;

  GetCategoryProductUseCase(this.baseCategoryRepository);

  @override
  Future<Either<Failure, List<ProductsData>>> call(
      CategoryId parameters) async {
    return await baseCategoryRepository.getCategoryProduct(parameters);
  }
}

class CategoryId extends Equatable{
  final String id;

  const CategoryId({required this.id});

  @override
  List<Object> get props => [id];
}
