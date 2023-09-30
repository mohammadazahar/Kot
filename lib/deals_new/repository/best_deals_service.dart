import 'dart:convert';
import 'package:http/http.dart' as http;

class BestDealsService {
  final String baseUrl = 'https://kot-api.onrender.com/dev/deal/best-deals';

  Future<Map<String, dynamic>> fetchBestDeals() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to load best deals');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
