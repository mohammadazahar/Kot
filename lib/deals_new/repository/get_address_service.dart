// address_api_service.dart

import 'package:http/http.dart' as http;
import 'package:kot/deals_new/model/get_address_model.dart';

class GetDeletAddressApiService {
  final String baseUrl = 'https://kot-api.onrender.com';

  Future<GetAddress> getAddressesByUserId(String userId) async {
    const String userId = '64a2f9dbf060197eb17432d1';
    final response = await http
        .get(Uri.parse('$baseUrl/dev/address/getbyuserid?user=$userId'));

    if (response.statusCode == 200) {
      return getAddressFromJson(response.body);
    } else {
      throw Exception('Failed to fetch addresses');
    }
  }

  Future<void> deleteAddress(String addressId) async {
    final apiUrl = '$baseUrl/dev/address/delete?addressId=$addressId';
    try {
      final response = await http.delete(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Address deleted successfully, you can handle the response if needed
      } else {
        // Handle error, e.g., show an error message
        print('Failed to delete address: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors
      print('Error deleting address: $e');
    }
  }
}
