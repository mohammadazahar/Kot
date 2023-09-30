import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

import '../../boat_booking/presentation/widgets/search_widget.dart';
import '../../deals_new/widgets/custom_button.dart';

class FishCatcherPayment extends StatefulWidget {
  const FishCatcherPayment({super.key});

  @override
  State<FishCatcherPayment> createState() => _FishCatcherPaymentState();
}

class _FishCatcherPaymentState extends State<FishCatcherPayment> {
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
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
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
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
                    //   const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fihing charter',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    //     const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      //  key: ConstantsValues.searchKey,
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: SearchWidget(),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Payment Details',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Card(
                              elevation: 10,
                              color: Colors.white,
                              child: TextField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Name',
                                  hintText: 'Enter your name',
                                  // errorText: _nameController
                                  //     ? null
                                  //     : 'Enter a valid email address',
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight:
                                          FontWeight.bold), //hint text style
                                  labelStyle: TextStyle(
                                      fontSize: 13, color: Colors.blue),
                                ),
                                //     onChanged: _validateEmail,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Card(
                              elevation: 10,
                              color: Colors.white,
                              child: TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Email',
                                  hintText: 'Enter your email address',
                                  // errorText: _nameController
                                  //     ? null
                                  //     : 'Enter a valid email address',
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight:
                                          FontWeight.bold), //hint text style
                                  labelStyle: TextStyle(
                                      fontSize: 13, color: Colors.blue),
                                ),
                                //     onChanged: _validateEmail,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Card(
                              elevation: 10,
                              color: Colors.white,
                              child: TextField(
                                controller: _mobileController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Mobile Number',
                                  hintText: 'Enter your mobile number',
                                  // errorText: _nameController
                                  //     ? null
                                  //     : 'Enter a valid email address',
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight:
                                          FontWeight.bold), //hint text style
                                  labelStyle: TextStyle(
                                      fontSize: 13, color: Colors.blue),
                                ),
                                //     onChanged: _validateEmail,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Select Payment Method',
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
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
                                        context, MyRouters.fishcharterHistory);
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
            ],
          ),
        ),
      ),
    );
  }
}
