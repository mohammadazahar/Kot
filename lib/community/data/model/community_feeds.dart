// To parse this JSON data, do
//
//     final communityFeed = communityFeedFromJson(jsonString);

import 'dart:convert';

CommunityFeeds communityFeedFromJson(String str) =>
    CommunityFeeds.fromJson(json.decode(str));

String communityFeedToJson(CommunityFeeds data) => json.encode(data.toJson());

class CommunityFeeds {
  List<FeedList>? data;
  String? message;
  int? total;

  CommunityFeeds({
    this.data,
    this.message,
    this.total,
  });

  factory CommunityFeeds.fromJson(Map<String, dynamic> json) => CommunityFeeds(
        data:
            List<FeedList>.from(json["data"].map((x) => FeedList.fromJson(x))),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "total": total,
      };
}

class FeedList {
  String? id;
  bool? isPost;
  Post? post;
  Community? community;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  dynamic? fishCatch;

  FeedList({
    this.id,
    this.isPost,
    this.post,
    this.community,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.fishCatch,
  });

  factory FeedList.fromJson(Map<String, dynamic> json) => FeedList(
        id: json["_id"],
        isPost: json["isPost"],
        post: Post.fromJson(json["post"]),
        community: Community.fromJson(json["community"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        fishCatch: json["fishCatch"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isPost": isPost,
        "post": post?.toJson(),
        "community": community?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "fishCatch": fishCatch,
      };
}

class Community {
  List<dynamic>? follow;
  Id? id;
  Name? name;
  String? coverPhoto;
  Description? description;
  Location? location;
  List<String>? people;
  bool? privacy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Community({
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
  });

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        follow: List<dynamic>.from(json["follow"].map((x) => x)),
        id: idValues.map[json["_id"]],
        name: nameValues.map[json["name"]],
        coverPhoto: json["coverPhoto"],
        description: descriptionValues.map[json["description"]],
        location: Location.fromJson(json["location"]),
        people: List<String>.from(json["people"].map((x) => x)),
        privacy: json["privacy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "follow": List<dynamic>.from(follow!.map((x) => x)),
        "_id": idValues.reverse[id],
        "name": nameValues.reverse[name],
        "coverPhoto": coverPhoto,
        "description": descriptionValues.reverse[description],
        "location": location?.toJson(),
        "people": List<dynamic>.from(people!.map((x) => x)),
        "privacy": privacy,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

enum Description { THIS_IS_A_COMMUNITY_FOR_PEOPLE_WHO_ARE_INTERESTED_IN_CODING }

final descriptionValues = EnumValues({
  "This is a community for people who are interested in coding.":
      Description.THIS_IS_A_COMMUNITY_FOR_PEOPLE_WHO_ARE_INTERESTED_IN_CODING
});

enum Id { THE_64_E06_F940_DF504_B23_C787_A90 }

final idValues = EnumValues(
    {"64e06f940df504b23c787a90": Id.THE_64_E06_F940_DF504_B23_C787_A90});

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

enum Name { MY_COMMUNITY }

final nameValues = EnumValues({"My Community": Name.MY_COMMUNITY});

class Post {
  String? id;
  String? user;
  String? message;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<String>? likes;
  bool? isCommunityPost;

  Post({
    this.id,
    this.user,
    this.message,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.likes,
    this.isCommunityPost,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        user: json["user"],
        message: json["message"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        likes: List<String>.from(json["likes"].map((x) => x)),
        isCommunityPost: json["isCommunityPost"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "message": message,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "isCommunityPost": isCommunityPost,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
