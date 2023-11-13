import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Domain/Repository/ProductData/banner_home_repo.dart';
import 'package:shop_app/Domain/entities/HomeProduct/banner.dart';

class BannerUseCase extends BaseUsecase<List<BannerEntities>, NoParameters> {
  final BaseBannerHome baseBannerHome;

  BannerUseCase(this.baseBannerHome);


  @override
  Future<Either<Failure, List<BannerEntities>>> call(NoParameters parameters)async {
    return await baseBannerHome.getBanner();
  }
}
