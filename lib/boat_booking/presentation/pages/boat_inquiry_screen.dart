import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/data/model/boat_booking_params.dart';
import 'package:kot/boat_booking/data/model/boat_listing.dart';
import 'package:kot/boat_booking/presentation/widgets/card2.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/core/app_export.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/custom_elevated_button.dart';

import '../../../core/network/api_provider.dart';
import '../../../widgets/custom_outlined_button.dart';

class BoatInquiryScreen extends StatefulWidget {
  final BoatBookingParams boatBookingParams;

  const BoatInquiryScreen(this.boatBookingParams, {super.key});

  @override
  State<BoatInquiryScreen> createState() => _BoatInquiryScreenState();
}

class _BoatInquiryScreenState extends State<BoatInquiryScreen> {
  List<BoatListingData>? boatTypeList;

  int returnOnSameDay = 0;
  int overNight = 0;
  int minutes = 0;
  int groupSizeAdult = 0;
  int totalChildren = 0;
  int senior = 0;
  int infants = 0;

  @override
  void initState() {
    super.initState();
  }

  init() async {
    BoatListing response = await ApiProvider().getBoatList();
    boatTypeList = response.data ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  bottomNavigationBar: CommonBottom(selectedIndex: 3),
        body: Stack(
          children: <Widget>[
            // The containers in the background
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/app_background.svg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
                Container(
                  height: 250,
                  color: Colors.white,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/splash_screen_bg.png",
                        height: 30,
                        width: 30,
                        //  height: MediaQuery.of(context).size.height - 150,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MyRouters.profileScreen);
                        },
                        child: const Icon(
                          Icons.people,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            ToastHelper.showToast("Comming Soon");
                          },
                          child: Icon(
                            Icons.notification_add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    //  key: ConstantsValues.searchKey,
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: SearchWidget(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                        width: double.maxFinite,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: getMargin(left: 9, right: 22),
                                    padding: getPadding(
                                        left: 6, top: 15, right: 6, bottom: 15),
                                    decoration: AppDecoration.outline2.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder12),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(left: 9),
                                              child: Text(
                                                  "How long do you want your trip or rental to be?",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .titleSmallPrimary)),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: customWidgetForRental(
                                                    title: 'Return on same-day',
                                                    value: returnOnSameDay,
                                                    subTitle: 'Hours',
                                                    onTapAdd: () {
                                                      returnOnSameDay++;
                                                      setState(() {});
                                                    },
                                                    onTapRemove: () {
                                                      if (returnOnSameDay !=
                                                          0) {
                                                        returnOnSameDay--;
                                                        setState(() {});
                                                      }
                                                    }),
                                              ),
                                              Expanded(
                                                child: customWidgetForRental(
                                                    title: 'Over Night',
                                                    value: overNight,
                                                    subTitle: 'Hours',
                                                    onTapAdd: () {
                                                      overNight++;
                                                      setState(() {});
                                                    },
                                                    onTapRemove: () {
                                                      if (overNight != 0) {
                                                        overNight--;
                                                        setState(() {});
                                                      }
                                                    }),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: customWidgetForRental(
                                                    title: '',
                                                    value: minutes,
                                                    subTitle: 'Minutes',
                                                    onTapAdd: () {
                                                      minutes++;
                                                      setState(() {});
                                                    },
                                                    onTapRemove: () {
                                                      if (minutes != 0) {
                                                        minutes--;
                                                        setState(() {});
                                                      }
                                                    }),
                                              ),
                                              const Expanded(child: SizedBox())
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: customWidgetForRental(
                                                    title: 'Group Size',
                                                    value: groupSizeAdult,
                                                    subTitle: 'Adult',
                                                    onTapAdd: () {
                                                      groupSizeAdult++;
                                                      setState(() {});
                                                    },
                                                    onTapRemove: () {
                                                      if (groupSizeAdult != 0) {
                                                        groupSizeAdult--;
                                                        setState(() {});
                                                      }
                                                    }),
                                              ),
                                              Expanded(
                                                child: customWidgetForRental(
                                                    title: 'Total',
                                                    value: totalChildren,
                                                    subTitle: 'Children',
                                                    onTapAdd: () {
                                                      totalChildren++;
                                                      setState(() {});
                                                    },
                                                    onTapRemove: () {
                                                      if (totalChildren != 0) {
                                                        totalChildren--;
                                                        setState(() {});
                                                      }
                                                    }),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: customWidgetForRental(
                                                    title: '',
                                                    value: senior,
                                                    subTitle: 'Senior',
                                                    onTapAdd: () {
                                                      senior++;
                                                      setState(() {});
                                                    },
                                                    onTapRemove: () {
                                                      if (senior != 0) {
                                                        senior--;
                                                        setState(() {});
                                                      }
                                                    }),
                                              ),
                                              Expanded(
                                                child: customWidgetForRental(
                                                    title: '',
                                                    value: infants,
                                                    subTitle: 'Infants',
                                                    onTapAdd: () {
                                                      infants++;
                                                      setState(() {});
                                                    },
                                                    onTapRemove: () {
                                                      if (infants != 0) {
                                                        infants--;
                                                        setState(() {});
                                                      }
                                                    }),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          CustomElevatedButton(
                                              text: "Continue",
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    MyRouters.BOAT_Calender_new,
                                                    arguments: widget
                                                        .boatBookingParams);
                                              },
                                              margin: getMargin(
                                                  left: 18, top: 13, right: 22),
                                              buttonStyle: CustomButtonStyles
                                                  .fillPrimary
                                                  .copyWith(
                                                      fixedSize:
                                                          MaterialStateProperty
                                                              .all<Size>(Size(
                                                                  double
                                                                      .maxFinite,
                                                                  getVerticalSize(
                                                                      38)))),
                                              buttonTextStyle: CustomTextStyles
                                                  .titleSmallOnSecondary,
                                              alignment: Alignment.center)
                                        ]))
                              ]),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCardList(
    BuildContext context,
  ) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: boatTypeList!.length,
        itemBuilder: (context, index) {
          BoatListingData data = boatTypeList![index];
          return SizedBox(
            height: 200,
            child: InkWell(
              onTap: () {
                widget.boatBookingParams.boatId = data.id ?? "";
                Navigator.pushNamed(context, MyRouters.BOAT_Calender,
                    arguments: widget.boatBookingParams);
              },
              child: Card2(
                title: data.name ?? "",
                image: data.image?.first ?? "",
                isDynamic: true,
              ),
            ),
          );
        });
  }

  void onTapArrowleft3(BuildContext context) {}

  Widget customWidgetForRental(
      {required String title,
      required String subTitle,
      void Function()? onTapRemove,
      void Function()? onTapAdd,
      required int value}) {
    return Column(
      children: [
        Text(title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: theme.textTheme.titleSmall),
        if (title.isNotEmpty) const SizedBox(height: 10),
        Text(subTitle,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: theme.textTheme.titleSmall),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTapRemove,
              child: Container(
                height: getSize(30),
                width: getSize(30),
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(getHorizontalSize(15)),
                    border: Border.all(
                        color: theme.colorScheme.primary,
                        width: getHorizontalSize(1))),
                child: Text("-",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall),
              ),
            ),
            Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 12,
                    offset: const Offset(
                        0, 2), // Adjust the shadow offset as needed
                  ),
                ],
              ),
              child: CustomOutlinedButton(
                  text: "$value",
                  buttonStyle: CustomButtonStyles.outlineOnPrimaryContainer
                      .copyWith(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                              getHorizontalSize(69), getVerticalSize(42)))),
                  buttonTextStyle: theme.textTheme.titleSmall!),
            ),
            GestureDetector(
              onTap: onTapAdd,
              child: Container(
                height: getSize(30),
                width: getSize(30),
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(getHorizontalSize(15)),
                    border: Border.all(
                        color: theme.colorScheme.primary,
                        width: getHorizontalSize(1))),
                child: Text("+",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
