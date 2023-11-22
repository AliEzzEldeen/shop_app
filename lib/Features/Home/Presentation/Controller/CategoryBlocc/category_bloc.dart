import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/enum.dart';
import 'package:shop_app/Features/Home/Domain/Entities/category.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/get_category_product_use_case.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/get_category_use_case.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.getCategoryUseCase, this.getCategoryProductUseCase) : super( const CategoryState()) {
    on<GetCategoryEvent>(getCategoryEvent);
    on<GetCategoryProductEvent>(getCategoryProductsEvent);
  }

  final GetCategoryUseCase getCategoryUseCase;
  final GetCategoryProductUseCase getCategoryProductUseCase;

  FutureOr<void> getCategoryEvent(
      GetCategoryEvent event, Emitter<CategoryState> emit) async {
    final result = await getCategoryUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            categoriesState: RequestState.error, categoriesMessage: l.message)),
        (r) => emit(state.copyWith(
            categories: r, categoriesState: RequestState.isLoaded)));
  }



  FutureOr<void> getCategoryProductsEvent(GetCategoryProductEvent event, Emitter<CategoryState> emit) async{
    final result = await getCategoryProductUseCase(CategoryId(id: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            productCategoriesState: RequestState.error, productCategoriesMessage: l.message)),
            (r) => emit(state.copyWith(
            productsCategories: r, productCategoriesState: RequestState.isLoaded)));
  }
}
