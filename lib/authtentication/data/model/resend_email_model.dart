// To parse this JSON data, do
//
//     final resendEmailModel = resendEmailModelFromJson(jsonString);

import 'dart:convert';

ResendEmailModel resendEmailModelFromJson(String str) => ResendEmailModel.fromJson(json.decode(str));

String resendEmailModelToJson(ResendEmailModel data) => json.encode(data.toJson());

class ResendEmailModel {
  dynamic data;
  String? message;
  int? total;

  ResendEmailModel({
    this.data,
    this.message,
    this.total,
  });

  factory ResendEmailModel.fromJson(Map<String, dynamic> json) => ResendEmailModel(
    data: json["data"],
    message: json["message"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "total": total,
  };
}
