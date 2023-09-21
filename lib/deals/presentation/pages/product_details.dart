import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/deals/data/model/category_model.dart';
import 'package:kot/deals/presentation/widgets/custom_button.dart';
import 'package:kot/deals/presentation/widgets/custom_textfield.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

class ProductDetails extends StatefulWidget {
  // final CategoryDatum categoryDatum;
  // const ProductDetails({super.key, required this.categoryDatum});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  bottomNavigationBar: const CommonBottom(selectedIndex: 4),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/app_background.svg"),
                  fit: BoxFit.fitWidth)),
          child: Stack(
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/app_background.svg',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 250,
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/splash_screen_bg.png",
                            height: 30,
                            width: 30,
                            //  height: MediaQuery.of(context).size.height - 150,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.pushNamed(
                          //         context, MyRouters.profileScreen);
                          //   },
                          //   child: const Icon(
                          //     Icons.people,
                          //     size: 24,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       ToastHelper.showToast("Comming Soon");
                          //     },
                          //     child: Icon(
                          //       Icons.notification_add,
                          //       color: Colors.white,
                          //       size: 24,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      // FilledTextField(
                      //   hint: 'Search',
                      //   controller: controller,
                      // ),
                      SearchWidget(),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
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
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: PageView.builder(
                            itemBuilder: (context, index) {
                              return ListView.builder(
                                  itemCount: 4,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      // height: 300,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      width: MediaQuery.of(context).size.width *
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
                                              margin: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 5),
                                                  ),
                                                ],
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                    'https://source.unsplash.com/random',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Product Name $i',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Divider(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Product Name $i',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Product Name $i',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Product Name $i',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                            const Divider(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Product Name $i',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color: Colors.blue),
                                                  child: Center(
                                                    child: Text('SI $i'),
                                                  ),
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color: Colors.blue),
                                                  child: Center(
                                                    child: Text('SI $i'),
                                                  ),
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color: Colors.blue),
                                                  child: Center(
                                                    child: Text('SI $i'),
                                                  ),
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color: Colors.blue),
                                                  child: Center(
                                                    child: Text('SI $i'),
                                                  ),
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color: Colors.blue),
                                                  child: Center(
                                                    child: Text('SI $i'),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CustomFilledButton(
                                                    child: const Text(
                                                        'Add to Cart'),
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          MyRouters
                                                              .dealsCartPage);
                                                    }),
                                                CustomFilledButton(
                                                    child:
                                                        const Text('Buy Now'),
                                                    onPressed: () {}),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      )
                    ],
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
