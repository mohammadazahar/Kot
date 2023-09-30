import 'package:get/get.dart';
import 'package:kot/deals_new/repository/post_address_service.dart';

class PostAddressController extends GetxController {
  final AddressApiService _apiService = AddressApiService();

  // Observable fields to hold form data
  final RxString fullName = ''.obs;
  final RxString streetAddress = ''.obs;
  final RxString city = ''.obs;
  final RxString state = ''.obs;
  final RxString postalCode = ''.obs;
  final RxString country = ''.obs;

  // Function to add an address
  Future<void> addAddress() async {
    try {
      final addAddress = await _apiService.addAddress(
        fullName: fullName.value,
        streetAddress: streetAddress.value,
        city: city.value,
        state: state.value,
        postalCode: postalCode.value,
        country: country.value,
      );
      // Handle the response as needed (e.g., show a success message)
      print('Address added successfully: ${addAddress.message}');
    } catch (e) {
      // Handle errors (e.g., show an error message)
      print('Error adding address: $e');
    }
  }
}
