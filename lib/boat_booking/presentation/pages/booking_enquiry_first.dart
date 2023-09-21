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

import '../../../widgets/custom_outlined_button.dart';

class BookingInquiryFirst extends StatefulWidget {
  final BoatBookingParams boatBookingParams;
  const BookingInquiryFirst(this.boatBookingParams, {super.key});

  @override
  State<BookingInquiryFirst> createState() => _BookingInquiryFirstState();
}

class _BookingInquiryFirstState extends State<BookingInquiryFirst> {
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
                    child: SizedBox(
                        width: double.maxFinite,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: getMargin(left: 19, right: 22),
                                      padding: getPadding(
                                          left: 6,
                                          top: 29,
                                          right: 6,
                                          bottom: 29),
                                      decoration: AppDecoration.outline2
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder12),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 2),
                                                child: Text(
                                                    "Send a Booking Inquiry",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme.textTheme
                                                        .titleMedium)),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgQuestion1,
                                                height: getSize(99),
                                                width: getSize(99),
                                                margin: getMargin(top: 28)),
                                            Container(
                                                width: getHorizontalSize(274),
                                                margin: getMargin(
                                                    left: 22,
                                                    top: 22,
                                                    right: 25),
                                                child: Text(
                                                    "We’ll ask you a few questions so the listing owner can send you a custom price, itinerary and more information. No commitment or credit card needed.",
                                                    maxLines: 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyles
                                                        .bodyLargeBlack900)),
                                            Spacer(),
                                            CustomElevatedButton(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      MyRouters
                                                          .boatInquiryScreenOne,
                                                      arguments: widget
                                                          .boatBookingParams);
                                                },
                                                text: "Continue",
                                                buttonStyle: CustomButtonStyles
                                                    .fillPrimary
                                                    .copyWith(
                                                        fixedSize: MaterialStateProperty
                                                            .all<Size>(Size(
                                                                double
                                                                    .maxFinite,
                                                                getVerticalSize(
                                                                    38)))),
                                                buttonTextStyle: CustomTextStyles
                                                    .titleSmallOnPrimaryContainer)
                                          ])))
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
