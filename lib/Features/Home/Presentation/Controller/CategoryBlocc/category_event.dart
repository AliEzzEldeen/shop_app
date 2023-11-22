part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryEvent extends CategoryEvent {}

class GetCategoryProductEvent extends CategoryEvent {
  final String id;

  const GetCategoryProductEvent(this.id);

  @override
  List<Object> get props => [id];
}



