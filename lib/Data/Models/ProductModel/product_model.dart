import 'package:shop_app/Domain/entities/HomeProduct/product.dart';

// ignore: must_be_immutable
class ProductModel extends ProductsData {
  ProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.inFavorites,
    required super.inCart,
  });



  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['oldPrice'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
        inFavorites: json['inFavorites'],
        inCart: json['inCart'],
      );
}
