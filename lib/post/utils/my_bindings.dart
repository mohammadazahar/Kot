import 'package:get/get.dart';
import 'package:kot/post/controllers/post_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(PostController());
  }
}
