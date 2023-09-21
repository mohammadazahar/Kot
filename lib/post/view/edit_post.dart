import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kot/post/controllers/post_controller.dart';

class EditPost extends StatelessWidget {
  EditPost({super.key});
  PostController controller = Get.find<PostController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Post'),
          actions: [
            IconButton(
                onPressed: () async {
                  await controller.updatePost();
                },
                icon: const Icon(Icons.done))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  singlePostCard(),
                ],
              ),
            ),
            _addPostInput(),
          ],
        ));
  }

  Widget singlePostCard() {
    return Card(
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                "assets/images/img_profile14.png",
                width: 100,
                height: 143,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Penny Sarro'),
            Obx(() {
              return Text(controller.selectedData.value.message!);
            }),
          ],
        )
      ]),
    );
  }

  Widget _addPostInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.mood),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: controller.msgTextController,
              decoration: const InputDecoration(
                hintText: 'Edit Your Post',
                border: InputBorder.none,
              ),
              // Handle text input
            ),
          ),
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.video_camera_front),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
