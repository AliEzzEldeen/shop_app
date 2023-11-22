import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';

abstract class BaseHomeRepository{
  Future<Either<Failure,List<ProductsData>>> getProduct();

}