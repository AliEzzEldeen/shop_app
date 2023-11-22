import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/enum.dart';
import 'package:shop_app/Features/Home/Domain/Entities/product.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/product_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.productUseCase) : super(const HomeState()) {
    on<ProductEvent>(productEvent);
  }
  final ProductUseCase productUseCase;



  FutureOr<void> productEvent(ProductEvent event, Emitter<HomeState> emit) async{
    final result = await productUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
          productState: RequestState.error, productMessage: l.message)),
          (r) => emit(
        state.copyWith(product: r, productState: RequestState.isLoaded),
      ),
    );
  }
}
