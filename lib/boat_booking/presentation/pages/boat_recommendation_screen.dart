import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/data/model/boat_booking_params.dart';
import 'package:kot/boat_booking/data/model/boat_listing.dart';
import 'package:kot/boat_booking/data/model/boat_type.dart';
import 'package:kot/boat_booking/presentation/widgets/card2.dart';
import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

import '../../../core/network/api_provider.dart';

import 'package:kot/core/app_export.dart';
import 'package:kot/widgets/app_bar/appbar_image.dart';
import 'package:kot/widgets/app_bar/appbar_subtitle.dart';
import 'package:kot/widgets/app_bar/custom_app_bar.dart';
import 'package:kot/widgets/custom_elevated_button.dart';
import 'package:kot/widgets/custom_search_view.dart';
import 'package:kot/widgets/custom_text_form_field.dart';

class BoatRecommendationScreen extends StatefulWidget {
  final BoatBookingParams boatBookingParams;
  const BoatRecommendationScreen(this.boatBookingParams, {super.key});

  @override
  State<BoatRecommendationScreen> createState() =>
      _BoatRecommendationScreenState();
}

class _BoatRecommendationScreenState extends State<BoatRecommendationScreen> {
  List<BoatListingData>? boatTypeList;
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
        // bottomNavigationBar: CommonBottom(selectedIndex: 3),
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: getVerticalSize(542),
                                  width: double.maxFinite,
                                  padding: getPadding(left: 13, right: 13),
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgMotorboat1,
                                            height: getVerticalSize(258),
                                            width: getHorizontalSize(345),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(12)),
                                            alignment: Alignment.topCenter),
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 8,
                                                    top: 153,
                                                    right: 11),
                                                decoration: AppDecoration
                                                    .outline
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder12),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 13,
                                                              top: 21),
                                                          child: Text(
                                                              "Motor Boat",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 15, top: 5),
                                                          child: Row(children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgLocation,
                                                                height:
                                                                    getVerticalSize(
                                                                        15),
                                                                width:
                                                                    getHorizontalSize(
                                                                        10)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                    "Hyderabad",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodySmall))
                                                          ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 13, top: 6),
                                                          child: Row(children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgActiveuser2,
                                                                height:
                                                                    getSize(15),
                                                                width:
                                                                    getSize(15),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            2)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 6,
                                                                        bottom:
                                                                            2),
                                                                child: Text(
                                                                    "6",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodySmall)),
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgBoat2,
                                                                height:
                                                                    getSize(15),
                                                                width:
                                                                    getSize(15),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            11,
                                                                        top: 1,
                                                                        bottom:
                                                                            1)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            12,
                                                                        top: 2),
                                                                child: Text(
                                                                    "Without Skipper",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodySmall))
                                                          ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 14, top: 7),
                                                          child: Row(children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgStar,
                                                                height:
                                                                    getVerticalSize(
                                                                        11),
                                                                width:
                                                                    getHorizontalSize(
                                                                        10),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            4)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 9,
                                                                        bottom:
                                                                            1),
                                                                child: Text(
                                                                    "5.0",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodySmall)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 7,
                                                                        bottom:
                                                                            1),
                                                                child: Text(
                                                                    "(7)",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodySmall)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            10,
                                                                        top: 1),
                                                                child: Text(
                                                                    "Super Owner",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodySmall))
                                                          ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 19, top: 6),
                                                          child: Text(
                                                              "From 1503 per day",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      CustomElevatedButton(
                                                          text: "Continue",
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                                context,
                                                                MyRouters
                                                                    .BOAT_DETAILS,
                                                                arguments: widget
                                                                    .boatBookingParams);
                                                          },
                                                          margin: getMargin(
                                                              left: 18,
                                                              top: 13,
                                                              right: 22),
                                                          buttonStyle: CustomButtonStyles
                                                              .fillPrimary
                                                              .copyWith(
                                                                  fixedSize: MaterialStateProperty.all<Size>(Size(
                                                                      double
                                                                          .maxFinite,
                                                                      getVerticalSize(
                                                                          38)))),
                                                          buttonTextStyle:
                                                              CustomTextStyles
                                                                  .titleSmallOnSecondary,
                                                          alignment:
                                                              Alignment.center)
                                                    ])))
                                      ]))
                            ])),
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
}
