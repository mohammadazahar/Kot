import 'package:dio/dio.dart';
import 'package:kot/post/res/const_vals.dart';
import '../model/category_model.dart';

class CategoryRepository {

  Future<List<CategoryDatum>?> callGetCategoryApi(
  ) async {
    try {
      final response = await Dio().get(
        '$baseUrl/dev/deal/products-in-category-with-deals?categoryId=64dfa81d0a5eeb754010a880',
       // "dev/deal/products-in-category-with-deals?categoryId=${categoryId}"
      );
      if (response.statusCode == 200) {
        CategoryApiResponseModel categoryApiResponseModel =
        categoryApiResponseModelFromJson(response.toString());
        return categoryApiResponseModel.data;
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