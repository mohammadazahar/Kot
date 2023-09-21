// To parse this JSON data, do
//
//     final postList = postListFromMap(jsonString);

import 'dart:convert';

PostList postListFromMap(String str) => PostList.fromMap(json.decode(str));

String postListToMap(PostList data) => json.encode(data.toMap());

class PostList {
  List<Datum>? data;
  String? message;
  int? total;

  PostList({
    this.data,
    this.message,
    this.total,
  });

  factory PostList.fromMap(Map<String, dynamic> json) => PostList(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "total": total,
      };
}

class Datum {
  String? id;
  User? user;
  String? message;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.user,
    this.message,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        message: json["message"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "user": user?.toMap(),
        "message": message,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class User {
  String? id;
  int? status;
  String? user;
  String? firstName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.id,
    this.status,
    this.user,
    this.firstName,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        status: json["status"],
        user: json["user"],
        firstName: json["firstName"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "status": status,
        "user": user,
        "firstName": firstName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
