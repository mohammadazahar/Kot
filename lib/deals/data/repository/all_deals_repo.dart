import 'package:dio/dio.dart';
import 'package:kot/deals/data/model/all_deal_model.dart';
import 'package:kot/post/res/const_vals.dart';
import '../model/category_model.dart';

class AllDealRepository {
  Future<List<AllDealDatumModel>?> callDealApi(
      ) async {
    try {
      final response = await Dio().get(
        '$baseUrl/dev/deal/all-deals',
      );
      if (response.statusCode == 200) {
        AllDealsApiModel allDealsApiModel =
        allDealsApiModelFromJson(response.toString());
        return allDealsApiModel.data;
      } else {
        return null;
      }
    } catch (e) {
      print("Category API Error ${e.toString()}");
      if (e is DioError) {
        print(e.toString());
      }
      return null;
    }
  }
}