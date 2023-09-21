import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kot/post/data/post_api.dart';
import 'package:kot/post/models/post_list.dart';

class PostController extends GetxController {
  var postList = PostList().obs;
  TextEditingController msgTextController = TextEditingController();
  late CameraController controller;
  var selectedMessageId = '';
  late var selectedData = Datum().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //  controller = CameraController(cameras[0], ResolutionPreset.max);
    // controller.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }

    // }).catchError((Object e) {
    //   if (e is CameraException) {
    //     switch (e.code) {
    //       case 'CameraAccessDenied':
    //         // Handle access errors here.
    //         break;
    //       default:
    //         // Handle other errors here.
    //         break;
    //     }
    //   }
    // });
    fetchAllPost();
  }

  fetchAllPost() async {
    postList.value = await PostAPI.fetchAllPost();
  }

  addPost() async {
    if (msgTextController.text.isNotEmpty) {
      await PostAPI.addPost(msgTextController.text);
    }
  }

  updatePost() async {
    if (selectedMessageId != '' && msgTextController.text.isNotEmpty) {
      await PostAPI.updatePost(
          {"_id": selectedMessageId, "message": msgTextController.text});
      selectedMessageId = '';
    }
  }

  setMessage(Datum data) {
    selectedData.value = data;
    selectedMessageId = data.id!;
  }
}
