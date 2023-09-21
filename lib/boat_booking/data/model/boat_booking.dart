// To parse this JSON data, do
//
//     final boatBooking = boatBookingFromJson(jsonString);

import 'dart:convert';

BoatBooking boatBookingFromJson(String str) =>
    BoatBooking.fromJson(json.decode(str));

String boatBookingToJson(BoatBooking data) => json.encode(data.toJson());

class BoatBooking {
  Data? data;
  String? message;
  int? total;

  BoatBooking({
    this.data,
    this.message,
    this.total,
  });

  factory BoatBooking.fromJson(Map<String, dynamic> json) => BoatBooking(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "total": total,
      };
}

class Data {
  String? user;
  String? boat;
  DateTime? from;
  DateTime? to;
  int? bookingStatus;
  int? status;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.user,
    this.boat,
    this.from,
    this.to,
    this.bookingStatus,
    this.status,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"],
        boat: json["boat"],
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        bookingStatus: json["bookingStatus"],
        status: json["status"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "boat": boat,
        "from": from?.toIso8601String(),
        "to": to?.toIso8601String(),
        "bookingStatus": bookingStatus,
        "status": status,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
