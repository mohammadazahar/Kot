import 'package:get/get.dart';

import 'package:kot/deals_new/controller/best_deals_controller.dart';
import 'package:kot/deals_new/controller/cart_controller.dart';
import 'package:kot/deals_new/controller/cart_page_controller.dart';
import 'package:kot/deals_new/controller/daily_deals_controller.dart';
import 'package:kot/deals_new/repository/selectcategory_service.dart';

import '../../deals_new/controller/select_category_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Add the BestDealsController
    Get.lazyPut<BestDealsController>(() => BestDealsController(), fenix: true);
    Get.put(CategoryApiService());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => DailyDealsController());
    Get.lazyPut(() => GetCartController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => GetCartController());
  }
}
