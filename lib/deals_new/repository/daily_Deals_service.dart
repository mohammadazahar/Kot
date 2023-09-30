import 'package:http/http.dart' as http;
import 'dart:convert';

class DailyDealsService {
  final String baseUrl = 'https://kot-api.onrender.com';

  Future<Map<String, dynamic>> fetchDailyDeals() async {
    final response =
        await http.get(Uri.parse('$baseUrl/dev/deal/daily-deals-products'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load daily deals');
    }
  }
}
