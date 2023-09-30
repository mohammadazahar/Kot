import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kot/deals_new/model/select_category_model.dart';

class CategoryApiService {
  final String baseUrl =
      "https://kot-api.onrender.com"; // Replace with your API base URL

  // CategoryApiService({required this.baseUrl});

  Future<SelectCategory> fetchAllProductCategories() async {
    final response = await http
        .get(Uri.parse('$baseUrl/dev/productCategory/all-product-categories'));
    print('API Response: $response');

    if (response.statusCode == 200) {
      return SelectCategory.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product categories');
    }
  }
}
