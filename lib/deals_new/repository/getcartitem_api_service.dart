import 'package:http/http.dart' as http;
import 'dart:convert';

class GetCartApi {
  final String baseUrl = 'https://kot-api.onrender.com';

  Future<Map<String, dynamic>> getCartByUserId(String userId) async {
    final url = Uri.parse('$baseUrl/dev/cart/getCartByUser?userId=$userId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load cart data');
    }
  }
}
