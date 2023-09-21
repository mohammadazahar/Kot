

abstract class ProfileEvent {}

class FetchProfileEvent extends ProfileEvent {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? zip;
  final String? city;
  final String? interests;
  final String? photo;
  final String? auto_play;
  final String? mobile_data;
  final String? wifi;
  final String? push;
  final String? mail;
  final String? sms;
  final String? community_notifications;
  final String? daily_briefing;
  final String? notify_nearby_hotspots;
  final String? notification_from_followers;


  FetchProfileEvent({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.zip,
    this.city,
    this.interests,
    this.photo,
    this.auto_play,
    this.mobile_data,
    this.wifi,
    this.push,
    this.mail,
    this.sms,
    this.community_notifications,
    this.daily_briefing,
    this.notify_nearby_hotspots,
    this.notification_from_followers,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
