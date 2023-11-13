import 'package:dartz/dartz.dart';
import 'package:shop_app/Core/error/failure.dart';
import 'package:shop_app/Domain/entities/HomeProduct/banner.dart';

abstract class BaseBannerHome{
  Future<Either<Failure,List<BannerEntities>>> getBanner();
}