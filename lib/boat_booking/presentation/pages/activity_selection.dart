import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

class ActivitySelection extends StatefulWidget {
  const ActivitySelection({super.key});

  @override
  State<ActivitySelection> createState() => _ActivitySelectionState();
}

class _ActivitySelectionState extends State<ActivitySelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CommonBottom(selectedIndex: 3),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/app_background.svg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 25.0, left: 20.0, bottom: 100),
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
                          child: Icon(
                            Icons.notification_add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.white,
                        elevation: 4.0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, right: 10.0, left: 10.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "What Type Of Trip Are You  Planing?",
                                style: TextStyle(
                                    color: CustomColor.colorPrimary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, MyRouters.BOAT_TYPE);
                                            },
                                            child: Card(
                                              elevation: 3,
                                              margin: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                height: 160,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //   width: 0.2,
                                                  // ),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          "assets/active.png"),
                                                      //  NetworkImage('https://images.boats.com/resize/1/62/61/8326261_20220520032353442_1_LARGE.jpg?t=1653042234000'),
                                                      fit: BoxFit.fill),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            decoration: BoxDecoration(
                                                color: CustomColor.colorPrimary,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Text('Active')),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    MyRouters.BOAT_TYPE);
                                              },
                                              child: Card(
                                                elevation: 3,
                                                margin: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Container(
                                                  height: 160,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  decoration: BoxDecoration(
                                                    // border: Border.all(
                                                    //   width: 0.2,
                                                    // ),
                                                    image:
                                                        const DecorationImage(
                                                            image: AssetImage(
                                                                "assets/party_time.png"),
                                                            //  NetworkImage('https://images.boats.com/resize/1/62/61/8326261_20220520032353442_1_LARGE.jpg?t=1653042234000'),
                                                            fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                              alignment: Alignment.center,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                  color:
                                                      CustomColor.colorPrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child:
                                                  const Text('Part or Event')),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, MyRouters.BOAT_TYPE);
                                            },
                                            child: Card(
                                              elevation: 3,
                                              margin: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                height: 160,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //   width: 0.2,
                                                  // ),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          "assets/relax_time.png"),
                                                      //  NetworkImage('https://images.boats.com/resize/1/62/61/8326261_20220520032353442_1_LARGE.jpg?t=1653042234000'),
                                                      fit: BoxFit.fill),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            decoration: BoxDecoration(
                                                color: CustomColor.colorPrimary,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Text('Relax Time ')),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    MyRouters.BOAT_TYPE);
                                              },
                                              child: Card(
                                                elevation: 3,
                                                margin: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Container(
                                                  height: 160,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  decoration: BoxDecoration(
                                                    // border: Border.all(
                                                    //   width: 0.2,
                                                    // ),
                                                    image:
                                                        const DecorationImage(
                                                            image: AssetImage(
                                                                "assets/family_fun.png"),
                                                            //  NetworkImage('https://images.boats.com/resize/1/62/61/8326261_20220520032353442_1_LARGE.jpg?t=1653042234000'),
                                                            fit: BoxFit.fill),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                              alignment: Alignment.center,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                  color:
                                                      CustomColor.colorPrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child:
                                                  const Text(' Family Time')),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
