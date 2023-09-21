// To parse this JSON data, do
//
//     final emailModel = emailModelFromJson(jsonString);

import 'dart:convert';

EmailModel emailModelFromJson(String str) => EmailModel.fromJson(json.decode(str));

String emailModelToJson(EmailModel data) => json.encode(data.toJson());

class EmailModel {
  dynamic data;
  String? message;
  int? total;

  EmailModel({
    this.data,
    this.message,
    this.total,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
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
