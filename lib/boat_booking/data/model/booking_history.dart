// To parse this JSON data, do
//
//     final bookingHostory = bookingHostoryFromJson(jsonString);

import 'dart:convert';

BookingHostory bookingHostoryFromJson(String str) =>
    BookingHostory.fromJson(json.decode(str));

String bookingHostoryToJson(BookingHostory data) => json.encode(data.toJson());

class BookingHostory {
  List<Datum>? data;
  String? message;
  int? total;

  BookingHostory({
    this.data,
    this.message,
    this.total,
  });

  factory BookingHostory.fromJson(Map<String, dynamic> json) => BookingHostory(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "total": total,
      };
}

class Datum {
  String? id;
  User? user;
  String? boat;
  DateTime? from;
  DateTime? to;
  int? bookingStatus;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.user,
    this.boat,
    this.from,
    this.to,
    this.bookingStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        boat: json["boat"],
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        bookingStatus: json["bookingStatus"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user!.toJson(),
        "boat": boat,
        "from": from!.toIso8601String(),
        "to": to!.toIso8601String(),
        "bookingStatus": bookingStatus,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class User {
  String? id;
  int? status;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.id,
    this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        status: json["status"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "user": user,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
