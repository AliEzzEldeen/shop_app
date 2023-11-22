part of 'banner_bloc.dart';

class BannerState extends Equatable {
  const BannerState({
    this.banner = const [],
    this.bannerState = RequestState.isLoading,
    this.bannerMessage = '',
  });

  final List<BannerEntities> banner;
  final RequestState bannerState;
  final String bannerMessage;

  BannerState copyWith(
      {List<BannerEntities>? banner,
      RequestState? bannerState,
      String? bannerMessage}) {
    return BannerState(
      banner: banner ?? this.banner,
      bannerState: bannerState ?? this.bannerState,
      bannerMessage: bannerMessage ?? this.bannerMessage,
    );
  }

  @override
  List<Object> get props => [
        banner,
        bannerState,
        bannerMessage,
      ];
}
