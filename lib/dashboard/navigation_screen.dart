import 'package:flutter/material.dart';
import 'package:kot/boat_booking/presentation/pages/activity_selection.dart';
import 'package:kot/dashboard/map.dart';
import 'package:kot/deals/presentation/pages/deals.dart';
import 'package:kot/deals_new/deals.dart';

import '../community/presentation/pages/communtity_screen.dart';
import '../my_routes.dart';
import 'message.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedTab = 0;
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  List<String> navItems = ["home", "igo"];

  getBottomUi() {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        itemCount: navItems.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              String router = MyRouters.COMMUNITYsCREEN;
              switch (index) {
                case 1:
                  router = MyRouters.REGISTER_OTP;
                  break;

                default:
                  router = MyRouters.COMMUNITYsCREEN;
                  break;
              }
              Navigator.pushNamedAndRemoveUntil(
                  context, router, (route) => false);
            },
            child: Column(
              children: [
                Image.asset(getImage(index)),
                SizedBox(
                  height: 5,
                ),
                Text(navItems[index])
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  String getImage(int index) {
    switch (index) {
      case 0:
        return "home.png";
      case 1:
        return "";
      default:
        return "";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _buildBody = <Widget>[
    CommunityScreen(),
    const MessageScreen(),
    const MapScreen(),
    const ActivitySelection(),
    DealScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30,
            ),
            label: "Community",
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/mssg.png"),
                size: 30,
              ),
              label: "Message"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/map_icon.png"),
                size: 30,
              ),
              label: "Map"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/add_icon.png"),
                size: 30,
              ),
              label: "Add"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/deal_icon.png"),
                size: 30,
              ),
              label: "Deals"),
        ],
      ),
    );
  }
}
