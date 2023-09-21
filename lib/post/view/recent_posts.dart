import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/deals/presentation/widgets/custom_button.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/post/controllers/post_controller.dart';
import 'package:kot/post/view/add_post.dart';
import 'package:kot/post/widget/card_msg.dart';
import 'package:kot/toastHelper.dart';

class RecentPosts extends StatelessWidget {
  RecentPosts({super.key});
  PostController controller = Get.put<PostController>(PostController());
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 80, right: 25.0, left: 20.0, bottom: 100),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/img_profile14.png",
                              width: 100,
                              height: 143,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text("user1",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: CustomColor.colorPrimary))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFilledButton(
                            elevation: 0,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRouters.addPostScreen);
                            },
                            child: const Text(
                              'Add Post',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )

                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.pushNamed(
                          //         context, MyRouters.addPostScreen);
                          //     //     Get.to(() => AddPost());
                          //   },
                          //   child: const Text('Add Post',
                          //       style: TextStyle(
                          //           fontSize: 16,
                          //           color: CustomColor.colorPrimary)),
                          // ),
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Recent Posts',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: CustomColor.colorPrimary)),
                          ),
                          Obx(() {
                            return postCard(
                                context,
                                controller.postList.value.data![
                                    controller.postList.value.data!.length -
                                        1]);
                          }),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'All Posts',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: CustomColor.colorPrimary),
                            ),
                          ),
                          Obx(() {
                            return Container(
                              height: 250,
                              child: ListView.builder(
                                  itemCount:
                                      controller.postList.value.data!.length,
                                  itemBuilder: (context, index) => postCard(
                                      context,
                                      controller.postList.value.data![index])),
                            );
                          }),
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
