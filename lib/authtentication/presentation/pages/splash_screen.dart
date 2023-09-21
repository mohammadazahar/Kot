import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/constants_values.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/sharedPreferencesHelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    MyRouters.getCurrentScreenInformation(MyRouters.SPLASH);
    startTime();
    // initMixPanel();
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 2000);
    return new Timer(_duration, navigationPage);
  }

  // Future<void> navigationPage() async {
  //   Navigator.pushReplacementNamed(context, MyRouters.INTROSCREEN);
  // }
  Future<void> navigationPage() async {
    SharedPreferencesHelper.isLogin().then((value) {
      if (value != null && value == true) {
        //Write code to redirect to dashboard of user
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, MyRouters.NAV, (Route<dynamic> route) => false);
        }
      } else {
        //User is not logged in
        //If opening first time
        Navigator.pushReplacementNamed(context, MyRouters.INTROSCREEN,
            arguments: 'splash');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            //    color: Colors.red,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg_splash.png"),
                    fit: BoxFit.fill)),
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Image.asset(
                  "assets/splash_screen_bg.png",
                  //  height: MediaQuery.of(context).size.height - 150,
                ),
                // SvgPicture.asset(
                //   "assets/kot_1.svg",
                //   height: MediaQuery.of(context).size.height * .07,
                // ),
              ),
            )),
      ),
    );
  }

  _getIcon(String image, double height, double width) {
    return Image.asset(image, height: height, width: width);
  }
}
