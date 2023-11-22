import 'package:get_it/get_it.dart';
import 'package:shop_app/Features/Home/Data/DataSource/banner_data_source.dart';
import 'package:shop_app/Features/Home/Data/DataSource/category_data_source.dart';
import 'package:shop_app/Features/Home/Data/DataSource/product_data_source.dart';
import 'package:shop_app/Features/Home/Data/Repsitory/banner_repository.dart';
import 'package:shop_app/Features/Home/Data/Repsitory/category_repository.dart';
import 'package:shop_app/Features/Home/Data/Repsitory/product_repository.dart';
import 'package:shop_app/Features/Home/Domain/Repository/banner_home_repo.dart';
import 'package:shop_app/Features/Home/Domain/Repository/base_category_products.dart';
import 'package:shop_app/Features/Home/Domain/Repository/base_home_repo.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/banner_use_case.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/get_category_product_use_case.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/get_category_use_case.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/product_use_case.dart';
import 'package:shop_app/Features/Home/Presentation/Controller/BannerBloc/banner_bloc.dart';
import 'package:shop_app/Features/Home/Presentation/Controller/CategoryBlocc/category_bloc.dart';
import 'package:shop_app/Features/Home/Presentation/Controller/HomeBloc/home_bloc.dart';
import 'package:shop_app/Features/Login&Register/Data/DataSure/login_data_source.dart';
import 'package:shop_app/Features/Login&Register/Data/DataSure/register_data_source.dart';
import 'package:shop_app/Features/Login&Register/Data/Repository/login_repository.dart';
import 'package:shop_app/Features/Login&Register/Data/Repository/register_repository.dart';
import 'package:shop_app/Features/Login&Register/Domain/Repository/base_login_repo.dart';
import 'package:shop_app/Features/Login&Register/Domain/Repository/base_register_repo.dart';
import 'package:shop_app/Features/Login&Register/Domain/UseCase/login_use_case.dart';
import 'package:shop_app/Features/Login&Register/Domain/UseCase/register_use_case.dart';
import 'package:shop_app/Features/Login&Register/Presentation/LoginBloc/login_bloc.dart';
import 'package:shop_app/Features/Login&Register/Presentation/RegisterBloc/register_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource());

    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<BaseRegisterRepo>(() => RegisterRepository(sl()));
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
        () => RegisterRemoteDataSource());

    sl.registerFactory(() => HomeBloc(sl()));
    sl.registerLazySingleton(() => ProductUseCase(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => ProductRepository(sl()));
    sl.registerLazySingleton<BaseProductsRemoteDataSource>(
        () => ProductsRemoteDataSource());

    sl.registerFactory(() => BannerBloc(sl()));
    sl.registerLazySingleton(() => BannerUseCase(sl()));
    sl.registerLazySingleton<BaseBannerHome>(() => BannerRepository(sl()));
    sl.registerLazySingleton<BaseBannerRemoteDataSource>(
        () => BannerRemoteDataSource());

    sl.registerFactory(() => CategoryBloc(sl(),sl()));
    sl.registerLazySingleton(() => GetCategoryUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoryProductUseCase(sl()));
    sl.registerLazySingleton<BaseCategoryRepository>(() => CategoryRepository(sl()));
    sl.registerLazySingleton<BaseCategoryRemoteDataSource>(() => CategoryRemoteDataSource());
  }
}
