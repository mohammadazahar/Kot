import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kot/deals_new/components/oders_detailed.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/custom_clipper.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: const CommonBottom(selectedIndex: 0),
      body: SafeArea(
          child: Container(
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage("assets/app_background.svg"),
        //           fit: BoxFit.fitWidth)),
        child: Stack(
          children: [
            CustomClipBackground(height: 200, color: Colors.blue),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Order History",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRouters.profileScreen);
                          },
                          child: const CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 24,
                              color: Color(0xFF74B9FF),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
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
                    const SizedBox(height: 200),
                    for (int i = 0; i < 5; i++)
                      InkWell(
                        onTap: () {
                          Get.to(() => OrderDetailsPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Image.network(
                                'https://source.unsplash.com/random',
                                width: 50,
                                height: 50,
                              ),
                              title: const Text(
                                'Your Product will be delivered soon',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Delivered by 12/12/2021',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    // star rating
                                    SizedBox(
                                      height: 10,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return const Icon(
                                            Icons.star_rounded,
                                            color: Colors.yellow,
                                            size: 15,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
