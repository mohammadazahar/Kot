// To parse this JSON data, do
//
//     final resendPhoneOtp = resendPhoneOtpFromJson(jsonString);

import 'dart:convert';

ResendPhoneOtp resendPhoneOtpFromJson(String str) =>
    ResendPhoneOtp.fromJson(json.decode(str));

String resendPhoneOtpToJson(ResendPhoneOtp data) => json.encode(data.toJson());

class ResendPhoneOtp {
  dynamic data;
  String? message;
  String? status;
  int? total;

  ResendPhoneOtp({
    this.data,
    this.message,
    this.total,
    this.status,
  });

  factory ResendPhoneOtp.fromJson(Map<String, dynamic> json) => ResendPhoneOtp(
        data: json["data"],
        message: json["message"],
        total: json["total"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "total": total,
        "status": status,
      };
}
