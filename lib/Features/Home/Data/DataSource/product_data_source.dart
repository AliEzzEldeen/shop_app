import 'package:shop_app/Core/Network/Api/dio.dart';
import 'package:shop_app/Core/Network/Api/end_point.dart';
import 'package:shop_app/Core/Network/error_message_network.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Features/Home/Data/Models/product_model.dart';

abstract class BaseProductsRemoteDataSource{
  Future<List<ProductModel>> getProduct();
}

class ProductsRemoteDataSource extends BaseProductsRemoteDataSource{
  @override
  Future<List<ProductModel>> getProduct() async{
   final response = await MyDio.get(endPoint: EndPoints.getProducts);
   print(response);
   if (response!.statusCode == 200 ){
     print(response);
     return List<ProductModel>.from((response.data['data']['products']as List
     ).map((e) => ProductModel.fromJson(e)));
   } else{
     throw ServerException(errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
   }
  }
}
