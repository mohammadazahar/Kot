// address_controller.dart

import 'package:get/get.dart';
import 'package:kot/deals_new/repository/get_address_service.dart';
import '../model/get_address_model.dart';

class GetAddressController extends GetxController {
  final GetDeletAddressApiService _apiService = GetDeletAddressApiService();
  final GetDeletAddressApiService _deleteApiService =
      GetDeletAddressApiService();
  final RxList<DatumAddress> addresses =
      <DatumAddress>[].obs; // List to store addresses
  var selectedAddressIndex = RxInt(-1);

  final RxBool isLoading = false.obs;

  // Function to fetch addresses
  Future<void> fetchAddresses(String userId) async {
    try {
      selectedAddressIndex.value = -1;
      final getAddress = await _apiService.getAddressesByUserId(userId);
      addresses.value = getAddress.data;
    } catch (e) {
      // Handle errors (e.g., show an error message)
      print('Error fetching addresses: $e');
    }
  }

  Future<void> deleteAddress(String addressId) async {
    try {
      isLoading.value = true;
      await _deleteApiService.deleteAddress(addressId);
      // After deletion, fetch addresses to refresh the list
      await fetchAddresses('64a2f9dbf060197eb17432d1');
    } catch (e) {
      // Handle errors
      print('Error deleting address: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
