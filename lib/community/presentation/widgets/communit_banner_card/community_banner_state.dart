part of 'community_banner.dart';

abstract class CommunityCardBannerState {}

class CommunityCardBannerInitial extends CommunityCardBannerState {}

class CommunityCardBannerNext extends CommunityCardBannerState {
  CommunityCardBannerNext(
    this.bannerIndex,
  ) : super();
  int bannerIndex = 0;
}
