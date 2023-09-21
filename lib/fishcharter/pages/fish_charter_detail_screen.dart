import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/core/utils/image_constant.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/theme/app_decoration.dart';
import 'package:kot/theme/theme_helper.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/custom_image_view.dart';
import '../../core/utils/size_utils.dart';

class FishcharterDetailScreen extends StatefulWidget {
  const FishcharterDetailScreen({super.key});

  @override
  State<FishcharterDetailScreen> createState() =>
      _FishcharterDetailScreenState();
}

class _FishcharterDetailScreenState extends State<FishcharterDetailScreen> {
  String? _selectedValue;
  List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //   bottomNavigationBar: CommonBottom(selectedIndex: 3),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: const Icon(
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRouters.fishcharterDetail2);
                          },
                          child: Expanded(
                              child: SingleChildScrollView(
                                  child: Container(
                                      height: getVerticalSize(600),
                                      width: getHorizontalSize(345),
                                      margin: getMargin(
                                          left: 13, right: 17, bottom: 5),
                                      child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgPexelsszeleirobert1482193,
                                                height: getVerticalSize(262),
                                                width: getHorizontalSize(345),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(12)),
                                                alignment: Alignment.topCenter),
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgUserPrimary,
                                                height: getSize(24),
                                                width: getSize(24),
                                                alignment:
                                                    Alignment.centerRight,
                                                margin: getMargin(right: 31)),
                                            Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                    margin: getMargin(
                                                        left: 15, right: 7),
                                                    padding: getPadding(
                                                        left: 1,
                                                        top: 9,
                                                        right: 1,
                                                        bottom: 9),
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
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 10,
                                                                      top: 10),
                                                              child: const Text(
                                                                  "Boat Rental In Hyderabad",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black))),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 10,
                                                                      top: 4),
                                                              child: Text(
                                                                  "22 meter wyliecyt sail boat-waily65 ",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: theme
                                                                      .textTheme
                                                                      .titleSmall)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 10,
                                                                      top: 8),
                                                              child: const Text(
                                                                  "Proposed by Marja",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black))),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 13,
                                                                      top: 4),
                                                              child: Text(
                                                                  "Description",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: theme
                                                                      .textTheme
                                                                      .titleSmall)),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 11,
                                                                      top: 1),
                                                              child: Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                3),
                                                                        child: Text(
                                                                            "5 People",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                38,
                                                                            top:
                                                                                1,
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "1 Cabins",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                60,
                                                                            bottom:
                                                                                3),
                                                                        child: Text(
                                                                            "2 Berths",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 10,
                                                                      top: 5),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                        "Kitchen - N/A",
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodySmall),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                13),
                                                                        child: Text(
                                                                            "Bathrooms - N/A",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                12),
                                                                        child: Text(
                                                                            "Shower - N/A",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall))
                                                                  ])),
                                                          Container(
                                                              height:
                                                                  getVerticalSize(
                                                                      90),
                                                              width:
                                                                  getHorizontalSize(
                                                                      204),
                                                              margin: getMargin(
                                                                  left: 45,
                                                                  top: 9),
                                                              child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgRectangle90,
                                                                        height: getVerticalSize(
                                                                            90),
                                                                        width: getHorizontalSize(
                                                                            204),
                                                                        radius: BorderRadius.circular(getHorizontalSize(
                                                                            12)),
                                                                        alignment:
                                                                            Alignment.center),
                                                                    Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child: Container(
                                                                            height: getVerticalSize(53),
                                                                            width: getHorizontalSize(50),
                                                                            margin: getMargin(left: 72, top: 16),
                                                                            child: Stack(alignment: Alignment.centerRight, children: [
                                                                              Align(alignment: Alignment.center, child: Container(height: getVerticalSize(53), width: getHorizontalSize(50), decoration: BoxDecoration(color: theme.colorScheme.onPrimaryContainer.withOpacity(0.8), borderRadius: BorderRadius.circular(getHorizontalSize(26))))),
                                                                              CustomImageView(svgPath: ImageConstant.imgVector, height: getSize(20), width: getSize(20), alignment: Alignment.centerRight, margin: getMargin(right: 13))
                                                                            ])))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 11),
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
                                                                      left: 17,
                                                                      top: 2),
                                                              child: Row(
                                                                  children: [
                                                                    CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant
                                                                                .imgBoat3,
                                                                        height: getSize(
                                                                            15),
                                                                        width: getSize(
                                                                            15),
                                                                        margin: getMargin(
                                                                            bottom:
                                                                                3)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                19,
                                                                            top:
                                                                                1),
                                                                        child: Text(
                                                                            "With Captain",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.titleSmall))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 51,
                                                                      top: 2),
                                                              child: Text(
                                                                  "Description about Captain",
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
                                                                      left: 17,
                                                                      top: 1),
                                                              child: Row(
                                                                  children: [
                                                                    CustomImageView(
                                                                        svgPath:
                                                                            ImageConstant
                                                                                .imgFile,
                                                                        height: getVerticalSize(
                                                                            20),
                                                                        width: getHorizontalSize(
                                                                            15)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                21,
                                                                            top:
                                                                                1,
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "Booking Conditions",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.titleSmall))
                                                                  ])),
                                                          Align(
                                                              alignment: Alignment
                                                                  .center,
                                                              child: Container(
                                                                  width:
                                                                      getHorizontalSize(
                                                                          205),
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              1),
                                                                  child: Text(
                                                                      "This Boat Can be rented any date of the week",
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
                                                                          .bodySmall))),
                                                          // const Text(
                                                          //   "Sebastian Inlet On Light Tackle",
                                                          //   style: TextStyle(
                                                          //       color: CustomColor
                                                          //           .colorPrimary,
                                                          //       fontSize: 15,
                                                          //       fontWeight:
                                                          //           FontWeight
                                                          //               .normal),
                                                          // ),
                                                          // Row(
                                                          //   children: const [
                                                          //     Text(
                                                          //       ".Starting at 500",
                                                          //       style: TextStyle(
                                                          //           color: CustomColor
                                                          //               .colorBlack,
                                                          //           fontSize: 15,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .normal),
                                                          //     ),
                                                          //     Text(
                                                          //       "4-7 Hours",
                                                          //       style: TextStyle(
                                                          //           color: CustomColor
                                                          //               .colorBlack,
                                                          //           fontSize: 15,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .normal),
                                                          //     ),
                                                          //     Text(
                                                          //       "4 People",
                                                          //       style: TextStyle(
                                                          //           color: CustomColor
                                                          //               .colorBlack,
                                                          //           fontSize: 15,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .bold),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // const Text(
                                                          //   ".Flats, Inshore, Jetty, Nearshore",
                                                          //   style: TextStyle(
                                                          //       color: CustomColor
                                                          //           .colorBlack,
                                                          //       fontSize: 15,
                                                          //       fontWeight:
                                                          //           FontWeight
                                                          //               .normal),
                                                          // ),
                                                          // const Text(
                                                          //   ".Trip ",
                                                          //   style: TextStyle(
                                                          //       color: CustomColor
                                                          //           .colorBlack,
                                                          //       fontSize: 15,
                                                          //       fontWeight:
                                                          //           FontWeight
                                                          //               .normal),
                                                          // ),
                                                          // CustomImageView(
                                                          //     imagePath: ImageConstant
                                                          //         .imgPexelsszeleirobert1482193,
                                                          //     height:
                                                          //         getVerticalSize(
                                                          //             100),
                                                          //     width:
                                                          //         getHorizontalSize(
                                                          //             250),
                                                          //     radius: BorderRadius
                                                          //         .circular(
                                                          //             getHorizontalSize(
                                                          //                 12)),
                                                          //     alignment: Alignment
                                                          //         .topCenter),
                                                          // // CustomImageView(
                                                          // //     svgPath: ImageConstant
                                                          // //         .imgUserPrimary,
                                                          // //     height: getSize(24),
                                                          // //     width: getSize(24),
                                                          // //     alignment: Alignment
                                                          // //         .centerRight,
                                                          // //     margin: getMargin(
                                                          // //         right: 31)),
                                                          // Align(
                                                          //     alignment: Alignment
                                                          //         .bottomCenter,
                                                          //     child: Container(
                                                          //         margin:
                                                          //             getMargin(
                                                          //                 left:
                                                          //                     15,
                                                          //                 right:
                                                          //                     7),
                                                          //         padding:
                                                          //             getPadding(
                                                          //                 left: 1,
                                                          //                 top: 9,
                                                          //                 right:
                                                          //                     1,
                                                          //                 bottom:
                                                          //                     9),
                                                          //         decoration: AppDecoration
                                                          //             .outline
                                                          //             .copyWith(
                                                          //                 borderRadius:
                                                          //                     BorderRadiusStyle
                                                          //                         .roundedBorder12),
                                                          //         child: Column(
                                                          //             mainAxisSize:
                                                          //                 MainAxisSize
                                                          //                     .min,
                                                          //             crossAxisAlignment:
                                                          //                 CrossAxisAlignment
                                                          //                     .start,
                                                          //             mainAxisAlignment:
                                                          //                 MainAxisAlignment
                                                          //                     .end,
                                                          //             children: [
                                                          //               Column(
                                                          //                 mainAxisAlignment:
                                                          //                     MainAxisAlignment.center,
                                                          //                 children: [
                                                          //                   TextField(
                                                          //                     decoration:
                                                          //                         InputDecoration(
                                                          //                       labelText: 'Select an option',
                                                          //                       suffixIcon: DropdownButton<String>(
                                                          //                         value: _selectedValue,
                                                          //                         onChanged: (Value) {
                                                          //                           setState(() {
                                                          //                             _selectedValue = Value ?? "";
                                                          //                           });
                                                          //                         },
                                                          //                         items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                                                          //                           return DropdownMenuItem<String>(
                                                          //                             value: value,
                                                          //                             child: Text(value),
                                                          //                           );
                                                          //                         }).toList(),
                                                          //                       ),
                                                          //                     ),
                                                          //                   ),
                                                          //                   SizedBox(
                                                          //                       height: 20.0),
                                                          //                   Text(
                                                          //                       'Selected Option: $_selectedValue'),
                                                          //                 ],
                                                          //               )
                                                          //             ])))
                                                        ])))
                                          ])))),
                        )
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
