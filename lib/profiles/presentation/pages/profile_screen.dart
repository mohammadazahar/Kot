import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/profiles/presentation/pages/userProfile.dart';
import 'package:kot/toastHelper.dart';

import '../../../custom_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
              padding: const EdgeInsets.only(top: 35, left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/img_profile14.png",
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Good Morning',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            'Test',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                MyRouters.userProfileScreen,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, // Set the background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the value to round the corners as desired
                              ),
                            ),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: CustomColor
                                    .colorPrimary, // Set the text color
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 130.0),
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRouters.fish_mapPage);
                                },
                                leading: Image.asset(
                                  "assets/fish.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'Fish Catch',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(context, MyRouters.Add);
                                },
                                leading: Image.asset(
                                  "assets/boatbooking.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'Boat Booking',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  ToastHelper.showToast("Comming Soon");
                                },
                                leading: Image.asset(
                                  "assets/logbook.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'Log Book',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRouters.appSettingScreen);
                                },
                                leading: Image.asset(
                                  "assets/settings.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'App Settings',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRouters.openOrderScreen);
                                },
                                leading: Image.asset(
                                  "assets/bookinghistory.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'Booking History',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {},
                                leading: Image.asset(
                                  "assets/contactus.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRouters.myTournamentScreen);
                                },
                                leading: Image.asset(
                                  "assets/tournment.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'Tournament',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  ToastHelper.showToast("Comming Soon");
                                },
                                leading: Image.asset(
                                  "assets/cart.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'Shop',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRouters.recentPostScreen);
                                },
                                // leading: Image.asset(
                                //   "assets/fish.png",
                                //   width: 30,
                                //   height: 30,
                                // ),
                                title: const Text(
                                  'RecentPost',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRouters.fishCharMainpPage);
                                },
                                leading: Image.asset(
                                  "assets/fish.png",
                                  width: 30,
                                  height: 30,
                                ),
                                title: const Text(
                                  'Fish Catch',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            // Card(
                            //   child: ListTile(
                            //     onTap: () {
                            //       Navigator.pushNamed(context,
                            //           MyRouters.myTournamentLeaderBoardScreen);
                            //     },
                            //     // leading: Image.asset(
                            //     //   "assets/fish.png",
                            //     //   width: 30,
                            //     //   height: 30,
                            //     // ),
                            //     title: const Text(
                            //       'LeaderBoard',
                            //       style: TextStyle(
                            //           fontSize: 16,
                            //           color: Colors.black,
                            //           fontWeight: FontWeight.normal),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
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
