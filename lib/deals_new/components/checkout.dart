import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kot/boat_booking/presentation/pages/boat_booking_screen2.dart';
import 'package:kot/deals_new/controller/cart_controller.dart';
import 'package:kot/deals_new/controller/get_address_controller.dart';
import 'package:kot/deals_new/controller/post_address_controller.dart';
import 'package:kot/deals_new/widgets/custom_button.dart';
import 'package:http/http.dart' as http;
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/custom_clipper.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Map<String, dynamic>? paymentIntent;

  final RxInt selectedPaymentMethod = 0.obs;

  var paymentMethods = ['Credit Card', 'Paypal', 'Google Pay', 'Apple Pay'];

  var paymentLogos = ['credit', 'paypal', 'gpay', 'applepay'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: const CommonBottom(selectedIndex: 4),
      body: SafeArea(
        child: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/app_background.svg"),
          //         fit: BoxFit.fitWidth)),
          child: Stack(
            children: [
              //
              CustomClipBackground(height: 200, color: Colors.blue),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Row(
                      //   //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Icon(
                      //       Icons.arrow_back,
                      //       color: Colors.white,
                      //     ),
                      //     // Image.asset(
                      //     //   "assets/splash_screen_bg.png",
                      //     //   height: 30,
                      //     //   width: 30,
                      //     //   //  height: MediaQuery.of(context).size.height - 150,
                      //     // ),
                      //     const Spacer(),
                      //     GestureDetector(
                      //       onTap: () {
                      //         Navigator.pushNamed(
                      //             context, MyRouters.profileScreen);
                      //       },
                      //       child: const Icon(
                      //         Icons.people,
                      //         size: 24,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     Align(
                      //       alignment: Alignment.topRight,
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           ToastHelper.showToast("Comming Soon");
                      //         },
                      //         child: const Icon(
                      //           Icons.notification_add,
                      //           color: Colors.white,
                      //           size: 24,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                          const Padding(
                            padding: EdgeInsets.only(right: 20.0),
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
                        children: [
                          const Padding(
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
                          Obx(() {
                            final cartController =
                                Get.find<GetCartController>();
                            final total = cartController.calculateTotalPrice();
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 34.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\$${total.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          }),
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
                      AddressWidget(),
                      const SizedBox(height: 30),
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
                            // const Text(
                            //   'Select Payment Method:',
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // Obx(() => ListTile(
                            //       title: const Text('Apple Pay'),
                            //       leading: Radio(
                            //         value: 0,
                            //         groupValue: selectedPaymentMethod.value,
                            //         onChanged: (int? value) {
                            //           selectedPaymentMethod.value = value!;
                            //         },
                            //       ),
                            //     )),
                            // Obx(() => ListTile(
                            //       title: Text('Credit Card'),
                            //       leading: Radio(
                            //         value: 1,
                            //         groupValue: selectedPaymentMethod.value,
                            //         onChanged: (int? value) {
                            //           selectedPaymentMethod.value = value!;
                            //         },
                            //       ),
                            //     )),
                            // Obx(() => ListTile(
                            //       title: Text('Google Pay'),
                            //       leading: Radio(
                            //         value: 2,
                            //         groupValue: selectedPaymentMethod.value,
                            //         onChanged: (int? value) {
                            //           selectedPaymentMethod.value = value!;
                            //         },
                            //       ),
                            //     )),
                            for (var r = 0; r < paymentLogos.length; r++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: ListTile(
                                  leading: Image.asset(
                                    'assets/images/${paymentLogos[r]}.png',
                                    width: 20,
                                  ),
                                  title: Text(
                                    paymentMethods[r],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: Radio(
                                    value: r,
                                    groupValue: 0,
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
                            onPressed: () async {
                              int selectedMethod = selectedPaymentMethod.value;
                              // Handle the selected payment method here
                              switch (selectedMethod) {
                                case 0:
                                  // Apple Pay selected
                                  break;
                                case 1:
                                  // Credit Card selected
                                  // await makCreditCardPayment();
                                  break;
                                case 2:
                                  // Google Pay selected
                                  break;
                                default:
                                  // Handle the default case
                                  break;
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomFilledButton(
                        child: const Text("thanks"),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyRouters.dealsThanksPage);
                        },
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

//   Future<void> makCreditCardPayment() async {
//     try {
//       paymentIntent = await createPaymentIntent("10", "USD");
//       await Stripe.instance.initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//               paymentIntentClientSecret: paymentIntent!["client_secret"],
//               applePay: const PaymentSheetApplePay(merchantCountryCode: "+ 92")
//               googlePay: const PaymentSheetGooglePay(testEnv: true,currencyCode: )
//               ));
//     } catch (e) {}
//   }

// createPaymentIntent(String amount, String currency)async{
//   try{
//     Map<String , dynamic> body = {
//       "amount": calculateAmount(amount),
//       "currency": currency,
//       "payment_method_types[]": "card"
//     };
//      var response = await http.post(
//       Uri.parse("https://api.stripe.com/v1/payment_intents"),
//       headers: {
// 'Authorization': 'Bearer $SECRET_KEY';
// 'Content-Type': 'application/x-www-form-urlencoded'
//       },
//       body: body,
//      );

//   }catch(e){

//   }
// }

// calculateAmount(String amount){
//   final calculateAmount = (int.parse(amount)) * 100;
//   return calculateAmount.toString();
// }
}

class AddressWidget extends StatelessWidget {
  final PostAddressController addressController =
      Get.put(PostAddressController());
  final GetAddressController getaddressController =
      Get.put(GetAddressController());

  @override
  Widget build(BuildContext context) {
    getaddressController.fetchAddresses('64a2f9dbf060197eb17432d1');

    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            FutureBuilder(
              future: getaddressController
                  .fetchAddresses('64a2f9dbf060197eb17432d1'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Obx(() {
                    final addresses = getaddressController.addresses;

                    if (addresses.isEmpty) {
                      return const Center(
                        child: Text(
                          'No addresses found',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: addresses.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final address = addresses[index];
                            return Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        index != addresses.length - 1 ? 10 : 0),
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
                                    activeColor: Colors.blue,
                                    value: index,
                                    groupValue: getaddressController
                                        .selectedAddressIndex.value,
                                    onChanged: (int? value) {
                                      if (value != null) {
                                        print('Selected index: $value');
                                        getaddressController
                                            .selectedAddressIndex.value = value;
                                      }
                                    },
                                  ),
                                  title: Text(
                                    address.fullName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${address.streetAddress}, ${address.city}, ${address.state}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      final addressId = addresses[index].id;
                                      getaddressController
                                          .deleteAddress(addressId);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                  ),
                                ));
                          });
                    }
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomFilledButton(
                child: const Text('Add Address'),
                onPressed: () {
                  _showAddAddressDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddAddressDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Address'),
          content: SingleChildScrollView(
            child: Form(
              // Create a form with TextFormFields for each input field
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Name ', hintText: "ex...Office ,Home"),
                    onChanged: (value) {
                      addressController.fullName.value = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Street Address',
                        hintText: "Street Address"),
                    onChanged: (value) {
                      addressController.streetAddress.value = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'city ', hintText: "city"),
                    onChanged: (value) {
                      addressController.city.value = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'state ', hintText: "state"),
                    onChanged: (value) {
                      addressController.state.value = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'postalCode ', hintText: "postalCode"),
                    onChanged: (value) {
                      addressController.postalCode.value = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'country ', hintText: "country"),
                    onChanged: (value) {
                      addressController.country.value = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Validate and submit the form
                      if (addressController.fullName.isNotEmpty &&
                          addressController.streetAddress.isNotEmpty &&
                          addressController.city.isNotEmpty &&
                          addressController.state.isNotEmpty &&
                          addressController.postalCode.isNotEmpty &&
                          addressController.country.isNotEmpty) {
                        addressController.addAddress();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
