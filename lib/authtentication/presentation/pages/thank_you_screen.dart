import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import '../widgets/custom_buttons.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  void initState() {
    super.initState();
    MyRouters.getCurrentScreenInformation(MyRouters.THANKYOU);
    startTime();
    // initMixPanel();
  }

  startTime() async {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigationPage1);
  }

  Future<void> navigationPage1() async {
    Navigator.pushReplacementNamed(context, MyRouters.NAV);
  }

  final kTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 32,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //  extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: SvgPicture.asset(
            'assets/app_background.svg',
            fit: BoxFit.fill,
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          title: const Text(
            "Welcome",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20.0, left: 15, right: 15, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thank you!",
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: CustomColor.colorBlack,
                    fontSize: 32,
                    fontFamily: "Poppins"),
              ),
              const SizedBox(height: 5),
              Text(
                "Thank you for registering with Us",
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.normal,
                    color: CustomColor.colorBlack,
                    fontSize: 16,
                    fontFamily: "Poppins"),
              ),
              Text(
                "To Be Activated to our Hub",
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.normal,
                    color: CustomColor.colorBlack,
                    fontSize: 16,
                    fontFamily: "Poppins"),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    "assets/thank_you.png",
                    //  height: MediaQuery.of(context).size.height-150,
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
