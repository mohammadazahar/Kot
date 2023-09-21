class RecommendedGroupResponse {
  RecommendedGroupData? data;
  String? message;

  RecommendedGroupResponse({this.data, this.message});

  RecommendedGroupResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? RecommendedGroupData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class RecommendedGroupData {
  List<String>? interests;
  List<RecommendedCommunities>? recommendedCommunities;

  RecommendedGroupData({this.interests, this.recommendedCommunities});

  RecommendedGroupData.fromJson(Map<String, dynamic> json) {
    interests = json['interests'].cast<String>();
    if (json['recommendedCommunities'] != null) {
      recommendedCommunities = <RecommendedCommunities>[];
      json['recommendedCommunities'].forEach((v) {
        recommendedCommunities!.add(RecommendedCommunities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['interests'] = interests;
    if (recommendedCommunities != null) {
      data['recommendedCommunities'] = recommendedCommunities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecommendedCommunities {
  String? sId;
  String? name;
  String? coverPhoto;
  String? description;
  Location? location;
  bool? privacy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<People>? people;
  List<Topic>? topic;
  List<String>? follow;

  RecommendedCommunities(
      {this.sId,
      this.name,
      this.coverPhoto,
      this.description,
      this.location,
      this.privacy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.people,
      this.topic,
      this.follow});

  RecommendedCommunities.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    coverPhoto = json['coverPhoto'];
    description = json['description'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    privacy = json['privacy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['people'] != null) {
      people = <People>[];
      json['people'].forEach((v) {
        people!.add(People.fromJson(v));
      });
    }
    if (json['topic'] != null) {
      topic = <Topic>[];
      json['topic'].forEach((v) {
        topic!.add(Topic.fromJson(v));
      });
    }
    follow = json['follow'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['coverPhoto'] = coverPhoto;
    data['description'] = description;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['privacy'] = privacy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (people != null) {
      data['people'] = people!.map((v) => v.toJson()).toList();
    }
    if (topic != null) {
      data['topic'] = topic!.map((v) => v.toJson()).toList();
    }
    data['follow'] = follow;
    return data;
  }
}

class Location {
  double? lat;
  double? lng;
  String? address;

  Location({this.lat, this.lng, this.address});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    data['address'] = address;
    return data;
  }
}

class People {
  String? sId;
  String? phone;
  String? countryCode;
  String? email;
  int? status;
  String? userDetail;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? otp;

  People(
      {this.sId,
      this.phone,
      this.countryCode,
      this.email,
      this.status,
      this.userDetail,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.otp});

  People.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    countryCode = json['countryCode'];
    email = json['email'];
    status = json['status'];
    userDetail = json['userDetail'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['countryCode'] = countryCode;
    data['email'] = email;
    data['status'] = status;
    data['userDetail'] = userDetail;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['otp'] = otp;
    return data;
  }
}

class Topic {
  String? sId;
  String? name;
  String? description;
  String? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Topic({this.sId, this.name, this.description, this.category, this.createdAt, this.updatedAt, this.iV});

  Topic.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
