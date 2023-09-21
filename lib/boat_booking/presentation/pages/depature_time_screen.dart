import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/pages/boat_booking_screen2.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/theme/custom_text_style.dart';
import 'package:kot/toastHelper.dart';

class DepatureTimeScreen extends StatefulWidget {
  const DepatureTimeScreen({super.key});

  @override
  State<DepatureTimeScreen> createState() => _DepatureTimeScreenState();
}

class _DepatureTimeScreenState extends State<DepatureTimeScreen> {
  final _commendsController = TextEditingController();
  final _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  bottomNavigationBar: CommonBottom(selectedIndex: 3),
        body: Stack(
          children: <Widget>[
            // The containers in the background
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/app_background.svg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
                Container(
                  height: 250,
                  color: Colors.white,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 20.0, left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          Navigator.pushNamed(context, MyRouters.profileScreen);
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
                          child: const Icon(
                            Icons.notification_add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    //  key: ConstantsValues.searchKey,
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: SearchWidget(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                        width: double.maxFinite,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 120.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("Departure Time",
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "What time would you like to depart? You can skip this step if you prefer the owner to suggest a time.",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/clock.svg',
                                        color: Colors.red,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 50,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: _timeController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            labelText: '__:__',
                                            hintText: '',
                                            hintStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight
                                                    .bold), //hint text style
                                            labelStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                          //    keyboardType: TextInputType.any,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Do you have any specific needs or requests that the owner needs to know?",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 100,
                                    child: TextField(
                                      controller: _commendsController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        labelText: 'Comments',
                                        hintText: '',
                                        hintStyle: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight
                                                .bold), //hint text style
                                        labelStyle: TextStyle(
                                            fontSize: 13, color: Colors.blue),
                                      ),
                                      //    keyboardType: TextInputType.any,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      width: MediaQuery.of(context).size.width,
                                      child: CustomElevatedButton(
                                        label: 'Continue',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            MyRouters.THANKYOU,
                                          );
                                        },
                                        buttonColor: primaryColor,
                                        // Custom button color
                                        textColor: Colors.white,
                                        // Custom text color
                                        borderRadius: BorderRadius.circular(
                                            10), // Custom border radius
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
