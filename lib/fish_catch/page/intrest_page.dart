import 'package:flutter/material.dart';
import 'package:kot/fish_catch/fish_catch_dialog1.dart';
import 'package:kot/fish_catch/model/interst_model.dart';
import 'package:kot/fish_catch/repository/interst_repo.dart';
import 'package:kot/fish_catch/weather_card.dart';
import 'package:kot/my_routes.dart';
import 'package:sizer/sizer.dart';

import '../blue_selector.dart';

class IntrestPage extends StatefulWidget {
  const IntrestPage({super.key});

  @override
  State<IntrestPage> createState() => _IntrestPageState();
}

class _IntrestPageState extends State<IntrestPage> {
  List<InterestDatum> data = [];
  Future<void> getAllInterestDetails() async {
    List<InterestDatum>? result = await InterestRepository().getCallAllInterestApi(
        id: "64e462d9530cf30c090b69bb",
        name: "Common Crapp",
        image:
            "https://tpwd.texas.gov/fishboat/fish/images/inland_species/carpbig.jpg");
    if (result != null) {
      setState(() {
        data = result;
      });
    }
  }

  @override
  void initState() {
    getAllInterestDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset('assets/icons/bg_shap.png', fit: BoxFit.fill)),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: double.infinity,
                child: Image.asset('assets/icons/roted_fish.png',
                    fit: BoxFit.fill)),
          )),
          Positioned(
            top: 12.h,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 96.w,
              height: 50.h,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                color: Colors.white,
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Time to customize your interest",
                      style: TextStyle(
                        color: Color(0xFF74B9FF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 8.0, // Spacing between columns
                          mainAxisSpacing: 8.0,
                          // Spacing between rows
                        ),
                        itemCount: 6, // data.length
                        itemBuilder: (BuildContext context, int index) {
                          return BlueSelector(
                            text: "Fishing", //data[index].name!
                            call: () {
                              showDetailDialog(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     BlueSelector(
          //       text:  "Fishing",
          //       call: () {
          //         showDetailDialog(context);
          //       },
          //     ),
          //     SizedBox(
          //       width: 10.w,
          //     ),
          //     BlueSelector(
          //       text: "Diving",
          //       call: () {
          //         showDetailDialog(context);
          //       },
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     BlueSelector(
          //       text: "Tournaments",
          //       call: () {
          //         showDetailDialog(context);
          //       },
          //     ),
          //     SizedBox(
          //       width: 10.w,
          //     ),
          //     BlueSelector(
          //       text: "Fishing News",
          //       call: () {
          //         showDetailDialog(context);
          //       },
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     BlueSelector(
          //       text: "Destinations",
          //       call: () {
          //         showDetailDialog(context);
          //       },
          //     ),
          //     SizedBox(
          //       width: 10.w,
          //     ),
          //     BlueSelector(
          //       text: "How to catch",
          //       call: () {
          //         showDetailDialog(context);
          //       },
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     BlueSelector(
          //       text: "Outdoors",
          //       call: () {
          //         showDetailDialog1(context);
          //       },
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

  void showDetailDialog(BuildContext context) {
    Navigator.pop(context);
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) => const Center(
              child: FishCatchDialog(),
            ));
  }

  void showDetailDialog1(BuildContext context) {
    Navigator.pop(context);
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) => const Center(
              child: WeatherCard(),
            ));
  }
}
