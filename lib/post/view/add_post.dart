import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/post/controllers/post_controller.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});

  final controller =  Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Post'),
          actions: [
            IconButton(
                onPressed: () async {
                  await controller.addPost();
                },
                icon: const Icon(Icons.done))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  // color: Colors.yellow,
                  ),
            ),
            _addPostInput(),
          ],
        ));
  }

  Widget _addPostInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: CustomColor.colorPrimary,
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
                hintText: 'Add Your Post',
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
