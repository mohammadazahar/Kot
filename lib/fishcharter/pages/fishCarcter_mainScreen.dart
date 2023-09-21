import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/core/utils/image_constant.dart';
import 'package:kot/core/utils/size_utils.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/custom_image_view.dart';

import 'imageListCard.dart';

class FishCharterMainScreen extends StatefulWidget {
  const FishCharterMainScreen({super.key});

  @override
  State<FishCharterMainScreen> createState() => _FishCharterMainScreenState();
}

class _FishCharterMainScreenState extends State<FishCharterMainScreen> {
  TextEditingController _searchController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //   bottomNavigationBar: CommonBottom(selectedIndex: 3),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/app_background.svg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
                Container(
                  height: 250,
                  color: Colors.white,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200.0, // Adjust the height as needed
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors
                                      .white, // Set the border color to white
                                  width: 2.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/fish_catcher.png'), // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: const TextStyle(
                                                color: Colors.white),
                                            controller: _searchController,
                                            decoration: const InputDecoration(
                                              labelText: 'where to',
                                              labelStyle: TextStyle(
                                                  color: Colors.white),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.calendar_today,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            //_selectDate(context);
                                          },
                                        ),
                                        Text(
                                          '${_selectedDate.toLocal()}'
                                              .split(' ')[0],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                              context,
                                              MyRouters.fishCharSearchScreen,
                                            );
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue),
                                          ),
                                          child: const Center(
                                            child: Text("Search"
                                                ""),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 10),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/star.svg"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "4.94 / 5 Average Review Score",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/team_available.svg"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Team of Experts Available 24/7",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/cloud_fishcatcher.svg"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "100% Weather Guarantee",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/lock_licensed.svg"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Licensed and Insured Guides",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "  Browse by location, species, or trip type",
                              // Text",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRouters.fishcharterDetail);
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 1,
                                width: MediaQuery.of(context).size.width,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        2, // Number of columns in the grid
                                    crossAxisSpacing:
                                        10.0, // Spacing between columns
                                    mainAxisSpacing:
                                        10.0, // Spacing between rows
                                  ),
                                  itemCount: 5, // Number of items in the grid
                                  itemBuilder: (context, index) {
                                    // Create a colored box for each grid item
                                    return const ImageListCard(
                                      title: "Red Snapper",
                                      image: "assets/fish_catcher.png",
                                    );
                                  },
                                ),
                              ),
                            )
                          ]),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
