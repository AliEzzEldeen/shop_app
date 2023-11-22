import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Domain/Entities/category.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/get_category_product_use_case.dart';

abstract class BaseCategoryRepository {
  Future<Either<Failure, List<Categories>>> getCategory();
  Future<Either<Failure, List<ProductsData>>> getCategoryProduct(CategoryId parameters);
}


