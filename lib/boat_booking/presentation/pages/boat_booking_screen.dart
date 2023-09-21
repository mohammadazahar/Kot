import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/data/model/boat_booking_params.dart';
import 'package:kot/boat_booking/presentation/pages/boat_booking_screen2.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import '../../../core/constants/constants.dart';

class BoatBookingScreen extends StatefulWidget {
  final BoatBookingParams? boatBookingParams;

  const BoatBookingScreen(this.boatBookingParams, {Key? key}) : super(key: key);

  @override
  State<BoatBookingScreen> createState() => _BoatBookingScreenState();
}

class _BoatBookingScreenState extends State<BoatBookingScreen> {
  Color primaryColor = const Color(0xff74B9FF);
  int _selectedRadio = 0;

  double startRangeForADay = 0;
  double endRangeForADay = 900;

  double minForADay = 0;
  double maxForADay = 900;

  double startRangeForLength = 0;
  double endRangeForLength = 72;

  double minForLength = 0;
  double maxForLength = 72;

  bool showerSwitch = false;
  bool superOwnerSwitch = false;

  double startRangeForMotoPower = 0;
  double endRangeForMotoPower = 900;

  double minForMotoPower = 0;
  double maxForMotoPower = 900;

  List<PropertyCount> properties = [
    PropertyCount(title: 'Number Of Cabins'),
    PropertyCount(title: 'Number Of People'),
    PropertyCount(title: 'Number Of Births'),
    PropertyCount(title: 'Number Of Kitchen'),
    PropertyCount(title: 'Number Of BathRooms'),
  ];

  @override
  void initState() {
    Constant.boatRequest.length = maxForLength.toInt();
    Constant.boatRequest.pricePerDay =
        "${startRangeForADay.toString()}-${endRangeForADay.toString()}";
    Constant.boatRequest.motorPower = endRangeForMotoPower.toInt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('from date ==> ${Constant.boatRequest.fromDate}');
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  'assets/app_background.svg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 35, left: 15.0, right: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/splash_screen_bg.png",
                          height: 50,
                          width: 50,
                          //  height: MediaQuery.of(context).size.height - 150,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRouters.profileScreen);
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      //  key: ConstantsValues.searchKey,
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: SearchWidget(),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text('Is your date flexible?',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Radio<int>(
                                  value: 0,
                                  groupValue: _selectedRadio,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedRadio = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  'Exact Date',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                const SizedBox(width: 20),
                                Radio<int>(
                                  value: 1,
                                  groupValue: _selectedRadio,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedRadio = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  'Flexible',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            CustomRangeSlider(
                                startRange: startRangeForADay,
                                endRange: endRangeForADay,
                                minRange: minForADay,
                                maxRange: maxForADay,
                                onChanged: (value) {
                                  setState(() {
                                    startRangeForADay = value.start;
                                    endRangeForADay = value.end;
                                    Constant.boatRequest.pricePerDay =
                                        "${startRangeForADay.toString()}-${endRangeForADay.toString()}";
                                  });
                                },
                                title: 'Price Per A Day'),
                            CustomRangeSlider(
                                startRange: startRangeForLength,
                                endRange: endRangeForLength,
                                minRange: minForLength,
                                maxRange: maxForLength,
                                onChanged: (value) {
                                  setState(() {
                                    startRangeForLength = value.start;
                                    endRangeForLength = value.end;
                                  });
                                },
                                title: 'Length'),
                            PropertyCounterWidget(properties: properties),
                            const SizedBox(height: 8),
                            CustomSwitchButton(
                              title: 'Shower',
                              onChanged: (value) {
                                showerSwitch = value;
                                Constant.boatRequest.shower = showerSwitch;
                                setState(() {});
                              },
                              switchValue: showerSwitch,
                            ),
                            const Divider(
                              color: Color(0xffC6C6C6),
                            ),
                            CustomSwitchButton(
                              title: 'Super owner',
                              onChanged: (value) {
                                superOwnerSwitch = value;
                                setState(() {});
                              },
                              switchValue: superOwnerSwitch,
                            ),
                            const Divider(
                              color: Color(0xffC6C6C6),
                            ),
                            CustomRangeSlider(
                                startRange: startRangeForMotoPower,
                                endRange: endRangeForMotoPower,
                                minRange: minForMotoPower,
                                maxRange: maxForMotoPower,
                                onChanged: (value) {
                                  setState(() {
                                    startRangeForMotoPower = value.start;
                                    endRangeForMotoPower = value.end;
                                  });
                                },
                                title: 'Motorpower'),
                            const SizedBox(height: 20),
                            Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                width: MediaQuery.of(context).size.width,
                                child: CustomElevatedButton(
                                  label: 'Continue',
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRouters.boatQueryScreenTwo,
                                        arguments: widget.boatBookingParams);
                                  },
                                  buttonColor: primaryColor,
                                  // Custom button color
                                  textColor: Colors.white,
                                  // Custom text color
                                  borderRadius: BorderRadius.circular(
                                      10), // Custom border radius
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSwitchButton extends StatelessWidget {
  final String title;
  final bool switchValue;
  final void Function(bool)? onChanged;

  const CustomSwitchButton(
      {Key? key,
      required this.title,
      required this.onChanged,
      required this.switchValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(color: Colors.black, fontSize: 12)),
        const Spacer(),
        CupertinoSwitch(
            activeColor: CustomColor.colorPrimary,
            value: switchValue,
            onChanged: onChanged),
      ],
    );
  }
}

class CustomRangeSlider extends StatelessWidget {
  final String title;
  final double startRange;
  final double endRange;
  final double minRange;
  final double maxRange;
  final void Function(RangeValues) onChanged;

  const CustomRangeSlider({
    Key? key,
    required this.startRange,
    required this.endRange,
    required this.onChanged,
    required this.maxRange,
    required this.minRange,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int startIntRange = startRange.toInt(); // Convert to integer
    int endIntRange = endRange.toInt(); // Convert to integer

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.black, fontSize: 12)),
              const Spacer(),
              Text(
                "${String.fromCharCodes(Runes('\u0024'))}$startIntRange - ${String.fromCharCodes(Runes('\u0024'))}$endIntRange",
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
        SliderTheme(
          data: const SliderThemeData(
              thumbColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)),
          child: RangeSlider(
            values: RangeValues(startRange, endRange),
            labels:
                RangeLabels(startIntRange.toString(), endIntRange.toString()),
            onChanged: onChanged,
            min: minRange,
            max: maxRange,
          ),
        ),
      ],
    );
  }
}

