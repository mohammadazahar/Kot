import 'package:get/get.dart';
import 'package:kot/deals_new/model/bestDeal_model.dart';
import 'package:kot/deals_new/repository/best_deals_service.dart';

class BestDealsController extends GetxController {
  final BestDealsService apiService = BestDealsService();
  var bestDeals = BestDeals(data: [], message: '', total: 0).obs;

  @override
  void onInit() {
    super.onInit();
    fetchBestDeals();
  }

  Future<void> fetchBestDeals() async {
    try {
      final Map<String, dynamic> responseData =
          await apiService.fetchBestDeals();
      final bestDealsData = BestDeals.fromJson(responseData);
      bestDeals.value = bestDealsData;
    } catch (e) {
      // Handle error here
      print('Error fetching best deals: $e');
    }
  }
}
