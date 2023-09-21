import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

import '../../boat_booking/presentation/widgets/custom_buttons.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class FishCharterScreen1 extends StatefulWidget {
  const FishCharterScreen1({super.key});

  @override
  State<FishCharterScreen1> createState() => _FishCharterScreen1State();
}

class _FishCharterScreen1State extends State<FishCharterScreen1> {
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
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 150),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   height: getVerticalSize(
                          //     433,
                          //   ),
                          //   width: getHorizontalSize(
                          //     345,
                          //   ),
                          //   margin: getMargin(
                          //     left: 13,
                          //     top: 40,
                          //     right: 17,
                          //   ),
                          //   child: Stack(
                          //     alignment: Alignment.bottomCenter,
                          //     children: [
                          //       CustomImageView(
                          //         imagePath: ImageConstant.imgCardbackground2,
                          //         height: getVerticalSize(
                          //           262,
                          //         ),
                          //         width: getHorizontalSize(
                          //           345,
                          //         ),
                          //         radius: BorderRadius.circular(
                          //           getHorizontalSize(
                          //             12,
                          //           ),
                          //         ),
                          //         alignment: Alignment.topCenter,
                          //       ),
                          //       Align(
                          //         alignment: Alignment.bottomCenter,
                          //         child: Container(
                          //           margin: getMargin(
                          //             left: 8,
                          //             right: 7,
                          //           ),
                          //           decoration: AppDecoration.outline.copyWith(
                          //             borderRadius:
                          //                 BorderRadiusStyle.roundedBorder12,
                          //           ),
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             mainAxisAlignment: MainAxisAlignment.end,
                          //             children: [
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 13,
                          //                   top: 25,
                          //                 ),
                          //                 child: Text(
                          //                   "Sebastian Inlet On Light",
                          //                   overflow: TextOverflow.ellipsis,
                          //                   textAlign: TextAlign.left,
                          //                   style: CustomTextStyles
                          //                       .labelLargePoppinsPrimary,
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 15,
                          //                   top: 5,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 7,
                          //                       ),
                          //                       child: Text(
                          //                         "Booking Date ",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 7,
                          //                       ),
                          //                       child: Text(
                          //                         "08/28/203",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 13,
                          //                   top: 3,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 7,
                          //                       ),
                          //                       child: Text(
                          //                         "Start Time",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 4,
                          //                         top: 2,
                          //                       ),
                          //                       child: Text(
                          //                         " 07:30 Am",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 7,
                          //                   top: 8,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 9,
                          //                       ),
                          //                       child: Text(
                          //                         "Guests ",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 4,
                          //                       ),
                          //                       child: Text(
                          //                         "2",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 7,
                          //                   top: 8,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 9,
                          //                       ),
                          //                       child: Text(
                          //                         "Duration  ",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 4,
                          //                       ),
                          //                       child: Text(
                          //                         "6 Hours",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 7,
                          //                   top: 8,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 9,
                          //                       ),
                          //                       child: Text(
                          //                         "Location  ",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 4,
                          //                       ),
                          //                       child: Text(
                          //                         "Melborn",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 15,
                          //                   top: 6,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Text(
                          //                       "Total Price:",
                          //                       overflow: TextOverflow.ellipsis,
                          //                       textAlign: TextAlign.left,
                          //                       style:
                          //                           theme.textTheme.bodySmall,
                          //                     ),
                          //                     Align(
                          //                       alignment:
                          //                           Alignment.bottomRight,
                          //                       child: Padding(
                          //                         padding: getPadding(
                          //                           left: 6,
                          //                         ),
                          //                         child: Text(
                          //                           "654.00",
                          //                           overflow:
                          //                               TextOverflow.ellipsis,
                          //                           textAlign: TextAlign.left,
                          //                           style: theme
                          //                               .textTheme.bodySmall,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Divider(
                          //                 color: Colors.black,
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 7,
                          //                   top: 8,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 9,
                          //                       ),
                          //                       child: Text(
                          //                         "Cancellation  ",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 4,
                          //                       ),
                          //                       child: Text(
                          //                         "Cancel for free up to 08/25/202",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 7,
                          //                   top: 8,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 9,
                          //                       ),
                          //                       child: Text(
                          //                         "Total Price",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 4,
                          //                       ),
                          //                       child: Align(
                          //                         alignment: Alignment.topRight,
                          //                         child: Text(
                          //                           "253",
                          //                           overflow:
                          //                               TextOverflow.ellipsis,
                          //                           textAlign: TextAlign.left,
                          //                           style: theme
                          //                               .textTheme.bodySmall,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 7,
                          //                   top: 8,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 9,
                          //                       ),
                          //                       child: Text(
                          //                         "Due Now ",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.left,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 4,
                          //                       ),
                          //                       child: Align(
                          //                         alignment: Alignment.topRight,
                          //                         child: Text(
                          //                           "253",
                          //                           overflow:
                          //                               TextOverflow.ellipsis,
                          //                           textAlign: TextAlign.left,
                          //                           style: theme
                          //                               .textTheme.bodySmall,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               Padding(
                          //                 padding: getPadding(
                          //                   left: 7,
                          //                   top: 8,
                          //                 ),
                          //                 child: Row(
                          //                   children: [
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 9,
                          //                       ),
                          //                       child: Text(
                          //                         "Cancellation  ",
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         textAlign: TextAlign.right,
                          //                         style:
                          //                             theme.textTheme.bodySmall,
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: getPadding(
                          //                         left: 4,
                          //                       ),
                          //                       child: Align(
                          //                         alignment: Alignment.topRight,
                          //                         child: Text(
                          //                           "253",
                          //                           overflow:
                          //                               TextOverflow.ellipsis,
                          //                           textAlign: TextAlign.left,
                          //                           style: theme
                          //                               .textTheme.bodySmall,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               CustomElevatedButton(
                          //                 text: "Continue To Payment",
                          //                 margin: getMargin(
                          //                   left: 1,
                          //                   top: 14,
                          //                 ),
                          //                 buttonStyle: CustomButtonStyles
                          //                     .fillPrimary
                          //                     .copyWith(
                          //                         fixedSize:
                          //                             MaterialStateProperty.all<
                          //                                 Size>(Size(
                          //                   double.maxFinite,
                          //                   getVerticalSize(
                          //                     44,
                          //                   ),
                          //                 ))),
                          //                 buttonTextStyle: CustomTextStyles
                          //                     .titleSmallOnPrimaryContainer,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Text(
                            "Sebastian Inlet On Light",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                                borderRadius: BorderRadiusStyle.roundedBorder12,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Padding(
                                  //   padding: getPadding(
                                  //     left: 13,
                                  //     top: 25,
                                  //   ),
                                  //   child: Text(
                                  //     "Sebastian Inlet On Light",
                                  //     overflow: TextOverflow.ellipsis,
                                  //     textAlign: TextAlign.left,
                                  //     style: CustomTextStyles
                                  //         .labelLargePoppinsPrimary,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: getPadding(
                                      left: 15,
                                      top: 5,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 7,
                                          ),
                                          child: Text(
                                            "Booking Date ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 7,
                                          ),
                                          child: Text(
                                            "08/28/203",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
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
                                        Padding(
                                          padding: getPadding(
                                            left: 7,
                                          ),
                                          child: Text(
                                            "Start Time",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                            top: 2,
                                          ),
                                          child: Text(
                                            " 07:30 Am",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 7,
                                      top: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                          ),
                                          child: Text(
                                            "Guests ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                          ),
                                          child: Text(
                                            "2",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 7,
                                      top: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                          ),
                                          child: Text(
                                            "Duration  ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                          ),
                                          child: Text(
                                            "6 Hours",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 7,
                                      top: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                          ),
                                          child: Text(
                                            "Location  ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                          ),
                                          child: Text(
                                            "Melborn",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
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
                                          "Total Price:",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 6,
                                            ),
                                            child: Text(
                                              "654.00",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 7,
                                      top: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                          ),
                                          child: Text(
                                            "Cancellation  ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                          ),
                                          child: Text(
                                            "Cancel for free up to 08/25/202",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 7,
                                      top: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                          ),
                                          child: Text(
                                            "Total Price",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              "253",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 7,
                                      top: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                          ),
                                          child: Text(
                                            "Due Now ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              "253",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 7,
                                      top: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                          ),
                                          child: Text(
                                            "Cancellation  ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 4,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              "253",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BorderButton(
                                    borderColor: CustomColor.colorPrimary,
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          MyRouters.fishCatcherPayment);
                                    },
                                    backgroundColor: CustomColor.colorPrimary,
                                    borderRadius: 8,
                                    width: (MediaQuery.of(context).size.width) -
                                        30,
                                    height: 40,
                                    title: const Text(
                                      "Continue To Payment",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CustomColor.colorWhite,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
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