class PropertyCounterWidget extends StatefulWidget {
  final List<PropertyCount> properties;

  const PropertyCounterWidget({super.key, required this.properties});

  @override
  _PropertyCounterWidgetState createState() => _PropertyCounterWidgetState();
}

class _PropertyCounterWidgetState extends State<PropertyCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.properties.map((property) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(property.title),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          if (property.count > 0) {
                            property.count--;
                          }

                          if (property.title == 'Number Of Cabins') {
                            Constant.boatRequest.cabins = property.count;
                          } else if (property.title == 'Number Of People') {
                          } else if (property.title == 'Number Of Births') {
                            Constant.boatRequest.births = property.count;
                          } else if (property.title == 'Number Of Kitchen') {
                            Constant.boatRequest.kitchen = property.count;
                          } else if (property.title == 'Number Of BathRooms') {
                            Constant.boatRequest.bathroom = property.count;
                          }
                        });
                      },
                    ),
                    Container(
                        padding: EdgeInsets.all(property.count == 0 ? 8 : 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle),
                        child: Text(property.count == 0
                            ? ''
                            : property.count.toString())),
                    IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          property.count++;
                          if (property.title == 'Number Of Cabins') {
                            Constant.boatRequest.cabins = property.count;
                          } else if (property.title == 'Number Of People') {
                          } else if (property.title == 'Number Of Births') {
                            Constant.boatRequest.births = property.count;
                          } else if (property.title == 'Number Of Kitchen') {
                            Constant.boatRequest.kitchen = property.count;
                          } else if (property.title == 'Number Of BathRooms') {
                            Constant.boatRequest.bathroom = property.count;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1.2,
            ),
          ],
        );
      }).toList(),
    );
  }
}

class PropertyCount {
  final String title;
  int count;

  PropertyCount({required this.title, this.count = 0});
}
