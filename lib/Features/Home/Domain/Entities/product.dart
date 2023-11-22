import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductsData extends Equatable {
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  ProductsData({required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,

    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart});

  @override
  List<Object> get props => [];
}
