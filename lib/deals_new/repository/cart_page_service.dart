import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kot/deals_new/model/addcart_model.dart';

class CartApiService {
  final String baseUrl = 'https://kot-api.onrender.com';

  Future<AddCart> addToCart(
      String userId, String productId, int quantity) async {
    const String userId = '64a2f9dbf060197eb17432d1';
    final url = '$baseUrl/dev/cart/addToCart';
    final body = {
      'user': userId,
      'product': productId,
      'quantity': "1",
    };
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      print('API Response: ${response.body}');
      if (response.statusCode == 200) {
        // Parse the JSON response using your AddCart model
        final addCart = AddCart.fromJson(jsonDecode(response.body));
        print('Item added to cart. Message: ${addCart.message}');
        return addCart;
      } else {
        // Handle error
        throw Exception('Failed to add item to cart');
      }
    } catch (e) {
      // Handle network error
      throw Exception('Network error: $e');
    }
  }

  Future<void> removeFromCart(
      String userId, String productId, int quantity) async {
    const String userId = '64a2f9dbf060197eb17432d1';
    final url = '$baseUrl/dev/cart/updateCartItemQuantity';
    final body = {
      'user': userId,
      'product': productId,
      'quantity': 0,
    };
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      print('Request URL: $url');
      print('Request Body: ${jsonEncode(body)}');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData.containsKey('message')) {
          final message = responseData['message'];
          if (message == 'Cart item quantity updated successfully!') {
            print('Item removed from cart. Message: $message');
          } else {
            // Handle other scenarios or errors
            print('Error removing item from cart: $message');
          }
        } else {
          print('Unexpected response format');
        }
      } else {
        // Handle non-200 status codes
        print('Failed to remove item from cart');
      }
    } catch (e) {
      // Handle network error
      print('Network error: $e');
      throw Exception('Network error: $e');
    }
  }
}
