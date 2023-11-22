import 'package:shop_app/Features/Home/Domain/Entities/banner.dart';

// ignore: must_be_immutable
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
