import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/tournaments/request_card.dart';

import '../boat_booking/presentation/widgets/search_widget.dart';

class TournamentHistoryScreen extends StatefulWidget {
  const TournamentHistoryScreen({super.key});

  @override
  State<TournamentHistoryScreen> createState() =>
      _TournamentHistoryScreenState();
}

class _TournamentHistoryScreenState extends State<TournamentHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController controller;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/splash_screen_bg.png",
                          height: 50,
                          width: 50,
                          //  height: MediaQuery.of(context).size.height - 150,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRouters.profileScreen);
                          },
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: const Icon(
                              Icons.person,
                              size: 24,
                              color: const Color(0xFF74B9FF),
                            ),
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
                    Padding(
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
                          const SizedBox(height: 20),
                          TabBar(
                            controller: tabController,
                            indicatorColor: Theme.of(context).primaryColor,
                            // dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).primaryColor,
                            ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            tabs: const [
                              Tab(
                                text: 'Accepted',
                              ),
                              Tab(
                                text: 'Pending',
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      for (int i = 0; i < 10; i++)
                                        const ChallengeRequestCard(),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      for (int i = 0; i < 10; i++)
                                        const ChallengeRequestCard(
                                          isApproved: false,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
