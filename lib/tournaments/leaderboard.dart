import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/deals/presentation/widgets/custom_textfield.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/tournaments/leaderboard_card.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                // Container(
                //   height: 250,
                //   color: Colors.white,
                // )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
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
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // FilledTextField(
                            //   hint: 'Search',
                            //   controller: controller,
                            //   prefix:
                            //       Icon(Icons.search, color: Theme.of(context).primaryColor),
                            // ),
                            for (int i = 0; i < 10; i++)
                              const LeaderboardCard(),
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
