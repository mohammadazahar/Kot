import 'package:dio/dio.dart';
import 'package:kot/post/res/const_vals.dart';

import '../model/profile_model.dart';

class ProfileRepository {
  Future<ProfileData?> callPostProfileApi({
    required String? id,
    required String? firstName,
    required String? lastName,
    required String? address,
    required String? zip,
    required String? city,
    required String? interests,
    required String? photo,
    required String? auto_play,
    required String? mobile_data,
    required String? wifi,
    required String? push,
    required String? mail,
    required String? sms,
    required String? community_notifications,
    required String? daily_briefing,
    required String? notify_nearby_hotspots,
    required String? notification_from_followers,
  }) async {
    try {
      final response =
          await Dio().patch('$baseUrl/dev/user/update-detail', data: {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "zip": zip,
        "city": city,
        "photo":   photo,
        // await MultipartFile.fromFile(
        //   photo!,
        // ),
        "interests": interests,
        "auto_play": auto_play,
        "mobile_data": mobile_data,
        "wifi": wifi,
        "push": push,
        "mail": mail,
        "sms": sms,
        "community_notifications": community_notifications,
        "daily_briefing": daily_briefing,
        "notify_nearby_hotspots": notify_nearby_hotspots,
        "notification_from_followers": notification_from_followers,

      });
          //     options: Options(
          //   headers: {
          //     'Content-Type': 'multipart/form-data'
          //   },
          // ));

      if (response.statusCode == 200) {
        ProfileApiResponseModel profileApiResponseModel =
            profileApiResponseModelFromJson(response.toString());
        return profileApiResponseModel.data;
      } else {
        return null;
      }
    } catch (e) {
      print("Profile API Error ${e.toString()}");
      if (e is DioError) {
        print(e.toString());
      }
      return null;
    }
  }
}

