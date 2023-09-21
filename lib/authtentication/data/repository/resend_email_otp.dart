import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../post/res/const_vals.dart';
import '../model/resend_email_model.dart';

class AuthResendEmailRepository {
  // final Dio _dio;
  //
  // AuthEmailRepository(this._dio);

  Future<ResendEmailModel> resendEmailLogin({String? email}) async {
    try {
      final response = await Dio().post(
        "$baseUrl/dev/auth/resend-email-otp",
        data: {
          "email": email,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.toString());
        final ResendEmailModel emailLoginResponse = ResendEmailModel.fromJson(jsonResponse);
        return emailLoginResponse;
      } else {
        throw Exception("Failed to perform resend email login");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}