import 'package:flutter/material.dart';
import 'package:kot/boat_booking/presentation/pages/boat_booking_screen2.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

import '../../core/utils/size_utils.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.height,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  double height;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: Container(
        height: 50,
        color: primaryColor,
        width: double.infinity,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 23,
                )),
            Text(
              "Deals",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRouters.profileScreen);
              },
              child: const CircleAvatar(
                radius: 13,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 24, color: Colors.blue),
              ),
            ),
            SizedBox(width: 10),
            Align(
              // alignment: Alignment.topRight,
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
            SizedBox(width: 5),
          ],
        ),
      ),
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height,
      );
}
