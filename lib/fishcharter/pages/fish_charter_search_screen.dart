import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/core/utils/size_utils.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/theme/custom_text_style.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../toastHelper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';

class FishCharterSearchScreen extends StatefulWidget {
  const FishCharterSearchScreen({super.key});

  @override
  State<FishCharterSearchScreen> createState() =>
      _FishCharterSearchScreenState();
}

class _FishCharterSearchScreenState extends State<FishCharterSearchScreen> {
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
                            Container(
                                height: getVerticalSize(600),
                                width: getHorizontalSize(345),
                                margin:
                                    getMargin(left: 13, right: 17, bottom: 5),
                                child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgFishFile,
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
                                                                  'Group Size',
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
                                                                  '08/26',
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
                                                              labelText: 'Type',
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
                                                                  'Species',
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
                                                                    .fishCatcherListing);
                                                          },
                                                          text: "Filter",
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
