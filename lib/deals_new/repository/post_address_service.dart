import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kot/deals_new/model/add_address_model.dart';

class AddressApiService {
  final String baseUrl =
      'https://kot-api.onrender.com'; // Replace with your API base URL

  Future<AddAddress> addAddress({
    required String fullName,
    required String streetAddress,
    required String city,
    required String state,
    required String postalCode,
    required String country,
  }) async {
    final url = '$baseUrl/dev/address';
    final body = {
      "user": "64a2f9dbf060197eb17432d1",
      "fullName": fullName,
      "streetAddress": streetAddress,
      "city": city,
      "state": state,
      "postalCode": postalCode,
      "country": country,
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

      if (response.statusCode == 200) {
        return AddAddress.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to add address');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
