// To parse this JSON data, do
//
//     final verifyPhoneOtp = verifyPhoneOtpFromJson(jsonString);

import 'dart:convert';

VerifyPhoneOtp verifyPhoneOtpFromJson(String str) =>
    VerifyPhoneOtp.fromJson(json.decode(str));

String verifyPhoneOtpToJson(VerifyPhoneOtp data) => json.encode(data.toJson());

class VerifyPhoneOtp {
  Data? data;
  String? message;
  String? error;
  String? status;
  int? total;

  VerifyPhoneOtp({
    this.data,
    this.message,
    this.total,
    this.error,
    this.status,
  });

  factory VerifyPhoneOtp.fromJson(Map<String, dynamic> json) => VerifyPhoneOtp(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        total: json["total"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "total": total,
        "status": status,
      };
  VerifyPhoneOtp.withError(String errorValue) : error = errorValue;
}

class Data {
  String? id;
  String? phone;
  String? countryCode;
  String? email;
  int? status;
  String? userDetail;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? otp;

  Data({
    this.id,
    this.phone,
    this.countryCode,
    this.email,
    this.status,
    this.userDetail,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.otp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        phone: json["phone"],
        countryCode: json["countryCode"],
        email: json["email"],
        status: json["status"],
        userDetail: json["userDetail"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "countryCode": countryCode,
        "email": email,
        "status": status,
        "userDetail": userDetail,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "otp": otp,
      };
}
