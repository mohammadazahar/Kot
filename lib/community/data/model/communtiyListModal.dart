// To parse this JSON data, do
//
//     final communityList = communityListFromJson(jsonString);

import 'dart:convert';

CommunityList communityListFromJson(String str) =>
    CommunityList.fromJson(json.decode(str));

String communityListToJson(CommunityList data) => json.encode(data.toJson());

class CommunityList {
  List<communtiList1>? data;
  String? message;
  int? total;

  CommunityList({
    this.data,
    this.message,
    this.total,
  });

  factory CommunityList.fromJson(Map<String, dynamic> json) => CommunityList(
        data: List<communtiList1>.from(
            json["data"].map((x) => communtiList1.fromJson(x))),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "total": total,
      };
}

class communtiList1 {
  List<String>? follow;
  String? id;
  String? name;
  String? coverPhoto;
  DatumDescription? description;
  Location? location;
  List<Person>? people;
  bool? privacy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<Topic>? topic;

  communtiList1({
    this.follow,
    this.id,
    this.name,
    this.coverPhoto,
    this.description,
    this.location,
    this.people,
    this.privacy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.topic,
  });

  factory communtiList1.fromJson(Map<String, dynamic> json) => communtiList1(
        follow: List<String>.from(json["follow"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        coverPhoto: json["coverPhoto"],
        description: datumDescriptionValues.map[json["description"]],
        location: Location.fromJson(json["location"]),
        people:
            List<Person>.from(json["people"].map((x) => Person.fromJson(x))),
        privacy: json["privacy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        topic: List<Topic>.from(json["topic"].map((x) => Topic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "follow": List<dynamic>.from(follow!.map((x) => x)),
        "_id": id,
        "name": name,
        "coverPhoto": coverPhoto,
        "description": datumDescriptionValues.reverse[description],
        "location": location!.toJson(),
        "people": List<dynamic>.from(people!.map((x) => x.toJson())),
        "privacy": privacy,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "topic": List<dynamic>.from(topic!.map((x) => x.toJson())),
      };
}

enum DatumDescription {
  HELLO,
  TES11,
  THIS_IS_A_COMMUNITY_FOR_PEOPLE_WHO_ARE_INTERESTED_IN_CODING
}

final datumDescriptionValues = EnumValues({
  "hello": DatumDescription.HELLO,
  "tes11": DatumDescription.TES11,
  "This is a community for people who are interested in coding.":
      DatumDescription
          .THIS_IS_A_COMMUNITY_FOR_PEOPLE_WHO_ARE_INTERESTED_IN_CODING
});

class Location {
  double? lat;
  double? lng;
  Address? address;

  Location({
    this.lat,
    this.lng,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        address: addressValues.map[json["address"]],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
        "address": addressValues.reverse[address],
      };
}

enum Address { THE_10_BALAKRISHNAN_STREET }

final addressValues =
    EnumValues({"10, balakrishnan street": Address.THE_10_BALAKRISHNAN_STREET});

class Person {
  List<dynamic>? interests;
  PersonId? id;
  String? phone;
  String? countryCode;
  String? email;
  int? status;
  UserDetail? userDetail;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? otp;

  Person({
    this.interests,
    this.id,
    this.phone,
    this.countryCode,
    this.email,
    this.status,
    this.userDetail,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.otp,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        interests: List<dynamic>.from(json["interests"].map((x) => x)),
        id: personIdValues.map[json["_id"]],
        phone: json["phone"],
        countryCode: json["countryCode"],
        email: json["email"],
        status: json["status"],
        userDetail: userDetailValues.map[json["userDetail"]],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "interests": List<dynamic>.from(interests!.map((x) => x)),
        "_id": personIdValues.reverse[id],
        "phone": phone,
        "countryCode": countryCode,
        "email": email,
        "status": status,
        "userDetail": userDetailValues.reverse[userDetail],
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "otp": otp,
      };
}

enum PersonId {
  THE_64_C7_A8587_E49_BA400606_A9_B7,
  THE_64_CE0_BADFBEDF71_FBA5_B7410
}

final personIdValues = EnumValues({
  "64c7a8587e49ba400606a9b7": PersonId.THE_64_C7_A8587_E49_BA400606_A9_B7,
  "64ce0badfbedf71fba5b7410": PersonId.THE_64_CE0_BADFBEDF71_FBA5_B7410
});

enum UserDetail {
  THE_64_C7_A8587_E49_BA400606_A9_B8,
  THE_64_CE0_BADFBEDF71_FBA5_B7411
}

final userDetailValues = EnumValues({
  "64c7a8587e49ba400606a9b8": UserDetail.THE_64_C7_A8587_E49_BA400606_A9_B8,
  "64ce0badfbedf71fba5b7411": UserDetail.THE_64_CE0_BADFBEDF71_FBA5_B7411
});

class Topic {
  TopicId? id;
  NameEnum? name;
  NameEnum? description;
  Category? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Topic({
    this.id,
    this.name,
    this.description,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: topicIdValues.map[json["_id"]],
        name: nameEnumValues.map[json["name"]],
        description: nameEnumValues.map[json["description"]],
        category: categoryValues.map[json["category"]],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": topicIdValues.reverse[id],
        "name": nameEnumValues.reverse[name],
        "description": nameEnumValues.reverse[description],
        "category": categoryValues.reverse[category],
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

enum Category { THE_64_E0_CD6_DDC7816736865_A8_E9 }

final categoryValues = EnumValues(
    {"64e0cd6ddc7816736865a8e9": Category.THE_64_E0_CD6_DDC7816736865_A8_E9});

enum NameEnum { FRESH_WATER, SALT_WATER }

final nameEnumValues = EnumValues(
    {"Fresh Water": NameEnum.FRESH_WATER, "Salt Water": NameEnum.SALT_WATER});

enum TopicId {
  THE_64_E0_CDE6_F3_F4_C5_DAEC1_C7673,
  THE_64_E0_CF79_E892_B163_F8_D8_B823
}

final topicIdValues = EnumValues({
  "64e0cde6f3f4c5daec1c7673": TopicId.THE_64_E0_CDE6_F3_F4_C5_DAEC1_C7673,
  "64e0cf79e892b163f8d8b823": TopicId.THE_64_E0_CF79_E892_B163_F8_D8_B823
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
