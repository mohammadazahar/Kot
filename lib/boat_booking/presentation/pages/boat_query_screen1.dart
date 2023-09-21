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

class BoatQueryScreen1 extends StatefulWidget {
  final BoatBookingParams boatBookingParams;
  const BoatQueryScreen1(this.boatBookingParams, {super.key});

  @override
  State<BoatQueryScreen1> createState() => _BoatQueryScreen1State();
}

class _BoatQueryScreen1State extends State<BoatQueryScreen1> {
  String radioGroup = "";

  String radioGroup1 = "";

  String radioGroup2 = "";

  String radioGroup3 = "";

  String radioGroup4 = "";

  String radioGroup5 = "";

  bool isSelectedSwitch = false;
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'Exact Date';
  double start = 0;
  double end = 900;
  // Group Value for Radio Button.
  int id = 1;
  final RestorableDouble _continuousStartValue = RestorableDouble(0);
  final RestorableDouble _continuousEndValue = RestorableDouble(900);
  final RestorableDouble _feetStartValue = RestorableDouble(0);
  final RestorableDouble _feetEndValue = RestorableDouble(72);
  final RestorableInt radioValue = RestorableInt(0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final continuousValues = RangeValues(
      _continuousStartValue.value,
      _continuousEndValue.value,
    );
    final feetValues = RangeValues(
      _feetStartValue.value,
      _feetEndValue.value,
    );
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/splash_screen_bg.png",
                        height: 40,
                        width: 40,
                        //  height: MediaQuery.of(context).size.height - 150,
                      ),
                      Spacer(),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.notification_add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const Icon(
                        Icons.people,
                        size: 30,
                        color: Colors.white,
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Text("Is your date flexible?",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.titleMedium18)),
                              SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'Exact Date';
                                          id = 1;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Exact Date',
                                      style: new TextStyle(fontSize: 17.0),
                                    ),
                                    Radio(
                                      value: 2,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'Flexible';
                                          id = 2;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Flexible',
                                      style: new TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ]),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Price Per A Day"),
                                    Text("0\$-\$900")
                                  ],
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.white,
                                    overlayColor: Colors.blue),
                                child: RangeSlider(
                                  values: continuousValues,
                                  min: 0,
                                  max: 900,
                                  divisions: 5,
                                  labels: RangeLabels(
                                      continuousValues.start.round().toString(),
                                      continuousValues.end.round().toString()),
                                  onChanged: (values) {
                                    setState(() {
                                      _continuousStartValue.value =
                                          values.start;
                                      _continuousEndValue.value = values.end;
                                    });
                                  },
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Text("Length"), Text("0ft-72ft")],
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.white,
                                    overlayColor: Colors.blue),
                                child: RangeSlider(
                                  values: feetValues,
                                  min: 0,
                                  max: 72,
                                  divisions: 5,
                                  labels: RangeLabels(
                                      feetValues.start.round().toString(),
                                      feetValues.end.round().toString()),
                                  onChanged: (values) {
                                    setState(() {
                                      _feetStartValue.value = values.start;
                                      _feetEndValue.value = values.end;
                                    });
                                  },
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ]),
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

  // @override
  // String get restorationId {
  //   return 'kot_sliders';
  // }

  // @override
  // void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
  //   registerForRestoration(_continuousStartValue, 'continuous_start_value');
  //   registerForRestoration(_continuousEndValue, 'continuous_end_value');
  //   registerForRestoration(_feetStartValue, 'feet_start_value');
  //   registerForRestoration(_feetEndValue, 'continuous_end_value');
  //   registerForRestoration(radioValue, 'radio_value');
  // }
}
