import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Data/DataSource/banner_data_source.dart';
import 'package:shop_app/Features/Home/Domain/Entities/banner.dart';
import 'package:shop_app/Features/Home/Domain/Repository/banner_home_repo.dart';

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