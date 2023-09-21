// To parse this JSON data, do
//
//     final interestApiResponseModel = interestApiResponseModelFromJson(jsonString);

import 'dart:convert';

InterestApiResponseModel interestApiResponseModelFromJson(String str) => InterestApiResponseModel.fromJson(json.decode(str));

String interestApiResponseModelToJson(InterestApiResponseModel data) => json.encode(data.toJson());

class InterestApiResponseModel {
  List<InterestDatum>? data;
  String? message;
  int? total;

  InterestApiResponseModel({
    this.data,
    this.message,
    this.total,
  });

  factory InterestApiResponseModel.fromJson(Map<String, dynamic> json) => InterestApiResponseModel(
    data: json["data"] == null ? [] : List<InterestDatum>.from(json["data"]!.map((x) => InterestDatum.fromJson(x))),
    message: json["message"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "total": total,
  };
}

class InterestDatum {
  String? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  InterestDatum({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory InterestDatum.fromJson(Map<String, dynamic> json) => InterestDatum(
    id: json["_id"],
    name: json["name"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
