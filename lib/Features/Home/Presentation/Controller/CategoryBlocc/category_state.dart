part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const [],
    this.categoriesState = RequestState.isLoading,
    this.categoriesMessage = '',
    this.productsCategories = const[],
    this.productCategoriesState = RequestState.isLoading,
    this.productCategoriesMessage = '',
  });

  final List<Categories> categories;
  final RequestState categoriesState;
  final String categoriesMessage;
  final List<ProductsData>? productsCategories;
  final RequestState productCategoriesState;
  final String productCategoriesMessage;

  CategoryState copyWith({
    List<Categories>? categories,
    RequestState? categoriesState,
    String? categoriesMessage,
    List<ProductsData>? productsCategories,
    RequestState? productCategoriesState,
    String? productCategoriesMessage,

  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      categoriesState: categoriesState ?? this.categoriesState,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
      productsCategories: productsCategories ?? this.productsCategories,
      productCategoriesState: productCategoriesState ??
          this.productCategoriesState,
      productCategoriesMessage: productCategoriesMessage ??
          this.productCategoriesMessage,
    );
  }

  @override
  List<Object?> get props =>
      [
        categories,
        categoriesState,
        categoriesMessage,
        productsCategories,
        productCategoriesState,
        productCategoriesMessage,
      ];

}
