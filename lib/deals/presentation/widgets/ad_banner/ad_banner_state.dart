part of 'ad_banner.dart';

abstract class AdBannerState {}

class AdBannerInitial extends AdBannerState {}

class AdBannerNext extends AdBannerState {
  AdBannerNext(
    this.bannerIndex,
  ) : super();
  int bannerIndex = 0;
}
