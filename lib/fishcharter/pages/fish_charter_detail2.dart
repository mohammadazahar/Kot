import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/core/utils/image_constant.dart';
import 'package:kot/core/utils/size_utils.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/theme/app_decoration.dart';
import 'package:kot/theme/custom_button_style.dart';
import 'package:kot/theme/custom_text_style.dart';
import 'package:kot/theme/theme_helper.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/custom_image_view.dart';

import '../../widgets/custom_elevated_button.dart';

class FishCharterDetail2 extends StatefulWidget {
  const FishCharterDetail2({super.key});

  @override
  State<FishCharterDetail2> createState() => _FishCharterDetail2State();
}

class _FishCharterDetail2State extends State<FishCharterDetail2> {
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
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Sebastian Inlet On Light Tackle",
                              style: TextStyle(
                                  color: CustomColor.colorPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                            Row(
                              children: const [
                                Text(
                                  ".Starting at 500",
                                  style: TextStyle(
                                      color: CustomColor.colorBlack,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "4-7 Hours",
                                  style: TextStyle(
                                      color: CustomColor.colorBlack,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "4 People",
                                  style: TextStyle(
                                      color: CustomColor.colorBlack,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Text(
                              ".Flats, Inshore, Jetty, Nearshore",
                              style: TextStyle(
                                  color: CustomColor.colorBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                            const Text(
                              ".Trip ",
                              style: TextStyle(
                                  color: CustomColor.colorBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                            Container(
                                height: getVerticalSize(600),
                                width: getHorizontalSize(345),
                                margin:
                                    getMargin(left: 13, right: 17, bottom: 5),
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
                                      // CustomImageView(
                                      //     svgPath: ImageConstant.imgUserPrimary,
                                      //     height: getSize(24),
                                      //     width: getSize(24),
                                      //     alignment: Alignment.centerRight,
                                      //     margin: getMargin(right: 31)),
                                      Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Total Price 650",
                                                              style: TextStyle(
                                                                  color: CustomColor
                                                                      .colorBlack,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                            ),
                                                            SvgPicture.asset(
                                                              'assets/heart_shape.svg',
                                                              // color: Colors.blue,
                                                              //  fit: BoxFit.fill,
                                                              // width: double.infinity,
                                                              height: 25,
                                                            ),
                                                            const Text(
                                                              "16 likes",
                                                              style: TextStyle(
                                                                  color: CustomColor
                                                                      .colorBlack,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                            ),
                                                          ],
                                                        ),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Select an option',
                                                              suffixIcon:
                                                                  DropdownButton<
                                                                      String>(
                                                                value:
                                                                    _selectedValue,
                                                                onChanged:
                                                                    (Value) {
                                                                  setState(() {
                                                                    _selectedValue =
                                                                        Value ??
                                                                            "";
                                                                  });
                                                                },
                                                                items: _dropdownItems.map<
                                                                    DropdownMenuItem<
                                                                        String>>((String
                                                                    value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Select an option',
                                                              suffixIcon:
                                                                  DropdownButton<
                                                                      String>(
                                                                value:
                                                                    _selectedValue,
                                                                onChanged:
                                                                    (Value) {
                                                                  setState(() {
                                                                    _selectedValue =
                                                                        Value ??
                                                                            "";
                                                                  });
                                                                },
                                                                items: _dropdownItems.map<
                                                                    DropdownMenuItem<
                                                                        String>>((String
                                                                    value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Select an option',
                                                              suffixIcon:
                                                                  DropdownButton<
                                                                      String>(
                                                                value:
                                                                    _selectedValue,
                                                                onChanged:
                                                                    (Value) {
                                                                  setState(() {
                                                                    _selectedValue =
                                                                        Value ??
                                                                            "";
                                                                  });
                                                                },
                                                                items: _dropdownItems.map<
                                                                    DropdownMenuItem<
                                                                        String>>((String
                                                                    value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Select an option',
                                                              suffixIcon:
                                                                  DropdownButton<
                                                                      String>(
                                                                value:
                                                                    _selectedValue,
                                                                onChanged:
                                                                    (Value) {
                                                                  setState(() {
                                                                    _selectedValue =
                                                                        Value ??
                                                                            "";
                                                                  });
                                                                },
                                                                items: _dropdownItems.map<
                                                                    DropdownMenuItem<
                                                                        String>>((String
                                                                    value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        SizedBox(height: 20.0),
                                                        CustomElevatedButton(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                                context,
                                                                MyRouters
                                                                    .fishCatcherScreen1);
                                                          },
                                                          text: "Reserve Now",
                                                          margin: getMargin(
                                                            left: 20,
                                                            right: 21,
                                                          ),
                                                          // rightIcon: Container(
                                                          //   margin: getMargin(
                                                          //     left: 30,
                                                          //   ),
                                                          //   child:
                                                          //       CustomImageView(
                                                          //     svgPath: ImageConstant
                                                          //         .imgArrowright,
                                                          //   ),
                                                          // ),
                                                          buttonStyle: CustomButtonStyles
                                                              .fillPrimary
                                                              .copyWith(
                                                                  fixedSize: MaterialStateProperty
                                                                      .all<Size>(
                                                                          Size(
                                                            double.maxFinite,
                                                            getVerticalSize(
                                                              55,
                                                            ),
                                                          ))),
                                                          buttonTextStyle:
                                                              CustomTextStyles
                                                                  .titleSmallPoppinsGray50,
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        // Text(
                                                        //     'Selected Option: $_selectedValue'),
                                                      ],
                                                    )))
                                          ])
                                    ]))
                          ]),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
