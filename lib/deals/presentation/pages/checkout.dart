import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';
import 'package:kot/deals/presentation/widgets/custom_button.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    super.initState();
  }

  var paymentMethods = ['Credit Card', 'Paypal', 'Google Pay', 'Apple Pay'];
  var paymentLogos = ['credit', 'paypal', 'gpay', 'applepay'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: const CommonBottom(selectedIndex: 4),
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
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRouters.profileScreen);
                            },
                            child: const Icon(
                              Icons.people,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                ToastHelper.showToast("Comming Soon");
                              },
                              child: Icon(
                                Icons.notification_add,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                            child: Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 34.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '2 Items in your cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 34.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '180',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 140),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Delivery Address',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                            itemCount: 2,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return Container(
                                margin:
                                    EdgeInsets.only(bottom: i != 2 ? 10 : 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: Radio(
                                    value: i.isOdd ? 1 : 2,
                                    groupValue: 1,
                                    onChanged: (value) {},
                                  ),
                                  title: Text(
                                    'Home Address $i',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: const Text(
                                    '123, Main Street, New York, USA',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomFilledButton(
                          child: const Text('Add Address'),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Payment Method',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            for (var i = 0; i < paymentLogos.length; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: ListTile(
                                  leading: Image.asset(
                                    'assets/images/${paymentLogos[i]}.png',
                                    width: 20,
                                  ),
                                  title: Text(
                                    paymentMethods[i],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: Radio(
                                    value: i,
                                    groupValue: 1,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: CustomFilledButton(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 20),
                              child: Text('Pay Now'),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRouters.dealsThanksPage);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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
