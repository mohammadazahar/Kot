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
import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/app_bar/appbar_image.dart';
import 'package:kot/core/app_export.dart';
import 'package:kot/widgets/app_bar/appbar_image.dart';
import 'package:kot/widgets/app_bar/custom_app_bar.dart';
import 'package:kot/widgets/custom_elevated_button.dart';
import 'package:kot/widgets/custom_radio_button.dart';
import 'package:kot/widgets/custom_search_view.dart';
import 'package:kot/widgets/custom_switch.dart';
import 'package:kot/widgets/custom_text_form_field.dart';

import '../widgets/chip_view_group.dart';

class BoatQueryScreenTwo extends StatefulWidget {
  final BoatBookingParams boatBookingParams;
  const BoatQueryScreenTwo(this.boatBookingParams, {super.key});

  @override
  State<BoatQueryScreenTwo> createState() => _BoatQueryScreenTwoState();
}

class _BoatQueryScreenTwoState extends State<BoatQueryScreenTwo> {
  String radioGroup = "";

  String radioGroup1 = "";

  String radioGroup2 = "";

  String radioGroup3 = "";

  String radioGroup4 = "";

  String radioGroup5 = "";

  bool isSelectedSwitch = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //    bottomNavigationBar: CommonBottom(selectedIndex: 3),
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
                    child: Container(
                      height: MediaQuery.of(context).size.height * 2,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.white,
                        elevation: 4.0,
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                        SizedBox(
                                            height: getVerticalSize(600),
                                            width: getHorizontalSize(360),
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              right: 70,
                                                              bottom: 15),
                                                          child: Text("Save",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .bodySmallOnPrimaryContainer))),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          padding: getPadding(
                                                              left: 12,
                                                              top: 19,
                                                              right: 12,
                                                              bottom: 19),
                                                          decoration: AppDecoration
                                                              .outline
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder12),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            44),
                                                                    width:
                                                                        getHorizontalSize(
                                                                            302),
                                                                    margin:
                                                                        getMargin(
                                                                            top:
                                                                                2),
                                                                    child: Stack(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        children: [
                                                                          Align(
                                                                              alignment: Alignment.topLeft,
                                                                              child: Padding(padding: getPadding(left: 4), child: Text("Dates", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.labelLarge))),
                                                                          Align(
                                                                              alignment: Alignment.center,
                                                                              child: SizedBox(width: getHorizontalSize(302), child: Text("How long do you want to be out on the water?", maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: CustomTextStyles.titleMedium18)))
                                                                        ])),
                                                                Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            39),
                                                                    width:
                                                                        getHorizontalSize(
                                                                            322),
                                                                    margin:
                                                                        getMargin(
                                                                            top:
                                                                                8),
                                                                    child: Stack(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgGroup9793,
                                                                              height: getVerticalSize(20),
                                                                              width: getHorizontalSize(322),
                                                                              alignment: Alignment.bottomCenter),
                                                                          Align(
                                                                              alignment: Alignment.topLeft,
                                                                              child: Padding(padding: getPadding(left: 2, top: 1), child: Text("1", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.bodyLarge))),
                                                                          Align(
                                                                              alignment: Alignment.topRight,
                                                                              child: Padding(padding: getPadding(right: 8), child: Text("Multi-Day", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.bodyLarge)))
                                                                        ])),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left: 1,
                                                                        top:
                                                                            28),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                              width: getHorizontalSize(90),
                                                                              margin: getMargin(bottom: 1),
                                                                              padding: getPadding(left: 16, top: 11, right: 16, bottom: 11),
                                                                              decoration: AppDecoration.txtOutline2,
                                                                              child: Text("1-2 Hours", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.labelLarge)),
                                                                          Container(
                                                                              width: getHorizontalSize(90),
                                                                              margin: getMargin(top: 1),
                                                                              padding: getPadding(left: 14, top: 10, right: 14, bottom: 10),
                                                                              decoration: AppDecoration.txtOutline3,
                                                                              child: Text("2-4 Hours", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: CustomTextStyles.labelLargePrimary)),
                                                                          Container(
                                                                              width: getHorizontalSize(90),
                                                                              margin: getMargin(top: 1),
                                                                              padding: getPadding(left: 14, top: 10, right: 14, bottom: 10),
                                                                              decoration: AppDecoration.txtOutline3,
                                                                              child: Text("4-8 Hours", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: CustomTextStyles.labelLargePrimary))
                                                                        ])),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                28),
                                                                    child: Wrap(
                                                                        runSpacing:
                                                                            getVerticalSize(
                                                                                5),
                                                                        spacing:
                                                                            getHorizontalSize(
                                                                                5),
                                                                        children: List<Widget>.generate(
                                                                            3,
                                                                            (index) =>
                                                                                const ChipviewgroupthItemWidget()))),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                14,
                                                                            top:
                                                                                24),
                                                                        child: Text(
                                                                            "Do you need a captain included?",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.titleMedium))),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Padding(
                                                                        padding: getPadding(left: 19, top: 16),
                                                                        child: Row(children: [
                                                                          Container(
                                                                              height: getSize(15),
                                                                              width: getSize(15),
                                                                              margin: getMargin(top: 2, bottom: 2),
                                                                              decoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(getHorizontalSize(7)))),
                                                                          Padding(
                                                                              padding: getPadding(left: 4),
                                                                              child: Text("Yes", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.bodyLarge)),
                                                                          Spacer(),
                                                                          Container(
                                                                              height: getSize(15),
                                                                              width: getSize(15),
                                                                              margin: getMargin(top: 2, bottom: 2),
                                                                              decoration: BoxDecoration(color: appTheme.blueGray100, borderRadius: BorderRadius.circular(getHorizontalSize(7)))),
                                                                          Padding(
                                                                              padding: getPadding(left: 6),
                                                                              child: Text("No", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.bodyLarge))
                                                                        ]))),
                                                                Container(
                                                                    width:
                                                                        getHorizontalSize(
                                                                            306),
                                                                    margin: getMargin(
                                                                        left:
                                                                            14,
                                                                        top: 17,
                                                                        right:
                                                                            15),
                                                                    child: Text(
                                                                        "Are you more interested in affordability or luxury?",
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: theme
                                                                            .textTheme
                                                                            .titleMedium)),
                                                                CustomElevatedButton(
                                                                    text:
                                                                        "Affordable ",
                                                                    margin: getMargin(
                                                                        top:
                                                                            21),
                                                                    buttonStyle: CustomButtonStyles.outlineOnPrimary.copyWith(
                                                                        fixedSize: MaterialStateProperty.all<Size>(Size(
                                                                            getHorizontalSize(
                                                                                242),
                                                                            getVerticalSize(
                                                                                41)))),
                                                                    buttonTextStyle:
                                                                        CustomTextStyles
                                                                            .bodyLargeOnPrimaryContainer),
                                                                CustomElevatedButton(
                                                                    text:
                                                                        "Luxury",
                                                                    margin: getMargin(
                                                                        top:
                                                                            28),
                                                                    buttonStyle: CustomButtonStyles.outlineOnPrimaryTL12.copyWith(
                                                                        fixedSize: MaterialStateProperty.all<Size>(Size(
                                                                            getHorizontalSize(
                                                                                240),
                                                                            getVerticalSize(
                                                                                41)))),
                                                                    buttonTextStyle:
                                                                        CustomTextStyles
                                                                            .bodyLarge18),
                                                                CustomElevatedButton(
                                                                    text:
                                                                        "Continue",
                                                                    onTap: () {
                                                                      Navigator.pushNamed(
                                                                          context,
                                                                          MyRouters
                                                                              .boatRecommendation,
                                                                          arguments:
                                                                              widget.boatBookingParams);
                                                                    },
                                                                    margin: getMargin(
                                                                        left:
                                                                            18,
                                                                        top: 13,
                                                                        right:
                                                                            22),
                                                                    buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                                                                        fixedSize: MaterialStateProperty.all<Size>(Size(
                                                                            double
                                                                                .maxFinite,
                                                                            getVerticalSize(
                                                                                38)))),
                                                                    buttonTextStyle:
                                                                        CustomTextStyles
                                                                            .titleSmallOnSecondary,
                                                                    alignment:
                                                                        Alignment
                                                                            .center)
                                                              ])))
                                                ])),
                                      ])))
                                ])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
