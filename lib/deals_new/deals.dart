import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/deals_new/components/daily_deals.dart';
import 'package:kot/deals_new/components/product_detail.dart';
import 'package:kot/deals_new/controller/select_category_controller.dart';
import 'package:kot/deals_new/widgets/ad_banner/ad_banner.dart';
import 'package:kot/deals_new/widgets/custom_button.dart';
import 'package:kot/deals_new/widgets/custom_textfield.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/app_bar/custom_app_bar.dart';
import 'package:kot/widgets/custom_clipper.dart';

class DealScreen extends StatelessWidget {
  const DealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();

    return Scaffold(
      appBar: CustomAppBar(
        height: 50,
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                CustomClipBackground(
                  height: 150,
                  color: Colors.blue,
                ),
              ],
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchWidget(),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            //
            SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 90),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 43,
                  child: const Center(
                    child: Text(
                      'BEST DEALS',
                      style: TextStyle(
                        color: const Color(0xFF74B9FF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 100),
                const AdBanners(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select category',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF74B9FF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  final categories = categoryController.categories.value;
                  if (categories == null) {
                    print('API call in progress...');
                    return CircularProgressIndicator();
                  } else if (categories.data.isEmpty) {
                    return Text('No product categories available.');
                  } else {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: Wrap(
                        clipBehavior: Clip.antiAlias,
                        alignment: WrapAlignment.spaceBetween,
                        runSpacing: 10,
                        textDirection: TextDirection.ltr,
                        verticalDirection: VerticalDirection.down,
                        children: List.generate(
                          categories.data.length,
                          (index) {
                            final categoryName = categories.data[index].name;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: SizedBox(
                                width: 130,
                                height: 40,
                                child: CustomFilledButton(
                                  borderRadius: 15,
                                  onPressed: () {
                                    final categoryId =
                                        categories.data[index].id;
                                    Get.to(() =>
                                        ProductDetail(categoryId: categoryId));
                                  },
                                  child: Text(categoryName),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Daily Deals',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF74B9FF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                DailyDealsPage()
              ],
            )),
          ],
        ),
      ),
    );
  }
}
