import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kot/deals_new/model/product_detail_model.dart';

class ProductApiService {
  final String baseUrl = "https://kot-api.onrender.com";

  Future<Products> fetchProductsByCategory(String categoryId) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/dev/productCategory/all-products-by-category?categoryId=$categoryId'),
    );

    if (response.statusCode == 200) {
      return Products.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products by category');
    }
  }
}
