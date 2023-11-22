import 'package:shop_app/Features/Home/Domain/Entities/category.dart';

class CategoryModel extends Categories {
  CategoryModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}
