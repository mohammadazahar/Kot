import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/deals_new/components/cart_page.dart';
import 'package:kot/deals_new/controller/cart_page_controller.dart';
import 'package:kot/deals_new/controller/product_details_controller.dart';
import 'package:kot/deals_new/widgets/custom_button.dart';
import 'package:kot/widgets/app_bar/custom_app_bar.dart';
import 'package:kot/widgets/custom_clipper.dart';

class ProductDetail extends StatelessWidget {
  final String categoryId;
  const ProductDetail({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());
    final cartcontroller = Get.put(CartController());
    // Fetch products for the selected category
    controller.fetchProductsCategory(categoryId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  CustomClipBackground(height: 200, color: Colors.blue)
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 23,
                              )),
                          Text(
                            "Deals",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      // CustomAppBar(height: 50),

                      SearchWidget(),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 43,
                        child: const Center(
                          child: Text(
                            'Products',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomFilledButton(
                              color: Colors.white,
                              elevation: 5,
                              onPressed: () {},
                              child: const Text(
                                'Species',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomFilledButton(
                              elevation: 5,
                              onPressed: () {},
                              child: const Text(
                                'Products',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Obx(() {
                                final products = controller.products.value;

                                if (products == null) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (products.data.isEmpty) {
                                  return const Text(
                                      'No products available for this category.');
                                } else {
                                  final product = products.data[index];
                                  return ListView.builder(
                                      itemCount: products.data.length,
                                      itemBuilder: (context, i) {
                                        final product = products.data[i];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 45),
                                          child: Container(
                                            // height: 300,
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 5),
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            child: IntrinsicHeight(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    height: 200,
                                                    margin:
                                                        const EdgeInsets.all(
                                                            20),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Colors.black12,
                                                          blurRadius: 5,
                                                          offset: Offset(0, 5),
                                                        ),
                                                      ],
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            product.image),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    product.name,
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Color: ${product.color}',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Price: \$ ${product.price.toString()}',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Color: ${product.materialType}',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Sizes",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: List.generate(
                                                      product.size.length,
                                                      (i) {
                                                        final size =
                                                            product.size[i];
                                                        return Container(
                                                          height: 40,
                                                          width: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            color: const Color(
                                                                0xFF74B9FF),
                                                          ),
                                                          child: Center(
                                                            child:
                                                                Text('$size'),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Obx(
                                                        () {
                                                          final productId = product
                                                              .id; // Get the product ID
                                                          final isInCart =
                                                              controller
                                                                  .selectedSizes
                                                                  .contains(
                                                                      productId);
                                                          if (isInCart) {
                                                            // If the product is in the cart, display a custom button for "Added"
                                                            return const CustomFilledButton(
                                                              child: Text(
                                                                "Added",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            // If the product is not in the cart, display the "Add to Cart" button
                                                            return CustomFilledButton(
                                                              child: const Text(
                                                                "Add to Cart",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                final productId =
                                                                    product.id;
                                                                const userId =
                                                                    '64a2f9dbf060197eb17432d1';

                                                                if (!controller
                                                                    .selectedSizes
                                                                    .contains(
                                                                        productId)) {
                                                                  // Product is not in the cart, so add it
                                                                  cartcontroller
                                                                      .addToCart(
                                                                          userId,
                                                                          productId);
                                                                  // Mark the product as added in your controller
                                                                  controller
                                                                      .selectedSizes
                                                                      .add(
                                                                          productId);
                                                                } else {}
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      CustomFilledButton(
                                                          child: const Text(
                                                              'Buy Now'),
                                                          onPressed: () {
                                                            final productId =
                                                                product.id;
                                                            const userId =
                                                                '64a2f9dbf060197eb17432d1';

                                                            if (!controller
                                                                .selectedSizes
                                                                .contains(
                                                                    productId)) {
                                                              // Product is not in the cart, so add it
                                                              cartcontroller
                                                                  .addToCart(
                                                                      userId,
                                                                      productId);
                                                              // Mark the product as added in your controller
                                                              controller
                                                                  .selectedSizes
                                                                  .add(
                                                                      productId);
                                                            } else {}
                                                          }),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 1, // Adjust the bottom value to your preference
                left: 0,
                right: 0,
                child: Center(
                  child: CustomFilledButton(
                    color: Colors.white,
                    elevation: 5,
                    onPressed: () {
                      Get.to(() => CartPage());
                    },
                    child: const Text(
                      'Proceed to checkout',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
