// To parse this JSON data, do
//
//     final addcommunity = addcommunityFromJson(jsonString);

import 'dart:convert';

Addcommunity addcommunityFromJson(String str) =>
    Addcommunity.fromJson(json.decode(str));

String addcommunityToJson(Addcommunity data) => json.encode(data.toJson());

class Addcommunity {
  // Data? data;
  String? message;
  int? total;

  Addcommunity({
    // this.data,
    this.message,
    this.total,
  });

  factory Addcommunity.fromJson(Map<String, dynamic> json) => Addcommunity(
        // data: Data.fromJson(json["data"]),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        // "data": data!.toJson(),
        "message": message,
        "total": total,
      };
}

class Data {
  String? name;
  String? coverPhoto;
  String? description;
  Location? location;
  List<String>? topic;
  List<String>? people;
  bool? privacy;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.name,
    this.coverPhoto,
    this.description,
    this.location,
    this.topic,
    this.people,
    this.privacy,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        coverPhoto: json["coverPhoto"],
        description: json["description"],
        location: Location.fromJson(json["location"]),
        topic: List<String>.from(json["topic"].map((x) => x)),
        people: List<String>.from(json["people"].map((x) => x)),
        privacy: json["privacy"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "coverPhoto": coverPhoto,
        "description": description,
        "location": location!.toJson(),
        "topic": List<dynamic>.from(topic!.map((x) => x)),
        "people": List<dynamic>.from(people!.map((x) => x)),
        "privacy": privacy,
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class Location {
  double? lat;
  double? lng;
  String? address;

  Location({
    this.lat,
    this.lng,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
        "address": address,
      };
}
