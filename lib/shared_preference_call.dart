import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceInit{
  static late SharedPreferences prefs;

  static Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}