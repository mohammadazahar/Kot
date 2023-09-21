// To parse this JSON data, do
//
//     final profileApiResponseModel = profileApiResponseModelFromJson(jsonString);

import 'dart:convert';

ProfileApiResponseModel profileApiResponseModelFromJson(String str) => ProfileApiResponseModel.fromJson(json.decode(str));

String profileApiResponseModelToJson(ProfileApiResponseModel data) => json.encode(data.toJson());

class ProfileApiResponseModel {
  ProfileData? data;
  String? message;
  int? total;

  ProfileApiResponseModel({
    this.data,
    this.message,
    this.total,
  });

  factory ProfileApiResponseModel.fromJson(Map<String, dynamic> json) => ProfileApiResponseModel(
    data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
    message: json["message"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "total": total,
  };
}

class ProfileData {
  String? id;
  String? firstName;
  String? lastName;
  String? address;
  String? zip;
  String? city;
  String? photo;
  int? status;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? autoPlay;
  bool? communityNotifications;
  bool? dailyBriefing;
  bool? mail;
  bool? mobileData;
  bool? notificationFromFollowers;
  bool? notifyNearbyHotspots;
  bool? push;
  bool? sms;
  bool? wifi;

  ProfileData({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.zip,
    this.city,
    this.photo,
    this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.autoPlay,
    this.communityNotifications,
    this.dailyBriefing,
    this.mail,
    this.mobileData,
    this.notificationFromFollowers,
    this.notifyNearbyHotspots,
    this.push,
    this.sms,
    this.wifi,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    address: json["address"],
    zip: json["zip"],
    city: json["city"],
    photo: json["photo"],
    status: json["status"],
    user: json["user"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    autoPlay: json["auto_play"],
    communityNotifications: json["community_notifications"],
    dailyBriefing: json["daily_briefing"],
    mail: json["mail"],
    mobileData: json["mobile_data"],
    notificationFromFollowers: json["notification_from_followers"],
    notifyNearbyHotspots: json["notify_nearby_hotspots"],
    push: json["push"],
    sms: json["sms"],
    wifi: json["wifi"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "address": address,
    "zip": zip,
    "city": city,
    "photo": photo,
    "status": status,
    "user": user,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "auto_play": autoPlay,
    "community_notifications": communityNotifications,
    "daily_briefing": dailyBriefing,
    "mail": mail,
    "mobile_data": mobileData,
    "notification_from_followers": notificationFromFollowers,
    "notify_nearby_hotspots": notifyNearbyHotspots,
    "push": push,
    "sms": sms,
    "wifi": wifi,
  };
}
