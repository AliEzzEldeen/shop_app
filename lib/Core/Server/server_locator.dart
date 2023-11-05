
import 'package:get_it/get_it.dart';
import 'package:shop_app/Data/DataSource/login_data_source.dart';
import 'package:shop_app/Data/Repository/login_repository.dart';
import 'package:shop_app/Domain/Repository/base_login_repo.dart';
import 'package:shop_app/Domain/useCase/login_use_case.dart';
import 'package:shop_app/Presentation/Controller/login_bloc.dart';


final sl = GetIt.instance;
class ServiceLocator{
  void init(){
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());

  }
}

