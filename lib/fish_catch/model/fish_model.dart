// To parse this JSON data, do
//
//     final addFishCatchApiResponseModel = addFishCatchApiResponseModelFromJson(jsonString);

import 'dart:convert';

AddFishCatchApiResponseModel addFishCatchApiResponseModelFromJson(String str) => AddFishCatchApiResponseModel.fromJson(json.decode(str));

String addFishCatchApiResponseModelToJson(AddFishCatchApiResponseModel data) => json.encode(data.toJson());

class AddFishCatchApiResponseModel {
  FishCatchData? data;
  String? message;
  int? total;

  AddFishCatchApiResponseModel({
    this.data,
    this.message,
    this.total,
  });

  factory AddFishCatchApiResponseModel.fromJson(Map<String, dynamic> json) => AddFishCatchApiResponseModel(
    data: json["data"] == null ? null : FishCatchData.fromJson(json["data"]),
    message: json["message"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "total": total,
  };
}

class FishCatchData {
  String? name;
  DateTime? dateOfCatch;
  String? timeOfCatch;
  String? weight;
  String? method;
  String? description;
  Position? position;
  List<String>? images;
  List<String>? videos;
  String? species;
  List<dynamic>? likes;
  String? createdBy;
  String? modifiedBy;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  FishCatchData({
    this.name,
    this.dateOfCatch,
    this.timeOfCatch,
    this.weight,
    this.method,
    this.description,
    this.position,
    this.images,
    this.videos,
    this.species,
    this.likes,
    this.createdBy,
    this.modifiedBy,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory FishCatchData.fromJson(Map<String, dynamic> json) => FishCatchData(
    name: json["name"],
    dateOfCatch: json["dateOfCatch"] == null ? null : DateTime.parse(json["dateOfCatch"]),
    timeOfCatch: json["timeOfCatch"],
    weight: json["weight"],
    method: json["method"],
    description: json["description"],
    position: json["position"] == null ? null : Position.fromJson(json["position"]),
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    videos: json["videos"] == null ? [] : List<String>.from(json["videos"]!.map((x) => x)),
    species: json["species"],
    likes: json["likes"] == null ? [] : List<dynamic>.from(json["likes"]!.map((x) => x)),
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dateOfCatch": "${dateOfCatch!.year.toString().padLeft(4, '0')}-${dateOfCatch!.month.toString().padLeft(2, '0')}-${dateOfCatch!.day.toString().padLeft(2, '0')}",
    "timeOfCatch": timeOfCatch,
    "weight": weight,
    "method": method,
    "description": description,
    "position": position?.toJson(),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
    "species": species,
    "likes": likes == null ? [] : List<dynamic>.from(likes!.map((x) => x)),
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Position {
  double? lat;
  double? lng;
  String? address;

  Position({
    this.lat,
    this.lng,
    this.address,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
    "address": address,
  };
}
