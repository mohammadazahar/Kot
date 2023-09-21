part of 'community_banner.dart';

class CommunityCardBannerCubit extends Cubit<int> {
  CommunityCardBannerCubit() : super(0);

  void next() => emit(state + 1);

  void previous() => emit(state - 1);
}
