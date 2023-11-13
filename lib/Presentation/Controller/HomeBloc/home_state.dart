part of 'home_bloc.dart';

 class HomeState extends Equatable {
  const HomeState({
    this.product = const [],
    this.productState = RequestState.isLoading,
    this.productMessage = '',
  });

  final List<ProductsData> product;
  final RequestState productState;
  final String productMessage;

  HomeState copyWith({
    List<ProductsData>? product,
    RequestState? productState,
    String? productMessage,
  }) {
    return HomeState(
      product: product ?? this.product,
      productMessage: productMessage ?? this.productMessage,
      productState: productState ?? this.productState,
    );
  }

  @override
  List<Object> get props => [product, productState, productMessage];
}


