import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/add_screen.dart';
import 'package:kot/community/presentation/pages/communtity_screen.dart';
import 'package:kot/constants_values.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/dashboard/map.dart';
import 'package:kot/dashboard/message.dart';
import 'package:kot/deals/presentation/pages/deals.dart';
import 'package:kot/nav/nav_bar_bloc.dart';
import 'package:kot/toastHelper.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  TutorialCoachMark? tutorial;
  List<TargetFocus> targets = [];
  GlobalKey communtiyBottomKey = GlobalKey();
  GlobalKey mssgKey = GlobalKey();
  GlobalKey mapKey = GlobalKey();
  GlobalKey addKey = GlobalKey();
  GlobalKey dealsKey = GlobalKey();
  static GlobalKey profileButtonKey = GlobalKey();
  static GlobalKey notificationButtonKey = GlobalKey();
  //GlobalKey shopKey = GlobalKey();
  BuildContext? myContext;
  DateTime? currentBackPressTime;
  int communtiyIndex = 0;
  int mssgIndex = 1;
  int mapIndex = 2;
  int addIndex = 3;
  int dealsIndex = 4;

  @override
  void initState() {
    super.initState();
    initTargets();

    // WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  @override
  Widget build(BuildContext context) {
    myContext = context;
    return WillPopScope(
      onWillPop: () {
        if (ConstantsValues.tooltip != null &&
            !ConstantsValues.isToolTipClose) {
          ConstantsValues.tooltip!.close();
          ConstantsValues.tooltip = null;
          return Future.value(false);
        } else if (navBarBloc.navIndex == 0) {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
            currentBackPressTime = now;
            ToastHelper.showToast("Please press again to exit");
            return Future.value(false);
          }
          return Future.value(true);
        } else {
          navBarBloc.pickItem(0);
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: StreamBuilder<int>(
          stream: navBarBloc.navItemIndex,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return IndexedStack(
              index: snapshot.data,
              children: <Widget>[
                CommunityScreen(),
                MessageScreen(),
                MapScreen(),
                Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            alignment: FractionalOffset.center,
                            height: 80.0,
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/community_icon.png',
                                  color: Colors.blue,
                                  fit: BoxFit.cover,
                                ),
                                const Text(
                                  "Fish Catch",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        Container(
                            alignment: FractionalOffset.center,
                            height: 80.0,
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  color: Colors.blue,
                                  'assets/community_icon.png',
                                  fit: BoxFit.cover,
                                ),
                                const Text(
                                  "Book a Boat",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                      ],
                    ),
                    CommunityScreen(),
                  ],
                ),
                DealsScreen(),
              ],
            );
          },
        ),
        bottomNavigationBar: StreamBuilder(
          stream: navBarBloc.navItem,
          initialData: navBarBloc.defaultItem,
          builder: (context, AsyncSnapshot<NavBarItem> snapshot) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  // height: MediaQuery.of(context).size.height / 14,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Expanded(
                            child: navItem(
                                // "community_icon",
                                "Community",
                                snapshot.data?.index == communtiyIndex,
                                communtiyBottomKey,
                                communtiyIndex,
                                context)),
                        Expanded(
                            child: navItem(
                                //"mssg",
                                "Mssg",
                                snapshot.data?.index == mssgIndex,
                                mssgKey,
                                mssgIndex,
                                context)),
                        Expanded(
                            child: navItem(
                                //  "map_icon",
                                "Map",
                                snapshot.data?.index == mapIndex,
                                mapKey,
                                mapIndex,
                                context)),
                        Expanded(
                            child: navItem(
                                //  "add_icon",
                                "Add",
                                snapshot.data?.index == addIndex,
                                addKey,
                                addIndex,
                                context)),
                        Expanded(
                            child: navItem(
                                //   "deal_icon",
                                "Deals",
                                snapshot.data?.index == dealsIndex,
                                dealsKey,
                                dealsIndex,
                                context)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget navItem(
      String label, bool isActive, Key key, int index, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          navBarBloc.pickItem(index);
        },
        child: Container(
          // width: width / 5,
          child: Column(
            children: [
              Container(
                // width: width/5,
                height: height / 270,
                decoration: BoxDecoration(
                  color: isActive
                      ? CustomColor.acceptButton
                      : CustomColor.colorWhite,
                  // borderRadius: BorderRadius.circular(5)
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Container(
              //   key: key,
              //   padding: EdgeInsets.all(6),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: isActive
              //         ? CustomColor.acceptButton
              //         : CustomColor.disableColor,
              //   ),
              //   child: Center(
              //     child: Image.asset(
              //       "assets/$icon.png",
              //       height: 16,
              //       width: 16,
              //       color: CustomColor.colorWhite,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  label,
                  style: TextStyle(
                      fontWeight:
                          isActive ? FontWeight.w600 : FontWeight.normal,
                      fontSize: 10,
                      color: isActive
                          ? CustomColor.acceptButton
                          : CustomColor.convertColor("777777")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//commit the show tutorial
//   void _afterLayout(_) async {
//     await Future.delayed(Duration(seconds: 1));
//     if (SharedPreferencesHelper.checkShowAppTour()) {
//       if (!SharedPreferencesHelper.checkAppTour() &&
//           ConstantsValues.showTour == '') {
//         //  showTutorial();
//       }
//     } else {
//       ConstantsValues.showTour = 'checked';
//       SharedPreferencesHelper.setShowAppTour(true);
//     }
//   }
//commit the show tutorial
  // void showTutorial() {
  //   tutorial = TutorialCoachMark(
  //     targets: targets,
  //     colorShadow: CustomColor.colorPrimary.withOpacity(0.1),
  //     skipWidget: Container(
  //       color: CustomColor.colorPrimary.withOpacity(0.1),
  //       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
  //       child: Text(
  //         allTranslations.text("Skip"),
  //         style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //             color: CustomColor.colorWhite),
  //       ),
  //     ),
  //     paddingFocus: 10,
  //     opacityShadow: 0.8,
  //     alignSkip: Alignment.topRight,
  //     onFinish: () {
  //        SharedPreferencesHelper.setAppTour(true);
  //     },
  //     onSkip: () {
  //       SharedPreferencesHelper.setAppTour(true);
  //     },
  //   )..show(context: myContext!);
  // }

  initTargets() {
    targets.add(
      TargetFocus(
        identify: "homeBottomKey",
        keyTarget: communtiyBottomKey,
        enableOverlayTab: true,
        enableTargetTab: true,
        paddingFocus: 8,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Community",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 5),
                    child: Text(
                      "home_tour",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    targets.add(
      TargetFocus(
        keyTarget: profileButtonKey,
        identify: "shopKey",
        enableOverlayTab: true,
        enableTargetTab: true,
        paddingFocus: 8,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 5),
                    child: Text(
                      "all_tour",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    //internetBloc.dispose();
    super.dispose();
  }
}
