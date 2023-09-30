import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kot/boat_booking/presentation/pages/boat_booking_screen2.dart';
import 'package:kot/deals_new/components/product_detail.dart';
import 'package:kot/deals_new/controller/daily_deals_controller.dart';
import 'package:kot/my_routes.dart';

class DailyDealsPage extends StatelessWidget {
  const DailyDealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dailyDealsController = Get.find<DailyDealsController>();

    return Obx(() {
      final dailyDeals = dailyDealsController.dailyDeals.value;

      if (dailyDeals == null) {
        return Center(child: CircularProgressIndicator());
      } else if (dailyDeals.data.isEmpty) {
        return Text('No daily deals available.');
      } else {
        return Padding(
          padding: const EdgeInsets.only(left: 23, top: 5),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  dailyDeals.data.length, // Use the actual count of items
              itemBuilder: (context, i) {
                final deal = dailyDeals.data[i];

                return GestureDetector(
                  onTap: () {
                    final categoryId = deal.id;
                    Get.to(() => ProductDetail(categoryId: categoryId));
                  },
                  child: Container(
                    width: 182,
                    height: 138,
                    margin: EdgeInsets.only(
                      left: i == 0 ? 0 : 10,
                      right: i == dailyDeals.data.length - 1 ? 0 : 10,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 1,
                          top: 18,
                          child: Container(
                            width: 182,
                            height: 125,
                            decoration: ShapeDecoration(
                              color: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment(0, 0.9),
                              child: Text(
                                deal.categoryName, // Display categoryName here
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 182,
                            height: 117,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  deal.image[0], // Display image here
                                ),
                                fit: BoxFit.cover,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    });
  }
}
