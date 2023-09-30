import 'package:get/get.dart';
import 'package:kot/deals_new/model/select_category_model.dart';
import 'package:kot/deals_new/repository/selectcategory_service.dart';

class CategoryController extends GetxController {
  late final CategoryApiService _apiService;
  Rx<SelectCategory?> categories = Rx<SelectCategory?>(null);

  @override
  void onInit() {
    super.onInit();
    _apiService = Get.find<CategoryApiService>();
    fetchAllProductCategories();
  }

  Future<void> fetchAllProductCategories() async {
    try {
      final response = await _apiService.fetchAllProductCategories();
      print('Parsed Categories: $categories');
      categories.value = response;
    } catch (e) {
      print('Error fetching product categories: $e');
    }
  }
}
