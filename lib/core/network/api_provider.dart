import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kot/authtentication/data/model/verify_otp.dart';
import 'package:kot/authtentication/data/model/verify_phone.dart';
import 'package:kot/boat_booking/data/model/boat_detail_by_id.dart';
import 'package:kot/boat_booking/data/model/boat_listing.dart';
import 'package:kot/boat_booking/data/model/boat_search_response.dart';
import 'package:kot/boat_booking/data/model/boat_type.dart';
import 'package:kot/boat_booking/data/model/book_boat_by_date_range.dart';
import 'package:kot/boat_booking/data/model/my_booking_response.dart';
import 'package:kot/community/data/model/community_model.dart';
import 'package:kot/community/data/model/community_topic_response.dart';
import 'package:kot/community/data/model/communtiyListModal.dart';
import 'package:kot/community/data/model/create_group.dart';
import 'package:kot/community/data/model/recommented_group.dart';
import 'package:kot/community/data/model/user_list_response.dart';
import 'package:kot/constants_values.dart';
import 'package:kot/core/network/interceptor.dart';
import 'package:kot/core/util/shared_preference_call.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  late Dio dio;
  String? mobile;

  Future initDio({hasAuth = true}) async {
    SharedPreferences prefer = SharedPreferenceInit.prefs;
    mobile = prefer.getString(ConstantsValues.mobile);
    Map<String, String?> header = {
      'accept': 'application/json',
      'content-type': 'application/json',
    };
    BaseOptions options = BaseOptions(receiveTimeout: 170000, connectTimeout: 170000, headers: header);
    dio = Dio(options);
  }

  //verify mobile otp
  Future verifyMobile(String? mobile) async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.post("https://kot-api.onrender.com/dev/auth/phone-login");
      return PhoneLogin.fromJson(response.data);
    } catch (error) {
      print("Exception occured: $error");
      return PhoneLogin.withError(error.toString());
    }
  }

  Future<PhoneLogin> sendEmailOtp(String? email) async {
    await initDio();
    var data = {
      "phone": email,
    };
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.post("https://kot-api.onrender.com/dev/auth/email-login", data: data);
      return PhoneLogin.fromJson(response.data);
    } catch (error) {
      print("Exception occured: $error");
      return PhoneLogin.withError(error.toString());
    }
  }

  Future<PhoneLogin> sendOtp({required String? mobile, required String? countryCode, String? type}) async {
    await initDio();
    try {
      var data = {
        "phone": mobile,
        "countryCode": countryCode,
      };
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.post("https://kot-api.onrender.com/dev/auth/phone-login", data: data);
      print(response.data);
      return PhoneLogin.fromJson(response.data);
    } catch (error) {
      print("Exception occured: $error");
      return PhoneLogin.withError(error.toString());
    }
  }

  Future<PhoneLogin> resendOtp({required String? mobile, required String? countryCode, String? type}) async {
    await initDio();
    try {
      var data = {
        "phone": mobile,
        "countryCode": countryCode,
      };
      dio.interceptors.add(LoggingInterceptor());
      Response response =
          await dio.post("https://kot-api.onrender.com/dev/auth/resend-phone-otp", data: data);
      print(response.data);
      return PhoneLogin.fromJson(response.data);
    } catch (error) {
      print("Exception occured: $error");
      return PhoneLogin.withError(error.toString());
    }
  }

  Future<PhoneLogin> resendEmailOtp({required String? mobile, String? type}) async {
    await initDio();
    try {
      var data = {
        "email": mobile,
      };
      dio.interceptors.add(LoggingInterceptor());
      Response response =
          await dio.post("https://kot-api.onrender.com/dev/auth/resend-email-otp", data: data);
      print(response.data);
      return PhoneLogin.fromJson(response.data);
    } catch (error) {
      print("Exception occured: $error");
      return PhoneLogin.withError(error.toString());
    }
  }

  Future<VerifyPhoneOtp> verifyOtp(
      {required String? mobile, required String? otp, required countryCode, String? type}) async {
    await initDio();
    try {
      var data = {"phone": mobile, "countryCode": countryCode, "otp": otp};
      dio.interceptors.add(LoggingInterceptor());
      Response response =
          await dio.post("https://kot-api.onrender.com/dev/auth/verify-phone-otp", data: data);
      return VerifyPhoneOtp.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<List<BoatTypeList>> getBoatType() async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/app/list-boat-type",
      );
      print("resone149${response.data}");
      if (response.data != null) {
        //return BoatTypeModel.fromJson(response.data[0]);
        final jobs = (response.data['data'] as List<dynamic>).map((e) => BoatTypeList.fromJson(e)).toList();
        return jobs;
      } else {
        throw Exception("API response data is null or invalid.");
      }
    } catch (error) {
      print(error.toString());
      throw Exception(error);
    }
  }

  Future<BoatListing> getBoatList() async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/app/list-boat",
      );
      return boatListingFromJson(jsonEncode(response.data));
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<BoatTypeByIdResponse> getBoatDetailById(String id) async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/app/list-boat-by-type?boatType=64a7eb2c2baa6aecfab0f8e7",
      );
      return boatDetailFromJson(jsonEncode(response.data));
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<BookBoatByDateRangeResponse> bookBoatWithDateRange(
      {required String user, required String boat, required String from, required String to}) async {
    await initDio();
    try {
      var data = {"user": user, "boat": boat, "from": from, "to": to};
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.post("https://kot-api.onrender.com/dev/app/book-boat", data: data);
      return BookBoatByDateRangeResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<MyBookingResponse> getBoatBookingById(String id) async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/app/list-my-booking?user=64a2f9dbf060197eb17432d1",
      );
      return MyBookingResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Addcommunity> createCommunity(
      {String? name,
      required String coverPhoto,
      Map<dynamic, dynamic>? location,
      List<String>? topic,
      required bool privacy,
      List<String>? people,
      required String description}) async {
    await initDio();
    try {
      var data = {
        "name": name,
        "coverPhoto": 'https://www.tessllc.us/wp-content/uploads/2020/07/yacht-post-825x510.jpg',
        "description": description,
        "location": location,
        "topic": topic,
        "privacy": privacy,
        "people": people
      };
      debugPrint("request   ===> $data");
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.post("https://kot-api.onrender.com/dev/community", data: data);
      return Addcommunity.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<CommunityList> getCommunityList() async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/community/getAllCommunities",
      );
      log("line281........${response.data}");
      return CommunityList.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<CommunityFeedResponse> feedList() async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/community/communityFeed?community=64e06f940df504b23c787a90&currentUser=64a06251ba1b942c8aeeba9e",
      );
      log('feed List api response ${response.data}');
      return CommunityFeedResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<RecommendedGroupResponse> groupList() async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/community/getAllRecommendedCommunities?user=64a06251ba1b942c8aeeba9d",
      );
      log('group List api response ${response.data}');
      return RecommendedGroupResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<UserListResponse> userList() async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/admin/get-user",
      );
      log('user List api response ${response.data}');
      return UserListResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<CommunityTopicsResponse> communityTopicList() async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(
        "https://kot-api.onrender.com/dev/admin/get-user",
      );
      log('user List api response ${response.data}');
      return CommunityTopicsResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<BoatSearchResponse> getSearchDataList(String url) async {
    await initDio();
    try {
      dio.interceptors.add(LoggingInterceptor());
      Response response = await dio.get(url);
      log("getSearchDataList ........${response.data}");
      return BoatSearchResponse.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

}
