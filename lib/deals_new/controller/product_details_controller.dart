import 'package:get/get.dart';
import 'package:kot/deals_new/model/product_detail_model.dart';
import 'package:kot/deals_new/repository/product_api_service.dart';

class ProductDetailsController extends GetxController {
  late final ProductApiService _apiService;
  Rx<Products?> products = Rx<Products?>(null);
  RxSet<String> selectedSizes = <String>{}.obs;

  ProductDetailsController() {
    _apiService = ProductApiService(); // Initialize the service
  }

  @override
  void onInit() {
    super.onInit();
    final categoryId = Get.arguments as String?;
    if (categoryId != null) {
      fetchProductsCategory(categoryId);
    } else {
      // Handle the case where categoryId is null, perhaps by showing an error message
      print('Category ID is null');
    }
  }

  Future<void> fetchProductsCategory(String categoryId) async {
    if (categoryId == null) {
      // Handle the case where categoryId is null, perhaps by showing an error message
      print('Category ID is null');
      return;
    }
    try {
      final response = await _apiService.fetchProductsByCategory(categoryId);
      products.value = response;
    } catch (e) {
      print('Error fetching products by category: $e');
    }
  }

//  // Add or remove a size to/from the selected sizes list
//   void toggleSize(String size) {
//     if (selectedSizes.contains(size)) {
//       selectedSizes.remove(size);
//     } else {
//       selectedSizes.add(size);
//     }
//   }

  // void addToCart() {
  //   // Extract the ids of selected products and convert them to a list of strings
  //   final List<String> selectedProductIds = products.value?.data
  //           .where((product) => selectedSizes.contains(product.size))
  //           .map((product) => product.id)
  //           .toList() ??
  //       [];

  //   if (selectedProductIds.isNotEmpty) {
  //     final userId = 'your_user_id'; // Replace with the actual user ID
  //     final quantity = 1; // Adjust the quantity as needed

  //     // Call the addToCart method with the user ID, product IDs, and quantity
  //     Get.find<CartController>()
  //         .addToCart(userId, selectedProductIds, quantity);
  //   } else {
  //     // Handle the case where no products are selected
  //     print('No products selected to add to cart');
  //   }
  // }
}
