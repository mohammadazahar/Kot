import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/post/controllers/post_controller.dart';
import 'package:kot/post/view/edit_post.dart';

import '../models/post_list.dart';

Widget postCard(BuildContext context, Datum data) {
  PostController controller = Get.find<PostController>();
  DateTime created = data.createdAt!;
  DateTime curr = DateTime.now();
  Duration diff = curr.difference(created);
  String duration = '';
  if (diff.inHours < 1) {
    duration = '${diff.inMinutes} min';
  } else if (diff.inHours < 24) {
    duration = '${diff.inHours} h';
  } else {
    duration = '${diff.inDays} days';
  }
  return Card(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.message!),
              Text(duration),
            ],
          ),
        ),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Image.asset('assets/fishcatch_img.png', fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite, color: CustomColor.colorPrimary),
                        Text('112'),
                      ],
                    ),
                    Icon(Icons.chat_bubble, color: CustomColor.colorPrimary),
                    Icon(Icons.share),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    controller.setMessage(
                      data,
                    );
                    Navigator.pushNamed(context, MyRouters.editPostScreen);
                    //  Get.to(() => EditPost());
                  },
                  child: Icon(Icons.edit, color: CustomColor.colorPrimary)),
            ],
          ),
        ),
      ],
    ),
  );
}
