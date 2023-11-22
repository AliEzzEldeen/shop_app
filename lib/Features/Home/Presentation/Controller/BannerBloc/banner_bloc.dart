import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/Core/UseCase/base_use_case.dart';
import 'package:shop_app/Core/enum.dart';
import 'package:shop_app/Features/Home/Domain/Entities/banner.dart';
import 'package:shop_app/Features/Home/Domain/UseCase/banner_use_case.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc(this.bannerUseCase) : super(const BannerState()) {
    on<BannerEvent>(bannerEvent);
  }

  final BannerUseCase bannerUseCase;


  FutureOr<void> bannerEvent(BannerEvent event, Emitter<BannerState> emit)async {
    final result = await bannerUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
          bannerState: RequestState.error, bannerMessage: l.message)),
          (r) => emit(
        state.copyWith(banner: r, bannerState: RequestState.isLoaded),
      ),
    );

  }
}
