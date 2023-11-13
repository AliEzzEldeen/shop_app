import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BannerEntities extends Equatable {
  int? id;
  String? image;


  BannerEntities({
    required this.id,
    required this.image,

  });

  @override
  List<Object?> get props => [];
}
