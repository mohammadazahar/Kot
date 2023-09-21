import 'package:kot/constants_values.dart';
import 'package:kot/core/util/shared_preference_call.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  /// ------------------------------------------------------------
  /// Method that returns the bearer token , null if not set
  /// ------------------------------------------------------------
  static String getBearerToken() {
    String bearerToken;
    final SharedPreferences prefs = SharedPreferenceInit.prefs;
    bearerToken = (prefs.getString(ConstantsValues.bearerToken) ?? null)!;
    return bearerToken;
  }

  // //Logout Call
  // static Future<bool> logoutData() async {
  //   setCity('');
  //   setMobile('');
  //   setReferCode('');
  //   setName('');
  //   setUserId('');
  //   setExecutiveId('');
  //   setIsLogin(false);
  //   setIsFirstTime(false);
  //   setPinCode("");
  //   setUserCity("");
  //   setDeliverPartner(false);
  //   await deleteAllData();
  //   await deleteAllMeasurementType();
  //   await deleteAllFarmers();
  //   await deleteAllCrops();
  //   await deleteAllMyTradePartner();
  //   await deleteReferral();
  //   await deleteKWSearch();
  //   return Future.value(true);
  // }
  /// ----------------------------------------------------------
  /// Method that saves the bearer token
  /// ----------------------------------------------------------

  /// ------------------------------------------------------------
  /// Method that returns the user login or not , null if not set
  /// ------------------------------------------------------------
  // static bool? isLogin() {
  //   bool? isLogin;
  //   final SharedPreferences prefs = SharedPreferenceInit.prefs;
  //   isLogin = prefs.getBool(ConstantsValues.isLogin) ?? null;
  //   return isLogin;
  // }
  //
  // /// ----------------------------------------------------------
  // /// Method that saves the user login
  // /// ----------------------------------------------------------
  // static setIsLogin(bool isLogin) {
  //   final SharedPreferences prefs = SharedPreferenceInit.prefs;
  //   return prefs.setBool(ConstantsValues.isLogin, isLogin);
  // }

  static Future<bool?> isLogin() async {
    bool? isLogin;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool(ConstantsValues.isLogin) ?? null;
    return isLogin;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user login
  /// ----------------------------------------------------------
  static Future<bool> setIsLogin(bool isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(ConstantsValues.isLogin, isLogin);
  }

  static String getNotificationToken() {
    String notificationToken;
    final SharedPreferences prefs = SharedPreferenceInit.prefs;
    notificationToken =
        prefs.getString(ConstantsValues.notificationToken) ?? "";
    return notificationToken;
  }

  /// ------------------------------------------------------------
  /// Method that returns the user name , null if not set
  /// ------------------------------------------------------------
  static String? getName() {
    String? name;
    final SharedPreferences prefs = SharedPreferenceInit.prefs;
    name = prefs.getString(ConstantsValues.name) ?? null;
    return name;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user name
  /// ----------------------------------------------------------
  static setName(String name) {
    final SharedPreferences prefs = SharedPreferenceInit.prefs;
    prefs.setString(ConstantsValues.name, name);
  }

  /// ------------------------------------------------------------
  /// Method that returns the user mobile , null if not set
  /// ------------------------------------------------------------
  static String? getMobile() {
    String? mobile;
    final SharedPreferences prefs = SharedPreferenceInit.prefs;
    mobile = prefs.getString(ConstantsValues.mobile) ?? null;
    return mobile;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user mobile
  /// ----------------------------------------------------------
  static Future<bool> setMobile(String mobile) {
    final SharedPreferences prefs = SharedPreferenceInit.prefs;
    return prefs.setString(ConstantsValues.mobile, mobile);
  }

  ///Pin
  static String? getPin() {
    String? pin;
    final SharedPreferences prefs = SharedPreferenceInit.prefs;
    pin = prefs.getString(ConstantsValues.pin) ?? null;
    return pin;
  }

  static Future<bool> setPin(String pin) {
    final SharedPreferences prefs = SharedPreferenceInit.prefs;
    return prefs.setString(ConstantsValues.pin, pin);
  }
}
