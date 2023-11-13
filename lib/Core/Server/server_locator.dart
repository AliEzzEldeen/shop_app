
import 'package:get_it/get_it.dart';
import 'package:shop_app/Data/DataSource/ProductDataSource/banner_data_source.dart';
import 'package:shop_app/Data/DataSource/ProductDataSource/product_data_source.dart';
import 'package:shop_app/Data/DataSource/login_data_source.dart';
import 'package:shop_app/Data/DataSource/register_data_source.dart';
import 'package:shop_app/Data/Repository/Product/banner_repository.dart';
import 'package:shop_app/Data/Repository/Product/product_repository.dart';
import 'package:shop_app/Data/Repository/login_repository.dart';
import 'package:shop_app/Data/Repository/register_repository.dart';
import 'package:shop_app/Domain/Repository/ProductData/banner_home_repo.dart';
import 'package:shop_app/Domain/Repository/ProductData/base_home_repo.dart';
import 'package:shop_app/Domain/Repository/base_login_repo.dart';
import 'package:shop_app/Domain/Repository/base_register_repo.dart';
import 'package:shop_app/Domain/useCase/Product/banner_use_case.dart';
import 'package:shop_app/Domain/useCase/Product/product_use_case.dart';
import 'package:shop_app/Domain/useCase/login_use_case.dart';
import 'package:shop_app/Domain/useCase/register_use_case.dart';
import 'package:shop_app/Presentation/Controller/HomeBloc/BannerBloc/banner_bloc.dart';
import 'package:shop_app/Presentation/Controller/HomeBloc/home_bloc.dart';
import 'package:shop_app/Presentation/Controller/RegisterBloc/register_bloc.dart';
import 'package:shop_app/Presentation/Controller/LoginBloc/login_bloc.dart';


final sl = GetIt.instance;
class ServiceLocator{
  void init(){
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());


    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<BaseRegisterRepo>(() => RegisterRepository(sl()));
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(() => RegisterRemoteDataSource());

    sl.registerFactory(() => HomeBloc(sl()));
    sl.registerLazySingleton(() => ProductUseCase(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => ProductRepository(sl()));
    sl.registerLazySingleton<BaseProductsRemoteDataSource>(() => ProductsRemoteDataSource());
    sl.registerFactory(() => BannerBloc(sl()));
    sl.registerLazySingleton(() => BannerUseCase(sl()));
    sl.registerLazySingleton<BaseBannerHome>(() => BannerRepository(sl()));
    sl.registerLazySingleton<BaseBannerRemoteDataSource>(() => BannerRemoteDataSource());

  }
}

