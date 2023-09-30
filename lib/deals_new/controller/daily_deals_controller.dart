import 'package:get/get.dart';
import 'package:kot/deals_new/model/daily_dealsmodel.dart';
import 'package:kot/deals_new/repository/daily_Deals_service.dart';

class DailyDealsController extends GetxController {
  final DailyDealsService _apiService = DailyDealsService();
  Rx<DailyDeals?> dailyDeals = Rx<DailyDeals?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchDailyDeals();
  }

  Future<void> fetchDailyDeals() async {
    try {
      final jsonData = await _apiService.fetchDailyDeals();
      final dailyDealsData = DailyDeals.fromJson(jsonData);
      dailyDeals.value = dailyDealsData;
    } catch (e) {
      print('Error fetching daily deals: $e');
    }
  }
}
