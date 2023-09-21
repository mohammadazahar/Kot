// To parse this JSON data, do
//
//     final phoneLogin = phoneLoginFromJson(jsonString);

import 'dart:convert';

PhoneLogin phoneLoginFromJson(String str) =>
    PhoneLogin.fromJson(json.decode(str));

String phoneLoginToJson(PhoneLogin data) => json.encode(data.toJson());

class PhoneLogin {
  dynamic data;
  String? message;
  String? error;
  int? total;

  PhoneLogin({
    this.data,
    this.message,
    this.total,
    this.error,
  });

  factory PhoneLogin.fromJson(Map<String, dynamic> json) => PhoneLogin(
        data: json["data"],
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "total": total,
      };
  PhoneLogin.withError(String errorValue) : error = errorValue;
}
