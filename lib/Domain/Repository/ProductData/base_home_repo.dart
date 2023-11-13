import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Domain/entities/HomeProduct/product.dart';

abstract class BaseHomeRepository{
  Future<Either<Failure,List<ProductsData>>> getProduct();

}