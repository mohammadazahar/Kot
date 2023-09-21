import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/data/model/boat_booking_params.dart';
import 'package:kot/boat_booking/data/model/boat_type.dart';
import 'package:kot/boat_booking/presentation/widgets/card2.dart';
import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

import '../../../core/network/api_provider.dart';

class BoatType extends StatefulWidget {
  const BoatType({super.key});

  @override
  State<BoatType> createState() => _BoatTypeState();
}

class _BoatTypeState extends State<BoatType> {
  List<BoatTypeList>? boatTypeList;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    List<BoatTypeList> response = await ApiProvider().getBoatType();
    boatTypeList = response ?? [];
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
                    child: Container(
                      height: MediaQuery.of(context).size.height * 2,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.white,
                        elevation: 4.0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, right: 10.0, left: 10.0, bottom: 10),
                          child: boatTypeList == null
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : (boatTypeList?.isEmpty ?? false)
                                  ? const Center(
                                      child: Text("No Data"),
                                    )
                                  : _getCardList(context),
                        ),
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

  _getCardList(
    BuildContext context,
  ) {
    double itemWidth = (MediaQuery.of(context).size.width - 15) / 25;
    var delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 6,
      mainAxisSpacing: 7,
      childAspectRatio: itemWidth / 25,
    );
    return GridView.builder(
        gridDelegate: delegate,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: boatTypeList!.length,
        itemBuilder: (context, index) {
          BoatTypeList data = boatTypeList![index];
          return InkWell(
            onTap: () {
              BoatBookingParams boatBookingParams =
                  BoatBookingParams(boatId: "64a2f9dbf060197eb17432d1");

              Navigator.pushNamed(context, MyRouters.boatListing,
                  arguments: boatBookingParams);
            },
            child: Card2(
              title: data.name ?? "",
              image: data.image ?? "",
              isDynamic: true,
            ),
          );
        });
  }
}
