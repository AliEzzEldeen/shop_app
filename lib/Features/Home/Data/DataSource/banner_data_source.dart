
import 'package:dio/dio.dart';
import 'package:shop_app/Core/Network/Api/end_point.dart';
import 'package:shop_app/Core/Network/error_message_network.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Features/Home/Data/Models/banner_model.dart';

abstract class BaseBannerRemoteDataSource{
  Future<List<BannerModel>>getBanner();
}

class BannerRemoteDataSource extends BaseBannerRemoteDataSource{
  @override
  Future<List<BannerModel>> getBanner() async {
    final response = await Dio().get(EndPoints.getBanner);
    print(response);
    if (response.statusCode == 200 ){
      print(response);
      return List<BannerModel>.from((response.data['data']as List
      ).map((e) => BannerModel.fromJson(e)));
    } else{
      throw ServerException(errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }
}