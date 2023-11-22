import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Data/DataSource/product_data_source.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';
import 'package:shop_app/Features/Home/Domain/Repository/base_home_repo.dart';

 class ProductRepository extends BaseHomeRepository{

  final BaseProductsRemoteDataSource baseProductsRemoteDataSource;

  ProductRepository(this.baseProductsRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductsData>>> getProduct() async{
    final result = await baseProductsRemoteDataSource.getProduct();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
    }
  }


}