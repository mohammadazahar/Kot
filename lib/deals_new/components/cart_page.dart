import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kot/deals_new/controller/cart_controller.dart';
import 'package:kot/deals_new/controller/cart_page_controller.dart';
import 'package:kot/deals_new/widgets/custom_button.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/widgets/custom_clipper.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              CustomClipBackground(height: 200, color: Colors.blue),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Obx(() {
                    Get.lazyPut(() => GetCartController());
                    final cartController = Get.find<GetCartController>();
                    final subtotal = cartController.calculateSubTotalPrice();
                    final total = cartController.calculateTotalPrice();
                    final cartItems = cartController.cartData.value.data!.items;
                    return Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.adaptive.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: CustomFilledButton(
                                onPressed: () {
                                  Get.back();
                                },
                                color: Colors.white,
                                child: const Text(
                                  'Add More',
                                  style: TextStyle(
                                    color: Color(0xFF74B9FF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' ${cartItems!.length} items in your cart',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70.0, left: 5),
                          child: Column(
                            children: [
                              CartDetailWidget(),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        // const SizedBox(height: 20),
                        // coupon code
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Coupon Code',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Coupon Code',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              // CircleAvatar(
                              //   radius: 14,
                              //   backgroundColor: const Color(0xFF74B9FF),
                              //   child: IconButton(
                              //       onPressed: () {},
                              //       icon: Icon(
                              //         Icons.close,
                              //         size: 15,
                              //         color: Colors.white,
                              //       )),
                              // ),
                              CustomFilledButton(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  // child: Icon(Icons.close),
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // payment summary
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Payment Summary',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Subtotal',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '\$${subtotal.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Discount',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '\$0.00',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'item discount',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '\$0.00',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Shipping',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Free',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '\$${total.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        CustomFilledButton(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: const Center(
                              child: Text(
                                'Proceed order',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyRouters.dealsCheckoutPage);
                          },
                        ),
                        const SizedBox(height: 50),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartDetailWidget extends StatelessWidget {
  final GetCartController cartController = Get.put(GetCartController());
  final CartController removeCartController = Get.put(CartController());

  Future<void> _refreshCart() async {
    // Fetch updated cart data
    await cartController.fetchCartData('64a2f9dbf060197eb17432d1');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshCart,
      child: Obx(() {
        final cartItems = cartController.cartData.value.data!.items;
        if (cartItems == null || cartItems.isEmpty) {
          // Display a message when there are no cart items
          return Container(
            height: 100,
            // width: 100,
            child: const Center(
              child: Text(
                "No cart items",
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              height: 400,
              child: ListView.builder(
                  itemCount: cartController.cartData.value.data!.items!.length,
                  itemBuilder: (context, index) {
                    final item =
                        cartController.cartData.value.data!.items![index];
                    int quantity = item.quantity;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            height: 100,
                            width: 100,
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item.product.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.product.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      'Price: \$',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      item.product.price.toString(),
                                      // item.product.price.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      'Size: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      item.product.size,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Color(0xFF74B9FF),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.close_rounded,
                                    size: 15,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    final productId = item.product.id;
                                    const userId = '64a2f9dbf060197eb17432d1';
                                    removeCartController.removeCartItem(
                                        userId, productId);
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    // color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          if (quantity > 1) {
                                            quantity--;
                                            item.quantity = quantity;
                                            cartController.cartData.refresh();
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        " $quantity",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          // Increase quantity and update UI
                                          quantity++;
                                          item.quantity = quantity;
                                          cartController.cartData.refresh();
                                        },
                                        highlightColor: Colors.transparent,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF74B9FF),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
        }
      }),
    );
  }
}

// class CartPages extends StatelessWidget {
//   final CartController cartController = Get.put(CartController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart Page'),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: cartController.cartData.value.data!.items!.length,
//           itemBuilder: (context, index) {
//             final item = cartController.cartData.value.data!.items![index];
//             return ListTile(
//               leading: CircleAvatar(
//                 child: Image.network(item.product.image),
//               ),
//               title: Text(
//                 item.product.name,
//                 style: TextStyle(color: Colors.black),
//               ),
//               subtitle: Text(item.product.size),
//               // Display other item details as needed
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
