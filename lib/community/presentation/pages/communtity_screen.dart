import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/community/presentation/pages/group_screen.dart';
import 'package:kot/community/presentation/widgets/page_slider.dart';
import 'package:kot/dashboard/dashboard_page.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<PageSliderState> _slider = GlobalKey();
  CarouselController carouselController = CarouselController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: const CommonBottom(selectedIndex: 0),
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
                    const EdgeInsets.only(top: 35, left: 15.0, right: 15.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      //  key: ConstantsValues.searchKey,
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: SearchWidget(),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
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
                      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: const [
                        Tab(
                          text: 'Feeds',
                        ),
                        Tab(
                          text: 'Groups',
                        ),
                      ],
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [DashBoardPage()],
                              ),
                            ),
                            GroupScreen()
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
