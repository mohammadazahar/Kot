import 'package:flutter/material.dart';
import 'package:kot/boat_booking/presentation/widgets/add_screen.dart';
import 'package:kot/community/presentation/pages/communtity_screen.dart';
import 'package:kot/dashboard/map.dart';
import 'package:kot/dashboard/message.dart';
import 'package:kot/deals/presentation/pages/deals.dart';
import 'package:kot/deals_new/deals.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

class NavScreen1 extends StatefulWidget {
  const NavScreen1({super.key});

  @override
  State<NavScreen1> createState() => _NavScreen1State();
}

class _NavScreen1State extends State<NavScreen1> {
  int _currentIndex = 0;

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List _screens = [
      CommunityScreen(),
      const MessageScreen(),
      const MapScreen(),
      Stack(
        children: [
          AnimatedOpacity(
              opacity: 0.3,
              duration: const Duration(seconds: 3),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.4),
                  child: CommunityScreen())),
          Positioned(
            left: MediaQuery.of(context).size.width / 3,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: FractionalOffset.center,
                    height: 80.0,
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        //   ToastHelper.showToast("comming soon");
                        Navigator.pushNamed(context, MyRouters.fish_mapPage);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/fish_catch.png',
                            //      color: Colors.blue,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Fish Catch",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
                Container(
                    alignment: FractionalOffset.center,
                    height: 80.0,
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyRouters.Add);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            // color: Colors.blue,
                            'assets/book_boat.png',
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Book a Boat",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
                Container(
                  alignment: FractionalOffset.centerLeft,
                  height: 80.0,
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      // Close the dialog
                      Navigator.pushNamed(context, MyRouters.addPostScreen);
                      // Show a dialog when the "Post" button is tapped
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset(
                                      'assets/post_icon.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ), // Add your cancel icon here
                                  TextButton(
                                    onPressed: () {
                                      // Close the dialog
                                      Navigator.pushNamed(
                                          context, MyRouters.addPostScreen);
                                    },
                                    child: const Text("Add a Post"),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.blue,
                                    ),
                                    // child: Image.asset(
                                    //   'assets/post_icon.png',
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ), // Add your post icon here
                                  TextButton(
                                    onPressed: () {
                                      // Perform the post action here
                                      // Close the dialog
                                      Navigator.of(context).pop();
                                      // You can add your post logic here
                                    },
                                    child: const Text("Shared via"),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                    width: 50,
                                  ), // Add your post icon here
                                  TextButton(
                                    onPressed: () {
                                      // Perform the post action here
                                      // Close the dialog
                                      Navigator.pushNamed(
                                          context, MyRouters.recentPostScreen);
                                      // You can add your post logic here
                                    },
                                    child: const Text("List of Posts"),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/post_icon.png',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Post",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )

                // Container(
                //     alignment: FractionalOffset.centerLeft,
                //     height: 80.0,
                //     padding: const EdgeInsets.all(20.0),
                //     child: GestureDetector(
                //       onTap: () {
                //         Navigator.pushNamed(context, MyRouters.addPostScreen);
                //       },
                //       child: Row(
                //         children: [
                //           Image.asset(
                //             // color: Colors.blue,
                //             'assets/post_icon.png',
                //             fit: BoxFit.cover,
                //           ),
                //           SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             "Post",
                //             style: TextStyle(
                //                 color: Colors.blue,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.bold),
                //           )
                //         ],
                //       ),
                //     )),
              ],
            ),
          ),
        ],
      ),
      DealScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xff9A9D9F),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
              label: "Community",
              icon: _currentIndex == 0
                  ? Image.asset(
                      'assets/community_icon.png',
                      height: 24,
                      width: 24,
                    )
                  : Image.asset(
                      'assets/community_icon.png',
                      height: 24,
                      width: 24,
                    )),
          BottomNavigationBarItem(
              label: "Mssg",
              icon: _currentIndex == 1
                  ? Image.asset(
                      'assets/mssg.png',
                      height: 24,
                      width: 24,
                    )
                  : Image.asset(
                      'assets/mssg.png',
                      height: 24,
                      width: 24,
                    )),
          BottomNavigationBarItem(
              label: "Map",
              icon: _currentIndex == 2
                  ? Image.asset(
                      'assets/map_icon.png',
                      height: 24,
                      width: 24,
                    )
                  : Image.asset(
                      'assets/map_icon.png',
                      height: 24,
                      width: 24,
                    )),
          BottomNavigationBarItem(
            label: "Add",
            icon: _currentIndex == 3
                ? Image.asset(
                    'assets/add_icon.png',
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    'assets/add_icon.png',
                    height: 24,
                    width: 24,
                  ),
          ),
          BottomNavigationBarItem(
            label: "Deals",
            icon: _currentIndex == 4
                ? Image.asset(
                    'assets/deal_icon.png',
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    'assets/deal_icon.png',
                    height: 24,
                    width: 24,
                  ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
