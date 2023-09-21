import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/data/model/boat_booking_params.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import 'package:kot/core/app_export.dart';
import 'package:kot/widgets/custom_elevated_button.dart';
import 'package:kot/widgets/custom_radio_button.dart';
import 'package:kot/widgets/custom_switch.dart';

class BoatQueryScreen extends StatefulWidget {
  final BoatBookingParams boatBookingParams;
  const BoatQueryScreen(this.boatBookingParams, {super.key});

  @override
  State<BoatQueryScreen> createState() => _BoatQueryScreenState();
}

class _BoatQueryScreenState extends State<BoatQueryScreen> {
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  // Align(
                                                  //     alignment:
                                                  //         Alignment.bottomRight,
                                                  //     child: Padding(
                                                  //         padding: getPadding(
                                                  //             right: 68,
                                                  //             bottom: 15),
                                                  //         child: Text("Save",
                                                  //             overflow:
                                                  //                 TextOverflow
                                                  //                     .ellipsis,
                                                  //             textAlign:
                                                  //                 TextAlign
                                                  //                     .left,
                                                  //             style: CustomTextStyles
                                                  //                 .bodySmallOnSecondary))),
                                                  Expanded(
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Text(
                                                                  "Is your date flexible?",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: CustomTextStyles
                                                                      .titleMedium18)),
                                                          SizedBox(height: 10),
                                                          Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              children: [
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      //   Container(height: getSize(15), width: getSize(15), margin: getMargin(bottom: 4), decoration: BoxDecoration(color: appTheme.blueGray100, borderRadius: BorderRadius.circular(getHorizontalSize(7)))),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topLeft,
                                                                          child: Padding(
                                                                              padding: getPadding(left: 22),
                                                                              child: Text("Flexible", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: CustomTextStyles.bodyLargeBlack900))),
                                                                      const SizedBox(
                                                                          width:
                                                                              10),
                                                                      CustomRadioButton(
                                                                          text:
                                                                              "Flexible",
                                                                          iconSize: getHorizontalSize(
                                                                              15),
                                                                          value:
                                                                              "Flexible",
                                                                          groupValue:
                                                                              radioGroup,
                                                                          textStyle: CustomTextStyles
                                                                              .bodyLargeBlack900,
                                                                          onChange:
                                                                              (value) {
                                                                            setState(() {
                                                                              radioGroup = value;
                                                                            });
                                                                          }),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topLeft,
                                                                          child: Padding(
                                                                              padding: getPadding(left: 0),
                                                                              child: Text("Exact Date", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: CustomTextStyles.bodyLargeBlack900))),
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      CustomRadioButton(
                                                                          text:
                                                                              "Exact",
                                                                          iconSize: getHorizontalSize(
                                                                              15),
                                                                          value:
                                                                              "Exact",
                                                                          groupValue:
                                                                              radioGroup,
                                                                          textStyle: CustomTextStyles
                                                                              .bodyLargeBlack900,
                                                                          onChange:
                                                                              (value) {
                                                                            setState(() {
                                                                              radioGroup = value;
                                                                            });
                                                                          })
                                                                      // Align(
                                                                      //     alignment:
                                                                      //         Alignment
                                                                      //             .topLeft,
                                                                      //     child: Padding(
                                                                      //         padding:
                                                                      //             getPadding(left: 22),
                                                                      //         child: Text("Exact Date", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: CustomTextStyles.bodyLargeBlack900)))
                                                                    ]),
                                                              ]),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 11,
                                                                      top: 30,
                                                                      right: 1),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            bottom:
                                                                                3),
                                                                        child: Text(
                                                                            "Price Per A Day",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                3),
                                                                        child: Text(
                                                                            "0-900",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall))
                                                                  ])),
                                                          Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Container(
                                                                  height:
                                                                      getVerticalSize(
                                                                          20),
                                                                  width:
                                                                      getHorizontalSize(
                                                                          329),
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              1),
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      children: [
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.bottomCenter,
                                                                            child: Padding(padding: getPadding(bottom: 4), child: SizedBox(width: getHorizontalSize(319), child: Divider(height: getVerticalSize(6), thickness: getVerticalSize(6), color: theme.colorScheme.primary)))),
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            child: Container(
                                                                                height: getSize(20),
                                                                                width: getSize(20),
                                                                                decoration: BoxDecoration(color: theme.colorScheme.onSecondary, borderRadius: BorderRadius.circular(getHorizontalSize(10)), boxShadow: [
                                                                                  BoxShadow(color: appTheme.black900.withOpacity(0.25), spreadRadius: getHorizontalSize(2), blurRadius: getHorizontalSize(2), offset: Offset(0, 4))
                                                                                ]))),
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.centerRight,
                                                                            child: Container(
                                                                                height: getSize(20),
                                                                                width: getSize(20),
                                                                                decoration: BoxDecoration(color: theme.colorScheme.onSecondary, borderRadius: BorderRadius.circular(getHorizontalSize(10)), boxShadow: [
                                                                                  BoxShadow(color: appTheme.black900.withOpacity(0.25), spreadRadius: getHorizontalSize(2), blurRadius: getHorizontalSize(2), offset: Offset(0, 4))
                                                                                ])))
                                                                      ]))),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 3,
                                                                      top: 25,
                                                                      right: 6),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                1),
                                                                        child: Text(
                                                                            "Length",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "0ft-72ft",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall))
                                                                  ])),
                                                          Container(
                                                              // height:
                                                              //     getVerticalSize(
                                                              //         21),
                                                              // width:
                                                              //     getHorizontalSize(
                                                              //         331),
                                                              margin: getMargin(
                                                                  left: 9,
                                                                  top: 6),
                                                              child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  children: [
                                                                    CustomImageView(
                                                                        svgPath:
                                                                            ImageConstant
                                                                                .imgGroup9793,
                                                                        height: getVerticalSize(
                                                                            20),
                                                                        width: getHorizontalSize(
                                                                            323),
                                                                        alignment:
                                                                            Alignment.center),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child: Container(
                                                                            height: getSize(20),
                                                                            width: getSize(20),
                                                                            decoration: BoxDecoration(color: theme.colorScheme.onSecondary, borderRadius: BorderRadius.circular(getHorizontalSize(10)), boxShadow: [
                                                                              BoxShadow(color: appTheme.black900.withOpacity(0.25), spreadRadius: getHorizontalSize(2), blurRadius: getHorizontalSize(2), offset: Offset(0, 4))
                                                                            ])))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 7,
                                                                      top: 16),
                                                              child: Row(
                                                                  children: [
                                                                    Stack(
                                                                        alignment:
                                                                            Alignment.centerRight,
                                                                        children: [
                                                                          // Text(
                                                                          //     "0ft-72ft",
                                                                          //     overflow:
                                                                          //     TextOverflow.ellipsis,
                                                                          //     textAlign: TextAlign.left,
                                                                          //     style: theme.textTheme.bodySmall)
                                                                          Align(
                                                                              alignment: Alignment.center,
                                                                              child: CustomRadioButton(
                                                                                  width: getHorizontalSize(321),
                                                                                  text: "Number Of Cabins",
                                                                                  iconSize: getHorizontalSize(20),
                                                                                  value: "Number Of Cabins",
                                                                                  groupValue: radioGroup1,
                                                                                  padding: getPadding(top: 2, bottom: 2),
                                                                                  textStyle: theme.textTheme.bodySmall!,
                                                                                  isRightCheck: true,
                                                                                  onChange: (value) {
                                                                                    radioGroup1 = value;
                                                                                  })),
                                                                          Align(
                                                                              alignment: Alignment.centerRight,
                                                                              child: Padding(padding: getPadding(right: 24), child: Text("-", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.titleLarge))),
                                                                          Text(
                                                                              "+",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: theme.textTheme.titleLarge)
                                                                        ]),
                                                                  ])),
                                                          Row(children: [
                                                            Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child: Padding(
                                                                          padding: getPadding(
                                                                              right:
                                                                                  24),
                                                                          child: Text(
                                                                              "-",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: theme.textTheme.titleLarge))),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: CustomRadioButton(
                                                                          width: getHorizontalSize(321),
                                                                          text: "Number Of People",
                                                                          iconSize: getHorizontalSize(20),
                                                                          value: "Number Of People",
                                                                          groupValue: radioGroup2,
                                                                          padding: getPadding(top: 1, bottom: 1),
                                                                          textStyle: theme.textTheme.bodySmall!,
                                                                          isRightCheck: true,
                                                                          onChange: (value) {
                                                                            radioGroup2 =
                                                                                value;
                                                                          }))
                                                                ]),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            9),
                                                                child: Text(
                                                                    "+",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: theme
                                                                        .textTheme
                                                                        .titleLarge))
                                                          ]),
                                                          Container(
                                                              height:
                                                                  getVerticalSize(
                                                                      26),
                                                              width:
                                                                  getHorizontalSize(
                                                                      359),
                                                              margin: getMargin(
                                                                  top: 4),
                                                              child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child: Container(
                                                                            height: getVerticalSize(25),
                                                                            width: getHorizontalSize(321),
                                                                            margin: getMargin(left: 7),
                                                                            child: Stack(alignment: Alignment.center, children: [
                                                                              Align(alignment: Alignment.centerRight, child: Padding(padding: getPadding(right: 24), child: Text("-", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.titleLarge))),
                                                                              Align(
                                                                                  alignment: Alignment.center,
                                                                                  child: CustomRadioButton(
                                                                                      width: getHorizontalSize(321),
                                                                                      text: "Number Of Births",
                                                                                      iconSize: getHorizontalSize(20),
                                                                                      value: "Number Of Births",
                                                                                      groupValue: radioGroup3,
                                                                                      padding: getPadding(top: 2, bottom: 2),
                                                                                      textStyle: theme.textTheme.bodySmall!,
                                                                                      isRightCheck: true,
                                                                                      onChange: (value) {
                                                                                        radioGroup3 = value;
                                                                                      }))
                                                                            ]))),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child: SizedBox(
                                                                            height: getVerticalSize(25),
                                                                            width: getHorizontalSize(359),
                                                                            child: Stack(alignment: Alignment.topCenter, children: [
                                                                              Align(alignment: Alignment.centerRight, child: Padding(padding: getPadding(right: 9), child: Text("+", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.titleLarge))),
                                                                              Align(alignment: Alignment.topCenter, child: SizedBox(width: getHorizontalSize(359), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.gray400)))
                                                                            ])))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 3),
                                                              child: Divider(
                                                                  height:
                                                                      getVerticalSize(
                                                                          1),
                                                                  thickness:
                                                                      getVerticalSize(
                                                                          1),
                                                                  color: appTheme
                                                                      .gray400)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 7,
                                                                      top: 1),
                                                              child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        height: getVerticalSize(
                                                                            25),
                                                                        width: getHorizontalSize(
                                                                            321),
                                                                        child: Stack(
                                                                            alignment:
                                                                                Alignment.centerRight,
                                                                            children: [
                                                                              Align(
                                                                                  alignment: Alignment.center,
                                                                                  child: CustomRadioButton(
                                                                                      width: getHorizontalSize(321),
                                                                                      text: "Number Of Kitchen",
                                                                                      iconSize: getHorizontalSize(20),
                                                                                      value: "Number Of Kitchen",
                                                                                      groupValue: radioGroup4,
                                                                                      padding: getPadding(top: 2, bottom: 2),
                                                                                      textStyle: theme.textTheme.bodySmall!,
                                                                                      isRightCheck: true,
                                                                                      onChange: (value) {
                                                                                        radioGroup4 = value;
                                                                                      })),
                                                                              Align(alignment: Alignment.centerRight, child: Padding(padding: getPadding(right: 24), child: Text("-", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.titleLarge)))
                                                                            ])),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                9),
                                                                        child: Text(
                                                                            "+",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.titleLarge))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 7,
                                                                      top: 6),
                                                              child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        height: getVerticalSize(
                                                                            25),
                                                                        width: getHorizontalSize(
                                                                            321),
                                                                        child: Stack(
                                                                            alignment:
                                                                                Alignment.centerRight,
                                                                            children: [
                                                                              Align(
                                                                                  alignment: Alignment.center,
                                                                                  child: CustomRadioButton(
                                                                                      width: getHorizontalSize(321),
                                                                                      text: "Number Of BathRooms",
                                                                                      iconSize: getHorizontalSize(20),
                                                                                      value: "Number Of BathRooms",
                                                                                      groupValue: radioGroup5,
                                                                                      padding: getPadding(top: 2, bottom: 2),
                                                                                      textStyle: theme.textTheme.bodySmall!,
                                                                                      isRightCheck: true,
                                                                                      onChange: (value) {
                                                                                        radioGroup5 = value;
                                                                                      })),
                                                                              Align(alignment: Alignment.centerRight, child: Padding(padding: getPadding(right: 24), child: Text("-", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: theme.textTheme.titleLarge)))
                                                                            ])),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                9),
                                                                        child: Text(
                                                                            "+",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.titleLarge))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 3,
                                                                      top: 13,
                                                                      right: 5),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                7,
                                                                            bottom:
                                                                                2),
                                                                        child: Text(
                                                                            "Shower",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    CustomSwitch(
                                                                        value:
                                                                            isSelectedSwitch,
                                                                        onChange:
                                                                            (value) {
                                                                          isSelectedSwitch =
                                                                              value;
                                                                        })
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 3,
                                                                      top: 23,
                                                                      right: 5),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                8,
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "Super owner",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    SizedBox(
                                                                        height: getVerticalSize(
                                                                            25),
                                                                        width: getHorizontalSize(
                                                                            75),
                                                                        child: Stack(
                                                                            alignment:
                                                                                Alignment.centerRight,
                                                                            children: [
                                                                              Align(alignment: Alignment.center, child: Container(height: getVerticalSize(24), width: getHorizontalSize(75), decoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(getHorizontalSize(12))))),
                                                                              Align(
                                                                                  alignment: Alignment.centerRight,
                                                                                  child: Container(
                                                                                      height: getSize(25),
                                                                                      width: getSize(25),
                                                                                      decoration: BoxDecoration(color: theme.colorScheme.onSecondary, borderRadius: BorderRadius.circular(getHorizontalSize(12)), boxShadow: [
                                                                                        BoxShadow(color: appTheme.black900.withOpacity(0.25), spreadRadius: getHorizontalSize(2), blurRadius: getHorizontalSize(2), offset: Offset(0, 4))
                                                                                      ])))
                                                                            ]))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 2,
                                                                      top: 22),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Motorpower",
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodySmall),
                                                                    Text(
                                                                        "0hp-900hp",
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodySmall)
                                                                  ])),
                                                          Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Container(
                                                                  height:
                                                                      getVerticalSize(
                                                                          20),
                                                                  width:
                                                                      getHorizontalSize(
                                                                          335),
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              3),
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      children: [
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.topCenter,
                                                                            child: Padding(padding: getPadding(top: 5), child: SizedBox(width: getHorizontalSize(319), child: Divider(height: getVerticalSize(6), thickness: getVerticalSize(6), color: theme.colorScheme.primary)))),
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            child: Container(
                                                                                height: getSize(20),
                                                                                width: getSize(20),
                                                                                decoration: BoxDecoration(color: theme.colorScheme.onSecondary, borderRadius: BorderRadius.circular(getHorizontalSize(10)), boxShadow: [
                                                                                  BoxShadow(color: appTheme.black900.withOpacity(0.25), spreadRadius: getHorizontalSize(2), blurRadius: getHorizontalSize(2), offset: Offset(0, 4))
                                                                                ]))),
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.centerRight,
                                                                            child: Container(
                                                                                height: getVerticalSize(20),
                                                                                width: getHorizontalSize(21),
                                                                                decoration: BoxDecoration(color: theme.colorScheme.onSecondary, borderRadius: BorderRadius.circular(getHorizontalSize(10)), boxShadow: [
                                                                                  BoxShadow(color: appTheme.black900.withOpacity(0.25), spreadRadius: getHorizontalSize(2), blurRadius: getHorizontalSize(2), offset: Offset(0, 4))
                                                                                ]))),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                      ]))),
                                                          CustomElevatedButton(
                                                              text: "Continue",
                                                              onTap: () {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    MyRouters
                                                                        .boatQueryScreenTwo,
                                                                    arguments:
                                                                        widget
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
                                                                  Alignment
                                                                      .center)
                                                        ]),
                                                  ),
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

  void onTapArrowleft1(BuildContext context) {}
}
