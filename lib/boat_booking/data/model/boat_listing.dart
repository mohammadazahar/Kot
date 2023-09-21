// To parse this JSON data, do
//
//     final boatListing = boatListingFromJson(jsonString);

import 'dart:convert';

BoatListing boatListingFromJson(String str) =>
    BoatListing.fromJson(json.decode(str));

String boatListingToJson(BoatListing data) => json.encode(data.toJson());

class BoatListing {
  List<BoatListingData>? data;
  String? message;
  int? total;

  BoatListing({
    this.data,
    this.message,
    this.total,
  });

  factory BoatListing.fromJson(Map<String, dynamic> json) => BoatListing(
        data: List<BoatListingData>.from(json["data"].map((x) => BoatListingData.fromJson(x))),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "total": total,
      };
}

class BoatListingData {
  String? id;
  String? name;
  List<String>? image;
  String? boatType;
  int? pricePerDay;
  int? length;
  int? cabins;
  int? capacity;
  int? birth;
  int? kitchen;
  int? bathroom;
  bool? shower;
  int? motorPower;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  BoatListingData({
    this.id,
    this.name,
    this.image,
    this.boatType,
    this.pricePerDay,
    this.length,
    this.cabins,
    this.capacity,
    this.birth,
    this.kitchen,
    this.bathroom,
    this.shower,
    this.motorPower,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BoatListingData.fromJson(Map<String, dynamic> json) => BoatListingData(
        id: json["_id"],
        name: json["name"],
        image: List<String>.from(json["image"].map((x) => x)),
        boatType: json["boatType"],
        pricePerDay: json["pricePerDay"],
        length: json["length"],
        cabins: json["cabins"],
        capacity: json["capacity"],
        birth: json["birth"],
        kitchen: json["kitchen"],
        bathroom: json["bathroom"],
        shower: json["shower"],
        motorPower: json["motorPower"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "boatType": boatType,
        "pricePerDay": pricePerDay,
        "length": length,
        "cabins": cabins,
        "capacity": capacity,
        "birth": birth,
        "kitchen": kitchen,
        "bathroom": bathroom,
        "shower": shower,
        "motorPower": motorPower,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
