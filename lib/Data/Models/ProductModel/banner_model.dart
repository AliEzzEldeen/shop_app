import 'package:shop_app/Domain/entities/HomeProduct/banner.dart';

class BannerModel extends BannerEntities {
  BannerModel({
    required super.id,
    required super.image,

  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'],
        image: json['image'],
      );
}
