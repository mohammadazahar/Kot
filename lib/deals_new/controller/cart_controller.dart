import 'package:get/get.dart';
import 'package:kot/deals_new/model/cart_model.dart';
import 'package:kot/deals_new/repository/getcartitem_api_service.dart';

class GetCartController extends GetxController {
  final GetCartApi _apiService = GetCartApi();
  Rx<CartList> cartData = Rx<CartList>(CartList(data: Data(items: [])));

  @override
  void onInit() {
    super.onInit();
    fetchCartData('64a2f9dbf060197eb17432d1');
  }

  Future<void> fetchCartData(String userId) async {
    try {
      final response = await _apiService.getCartByUserId(userId);
      cartData.value = CartList.fromJson(response);
    } catch (e) {
      print('Error fetching cart data: $e');
    }
  }

  double calculateSubTotalPrice() {
    double total = 0.0;
    final cartItems = cartData.value.data!.items;

    for (final item in cartItems!) {
      total += item.product.price * item.quantity;
    }

    return total;
  }

  double calculateTotalPrice() {
    double subtotal = 0.0;
    double discount = 0.0; // Add your discount calculation logic here
    double delivery = 0.0; // Add your delivery cost calculation logic here
    double total = 0.0;

    final cartItems = cartData.value.data!.items;

    for (final item in cartItems!) {
      subtotal += item.product.price * item.quantity;
      // Add any item-level discounts or adjustments here
    }

    total = subtotal - discount + delivery;

    return total;
  }

  // Function to calculate the total of all values
  // double calculateGrandTotal() {
  //   double subtotal = 0.0;
  //   double discount = 0.0;
  //   double itemDiscount = 0.0;
  //   String shipping = 'Free';
  //   // Calculate other values like discount, item discount, and shipping
  //   // You can add your logic here to calculate those values

  //   final total = subtotal - discount - itemDiscount;

  //   return total;
  // }
}
