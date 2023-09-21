// To parse this JSON data, do
//
//     final boatTypeModel = boatTypeModelFromJson(jsonString);

import 'dart:convert';

BoatTypeModel boatTypeModelFromJson(String str) =>
    BoatTypeModel.fromJson(json.decode(str));

String boatTypeModelToJson(BoatTypeModel data) => json.encode(data.toJson());

class BoatTypeModel {
  List<BoatTypeList>? boatTypeList;
  String? message;

  BoatTypeModel({
    this.boatTypeList,
    this.message,
  });

  factory BoatTypeModel.fromJson(Map<String, dynamic> json) => BoatTypeModel(
        boatTypeList: List<BoatTypeList>.from(
            json["BoatTypeList"].map((x) => BoatTypeList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "BoatTypeList":
            List<dynamic>.from(boatTypeList!.map((x) => x.toJson())),
        "message": message,
      };
}

class BoatTypeList {
  String? id;
  String? image;
  String? name;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  BoatTypeList({
    this.id,
    this.image,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BoatTypeList.fromJson(Map<String, dynamic> json) => BoatTypeList(
        id: json["_id"],
        image: json["image"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "name": name,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v ?? 0,
      };
}
