import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kot/post/res/const_vals.dart';

import '../model/email_model.dart';

class AuthEmailRepository {
  // final Dio _dio;
  //
  // AuthEmailRepository(this._dio);

  Future<EmailModel> emailLogin({String? email}) async {
    try {
      final response = await Dio().post(
        "$baseUrl/dev/auth/email-login",
        data: {
          "email": email,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.toString());
        final EmailModel emailLoginResponse = EmailModel.fromJson(jsonResponse);
        return emailLoginResponse;
      } else {
        throw Exception("Failed to perform email login");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
