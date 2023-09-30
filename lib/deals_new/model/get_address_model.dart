// To parse this JSON data, do
//
//     final getAddress = getAddressFromJson(jsonString);

import 'dart:convert';

GetAddress getAddressFromJson(String str) =>
    GetAddress.fromJson(json.decode(str));

String getAddressToJson(GetAddress data) => json.encode(data.toJson());

class GetAddress {
  List<DatumAddress> data;
  String message;
  int total;

  GetAddress({
    required this.data,
    required this.message,
    required this.total,
  });

  factory GetAddress.fromJson(Map<String, dynamic> json) => GetAddress(
        data: List<DatumAddress>.from(
            json["data"].map((x) => DatumAddress.fromJson(x))),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "total": total,
      };
}

class DatumAddress {
  String id;
  String user;
  String fullName;
  String streetAddress;
  String city;
  String state;
  String postalCode;
  String country;
  int v;

  DatumAddress({
    required this.id,
    required this.user,
    required this.fullName,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.v,
  });

  factory DatumAddress.fromJson(Map<String, dynamic> json) => DatumAddress(
        id: json["_id"],
        user: json["user"],
        fullName: json["fullName"],
        streetAddress: json["streetAddress"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        country: json["country"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "fullName": fullName,
        "streetAddress": streetAddress,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
        "__v": v,
      };
}
