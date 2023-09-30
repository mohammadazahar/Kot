import 'dart:developer';
import 'package:flutter/foundation.dart';

class Utils {
  Utils._();

  //* For Logs
  static void showLogs(String data) {
    if (kDebugMode) {
      log(data);
    }
  }

  //* Throw New Exception
  static Never throwException([String? e]) {
    return throw CustomErrorException(
      title: "Server Error",
      message: e ?? "Error Loading Data",
    );
  }
}

class CustomErrorException {
  CustomErrorException({
    required this.title,
    required this.message,
  });

  String message;
  String title;
}

///Create Abstract class to return String message
abstract class MyApiException implements Exception {
  const MyApiException([this.message]);

  final String? message;

  @override
  String toString() {
    return message ?? "Error Loading Data";
  }
}
