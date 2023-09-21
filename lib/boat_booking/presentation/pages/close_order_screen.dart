import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/core/app_export.dart';
import 'package:kot/toastHelper.dart';

import '../../../core/utils/size_utils.dart';
import '../../../my_routes.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../data/model/boat_booking_params.dart';

class CloseOrderScreen extends StatefulWidget {
  const CloseOrderScreen({super.key});

  @override
  State<CloseOrderScreen> createState() => _CloseOrderScreenState();
}

class _CloseOrderScreenState extends State<CloseOrderScreen> {
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
                    width: mediaQueryData.size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.popAndPushNamed(
                                        context, MyRouters.openOrderScreen);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Active",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Completed",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              433,
                            ),
                            width: getHorizontalSize(
                              345,
                            ),
                            margin: getMargin(
                              left: 13,
                              top: 40,
                              right: 17,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgCardbackground2,
                                  height: getVerticalSize(
                                    262,
                                  ),
                                  width: getHorizontalSize(
                                    345,
                                  ),
                                  radius: BorderRadius.circular(
                                    getHorizontalSize(
                                      12,
                                    ),
                                  ),
                                  alignment: Alignment.topCenter,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: getMargin(
                                      left: 8,
                                      right: 7,
                                    ),
                                    decoration: AppDecoration.outline.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 13,
                                            top: 25,
                                          ),
                                          child: Text(
                                            "200hp, great family boat with tube",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .labelLargePoppinsPrimary,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 15,
                                            top: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgLocation,
                                                height: getVerticalSize(
                                                  11,
                                                ),
                                                width: getHorizontalSize(
                                                  10,
                                                ),
                                                margin: getMargin(
                                                  bottom: 3,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 7,
                                                ),
                                                child: Text(
                                                  "Hyderabad",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 13,
                                            top: 3,
                                          ),
                                          child: Row(
                                            children: [
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgActiveuser2,
                                                height: getVerticalSize(
                                                  17,
                                                ),
                                                width: getHorizontalSize(
                                                  15,
                                                ),
                                                radius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    7,
                                                  ),
                                                ),
                                                margin: getMargin(
                                                  top: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 4,
                                                  top: 2,
                                                ),
                                                child: Text(
                                                  "6",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgBoat2,
                                                height: getVerticalSize(
                                                  17,
                                                ),
                                                width: getHorizontalSize(
                                                  15,
                                                ),
                                                radius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    7,
                                                  ),
                                                ),
                                                margin: getMargin(
                                                  left: 19,
                                                  bottom: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 4,
                                                  top: 3,
                                                ),
                                                child: Text(
                                                  "With Captain",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 15,
                                            top: 8,
                                          ),
                                          child: Row(
                                            children: [
                                              CustomImageView(
                                                svgPath: ImageConstant.imgStar,
                                                height: getVerticalSize(
                                                  13,
                                                ),
                                                width: getHorizontalSize(
                                                  10,
                                                ),
                                                margin: getMargin(
                                                  top: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 9,
                                                ),
                                                child: Text(
                                                  "5.0",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 4,
                                                ),
                                                child: Text(
                                                  "(7)",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 15,
                                            top: 6,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Date: 29-05-2023",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 66,
                                                ),
                                                child: Text(
                                                  "Duration:",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 6,
                                                ),
                                                child: Text(
                                                  "4-8 Hours",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      theme.textTheme.bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 15,
                                            top: 8,
                                          ),
                                          child: Text(
                                            "1503",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        CustomElevatedButton(
                                          text: "Completed",
                                          margin: getMargin(
                                            left: 1,
                                            top: 14,
                                          ),
                                          buttonStyle: CustomButtonStyles
                                              .fillPrimary
                                              .copyWith(
                                                  fixedSize:
                                                      MaterialStateProperty.all<
                                                          Size>(Size(
                                            double.maxFinite,
                                            getVerticalSize(
                                              44,
                                            ),
                                          ))),
                                          buttonTextStyle: CustomTextStyles
                                              .titleSmallOnPrimaryContainer,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
