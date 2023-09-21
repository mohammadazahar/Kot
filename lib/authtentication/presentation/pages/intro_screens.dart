import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/boat_booking/presentation/widgets/custom_buttons.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';

class IntoScreens extends StatefulWidget {
  const IntoScreens({Key? key}) : super(key: key);

  @override
  State<IntoScreens> createState() => _IntoScreensState();
}

class _IntoScreensState extends State<IntoScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 15, right: 15, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CarouselSlider(
                    items: [
                      //1st Image of Slider
                      Column(
                        children: [
                          const Text("Hello, You On New Accounts Only "),
                          const SizedBox(height: 5),
                          const Text("Create your next adventure"),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.asset(
                                "assets/intro_1.png",
                                //  height: MediaQuery.of(context).size.height - 150,
                              ),
                              // child: SvgPicture.asset(
                              //   "assets/intro_1.svg",
                              //   height: 150,
                              //   //    height: MediaQuery.of(context).size.height,
                              // ),
                            ),
                          ),
                        ],
                      ),
                      //2nd Image of Slider
                      Column(
                        children: [
                          const Text("Hello, You On New Accounts Only"),
                          const SizedBox(height: 5),
                          const Text("Create your next adventure"),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.asset(
                                "assets/intro_2.png",
                                //  height: MediaQuery.of(context).size.height-150,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    //Slider Container properties
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height - 150,
                      // enlargeCenterPage: true,
                      autoPlay: false,
                      initialPage: 1,
                      viewportFraction: 1,
                      aspectRatio: 16 / 9,
                      //   autoPlayCurve: Curves.fastOutSlowIn,
                      // enableInfiniteScroll: true,
                      // autoPlayAnimationDuration:
                      //     const Duration(milliseconds: 800),
                      //  viewportFraction: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // BorderButton(
                //   borderColor: CustomColor.colorPrimary,
                //   onPressed: () {
                //     Navigator.pushNamed(context, MyRouters.LOGIN);
                //   },
                //   backgroundColor: CustomColor.colorPrimary,
                //   borderRadius: 8,
                //   width: (MediaQuery.of(context).size.width) - 30,
                //   height: 40,
                //   title: const Text(
                //     "SKIP",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: CustomColor.colorWhite,
                //       fontSize: 15,
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // BorderButton(
                //   borderColor: CustomColor.colorPrimary,
                //   onPressed: () {
                //     Navigator.pushNamed(context, MyRouters.LOGIN);
                //   },
                //   backgroundColor: CustomColor.colorPrimary,
                //   borderRadius: 8,
                //   width: (MediaQuery.of(context).size.width) - 30,
                //   height: 40,
                //   title: const Text(
                //     "LOGIN",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: CustomColor.colorWhite,
                //       fontSize: 15,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BorderButton(
                    borderColor: CustomColor.colorPrimary,
                    onPressed: () {
                      Navigator.pushNamed(context, MyRouters.LOGIN);
                    },
                    backgroundColor: CustomColor.colorPrimary,
                    borderRadius: 8,
                    width: (MediaQuery.of(context).size.width) - 30,
                    height: 40,
                    title: const Text(
                      "SKIP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.colorWhite,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  BorderButton(
                    borderColor: CustomColor.colorPrimary,
                    onPressed: () {
                      Navigator.pushNamed(context, MyRouters.LOGIN);
                    },
                    backgroundColor: CustomColor.colorPrimary,
                    borderRadius: 8,
                    width: (MediaQuery.of(context).size.width) - 30,
                    height: 40,
                    title: const Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.colorWhite,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
