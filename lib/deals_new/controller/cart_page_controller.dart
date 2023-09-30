import 'package:get/get.dart';
import 'package:kot/deals_new/repository/cart_page_service.dart';

class CartController extends GetxController {
  // final GetCartController getCartController = Get.put(GetCartController());
  final CartApiService _cartApiService = CartApiService();

  Future<void> addToCart(String userId, String productId) async {
    try {
      final addCart = await _cartApiService.addToCart(userId, productId, 1);

      print('Item added to cart. Message: ${addCart.message}');
    } catch (e) {
      // Handle error
      print('Error adding item to cart: $e');
    }
  }

  Future<void> removeCartItem(String userId, String productId) async {
    try {
      // Remove the product from the cart
      final removeCart =
          await _cartApiService.removeFromCart(userId, productId, 0);

      // await getCartController.fetchCartData("64a2f9dbf060197eb17432d1");
    } catch (e) {
      // Handle error
      print('Error removing item from cart: $e');
    }
  }
}
