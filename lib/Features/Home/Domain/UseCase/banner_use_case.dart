import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Features/Home/Domain/Entities/banner.dart';
import 'package:shop_app/Features/Home/Domain/Repository/banner_home_repo.dart';

class BannerUseCase extends BaseUsecase<List<BannerEntities>, NoParameters> {
  final BaseBannerHome baseBannerHome;

  BannerUseCase(this.baseBannerHome);


  @override
  Future<Either<Failure, List<BannerEntities>>> call(NoParameters parameters)async {
    return await baseBannerHome.getBanner();
  }
}
