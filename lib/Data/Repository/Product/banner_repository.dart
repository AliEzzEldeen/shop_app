import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Data/DataSource/ProductDataSource/banner_data_source.dart';
import 'package:shop_app/Domain/Repository/ProductData/banner_home_repo.dart';
import 'package:shop_app/Domain/entities/HomeProduct/banner.dart';

class BannerRepository extends BaseBannerHome{

  final BaseBannerRemoteDataSource baseBannerRemoteDataSource;

  BannerRepository(this.baseBannerRemoteDataSource);
  @override
  Future<Either<Failure, List<BannerEntities>>> getBanner() async {
   final result = await baseBannerRemoteDataSource.getBanner();
   try{
     return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageNetwork.statusMessage));
   }
  }
}