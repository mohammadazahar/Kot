import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/core/utils/image_constant.dart';
import 'package:kot/core/utils/size_utils.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/theme/app_decoration.dart';
import 'package:kot/theme/custom_text_style.dart';
import 'package:kot/theme/theme_helper.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/custom_image_view.dart';

import 'fishCard2.dart';

class FishCatcherList extends StatefulWidget {
  const FishCatcherList({super.key});

  @override
  State<FishCatcherList> createState() => _FishCatcherListState();
}

class _FishCatcherListState extends State<FishCatcherList> {
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
                        padding: const EdgeInsets.only(top: 120.0),
                        child: Column(
                            //  alignment: Alignment.centerRight,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "1 Trip Option Near Indian River Lagoo",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style:
                                    CustomTextStyles.bodyMediumPoppinsGray800,
                              ),
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MyRouters.fishcharterDetail);
                                    },
                                    child: FishCard2(
                                        image: "assets/fish_catcher.png",
                                        subTitle:
                                            "Flats, Inshore, Jetty, Nearshore Fishing Charter",
                                        description:
                                            "Sebastian Inlet on Light Tackle",
                                        feet: "22ft",
                                        personPrice: "From125 Person",
                                        ppl: "4 people"),
                                  );
                                },
                              )
                            ])),
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
