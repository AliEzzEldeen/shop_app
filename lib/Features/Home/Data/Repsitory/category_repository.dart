import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Data/DataSource/category_data_source.dart';
import 'package:shop_app/Features/Home/Domain/Entities/category.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';
import 'package:shop_app/Features/Home/Domain/Repository/base_category_products.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/get_category_product_use_case.dart';

class CategoryRepository extends BaseCategoryRepository {
  final BaseCategoryRemoteDataSource baseCategoryRemoteDataSource;

  CategoryRepository(this.baseCategoryRemoteDataSource);

  @override
  Future<Either<Failure, List<Categories>>> getCategory() async {
    final result = await baseCategoryRemoteDataSource.getCategories();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductsData>>> getCategoryProduct(
      CategoryId parameters) async {
    final result =
        await baseCategoryRemoteDataSource.getCategoryProducts(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }
}
