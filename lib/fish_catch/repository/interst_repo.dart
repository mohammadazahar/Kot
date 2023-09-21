

import 'package:dio/dio.dart';

import '../../post/res/const_vals.dart';
import '../model/interst_model.dart';

class InterestRepository {
  Future<List<InterestDatum>?> getCallAllInterestApi({
    required String? id,
    required String? name,
    required String? image,


  }) async {
    try {
      final response =
      await Dio().get('$baseUrl/dev/user/update-detail', queryParameters :{
        "_id":id,
        "name": name,
        "image": image
      });
      if (response.statusCode == 200) {
                InterestApiResponseModel interestApiResponseModel =
        interestApiResponseModelFromJson(response.toString());
        return interestApiResponseModel.data;
      } else {
        return null;
      }
    } catch (e) {
      print("Interest API Error ${e.toString()}");
      if (e is DioError) {
        print(e.toString());
      }
      return null;
    }
  }
}