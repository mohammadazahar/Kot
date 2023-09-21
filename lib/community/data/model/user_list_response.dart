class UserListResponse {
  List<UserListData>? data;
  String? message;

  UserListResponse({this.data, this.message});

  UserListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserListData>[];
      json['data'].forEach((v) {
        data!.add(UserListData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class UserListData {
  String? sId;
  String? phone;
  String? countryCode;
  int? status;
  UserDetail? userDetail;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otp;
  List<String>? interests;
  String? email;

  UserListData(
      {this.sId,
      this.phone,
      this.countryCode,
      this.status,
      this.userDetail,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.otp,
      this.interests,
      this.email});

  UserListData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    countryCode = json['countryCode'];
    status = json['status'];
    userDetail = json['userDetail'] != null ? UserDetail.fromJson(json['userDetail']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
    interests = json['interests'].cast<String>();
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['countryCode'] = countryCode;
    data['status'] = status;
    if (userDetail != null) {
      data['userDetail'] = userDetail!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['otp'] = otp;
    data['interests'] = interests;
    data['email'] = email;
    return data;
  }
}

class UserDetail {
  bool? autoPlay;
  bool? mobileData;
  bool? wifi;
  bool? push;
  bool? mail;
  bool? sms;
  bool? communityNotifications;
  bool? dailyBriefing;
  bool? notifyNearbyHotspots;
  bool? notificationFromFollowers;
  String? sId;
  int? status;
  String? user;
  String? firstName;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? lastName;
  String? address;
  String? zip;
  String? city;
  String? photo;

  UserDetail(
      {this.autoPlay,
      this.mobileData,
      this.wifi,
      this.push,
      this.mail,
      this.sms,
      this.communityNotifications,
      this.dailyBriefing,
      this.notifyNearbyHotspots,
      this.notificationFromFollowers,
      this.sId,
      this.status,
      this.user,
      this.firstName,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.lastName,
      this.address,
      this.zip,
      this.city,
      this.photo});

  UserDetail.fromJson(Map<String, dynamic> json) {
    autoPlay = json['auto_play'];
    mobileData = json['mobile_data'];
    wifi = json['wifi'];
    push = json['push'];
    mail = json['mail'];
    sms = json['sms'];
    communityNotifications = json['community_notifications'];
    dailyBriefing = json['daily_briefing'];
    notifyNearbyHotspots = json['notify_nearby_hotspots'];
    notificationFromFollowers = json['notification_from_followers'];
    sId = json['_id'];
    status = json['status'];
    user = json['user'];
    firstName = json['firstName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    lastName = json['lastName'];
    address = json['address'];
    zip = json['zip'];
    city = json['city'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auto_play'] = autoPlay;
    data['mobile_data'] = mobileData;
    data['wifi'] = wifi;
    data['push'] = push;
    data['mail'] = mail;
    data['sms'] = sms;
    data['community_notifications'] = communityNotifications;
    data['daily_briefing'] = dailyBriefing;
    data['notify_nearby_hotspots'] = notifyNearbyHotspots;
    data['notification_from_followers'] = notificationFromFollowers;
    data['_id'] = sId;
    data['status'] = status;
    data['user'] = user;
    data['firstName'] = firstName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['lastName'] = lastName;
    data['address'] = address;
    data['zip'] = zip;
    data['city'] = city;
    data['photo'] = photo;
    return data;
  }
}
