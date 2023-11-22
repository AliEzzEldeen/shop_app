import 'package:shop_app/Core/Network/Api/dio.dart';
import 'package:shop_app/Core/Network/Api/end_point.dart';
import 'package:shop_app/Core/Network/error_message_network.dart';
import 'package:shop_app/Core/error/exception.dart';
import 'package:shop_app/Features/Home/Data/Models/category_model.dart';
import 'package:shop_app/Features/Home/Data/Models/product_model.dart';
import 'package:shop_app/Features/Home/Domain/Entities/category.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/get_category_product_use_case.dart';

abstract class BaseCategoryRemoteDataSource {
  Future<List<Categories>> getCategories();
  Future <List<ProductsData>> getCategoryProducts(CategoryId parameters);
}

class CategoryRemoteDataSource extends BaseCategoryRemoteDataSource {
  @override
  Future<List<Categories>> getCategories() async {
    final response = await MyDio.get(endPoint: EndPoints.getCategories);
    if (response!.statusCode == 200) {
      print(response);
      return List<CategoryModel>.from((response.data['data']['data'] as List)
          .map((e) => CategoryModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }

  @override
  Future <List<ProductsData>> getCategoryProducts(CategoryId parameters) async {
    final response = await MyDio.get(endPoint: '${EndPoints.getCategoriesId}${parameters.id}');
    if (response!.statusCode == 200) {
      print(response);
      return List<ProductModel>.from((response.data['data']['data']as List
      ).map((e) => ProductModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }
}
