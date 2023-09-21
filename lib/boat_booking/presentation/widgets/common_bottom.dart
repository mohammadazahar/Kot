import 'package:flutter/material.dart';
import 'package:kot/dashboard/message.dart';
import 'package:kot/dashboard/message.dart';
import 'package:kot/my_routes.dart';

class CommonBottom extends StatelessWidget {
  final int selectedIndex;
  const CommonBottom({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    List<String> navItems = ["Community", "Message", "Map", "Add", "Deals"];

    return Container(
      // color: Colors.blue,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        itemCount: navItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              String router = MyRouters.COMMUNITYsCREEN;
              switch (index) {
                case 1:
                  router = MyRouters.Message_Screen;
                  break;
                case 2:
                  router = MyRouters.MAP;
                  break;
                case 3:
                  router = MyRouters.Add;
                  break;
                case 4:
                  router = MyRouters.DEALS;
                  break;
                default:
                  router = MyRouters.COMMUNITYsCREEN;
                  break;
              }
              Navigator.pushNamedAndRemoveUntil(
                  context, router, (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 5),
              child: Container(
                width: 80,
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      getImage(index),
                      color:
                          selectedIndex == index ? Colors.blue : Colors.black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      navItems[index],
                      style: TextStyle(
                        color:
                            selectedIndex == index ? Colors.blue : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
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
        return "assets/community_icon.png";
      case 1:
        return "assets/mssg.png";
      case 2:
        return "assets/map_icon.png";
      case 3:
        return "assets/add_icon.png";
      case 4:
        return "assets/deal_icon.png";

      default:
        return "assets/map_icon.png";
    }
  }
}
