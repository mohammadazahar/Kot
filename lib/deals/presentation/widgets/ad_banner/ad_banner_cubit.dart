part of 'ad_banner.dart';

class AdBannerCubit extends Cubit<int> {
  AdBannerCubit() : super(0);

  void next() => emit(state + 1);

  void previous() => emit(state - 1);
}
