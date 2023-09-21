import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/data/model/boat_booking_params.dart';
import 'package:kot/boat_booking/data/model/boat_search_response.dart';
import 'package:kot/boat_booking/data/model/create_boat_request.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/core/constants/constants.dart';
import 'package:kot/core/network/api_provider.dart';

import '../../../my_routes.dart';
import '../../../toastHelper.dart';

Color primaryColor = const Color(0xff74B9FF);

class BoatBookingSecondScreen2 extends StatefulWidget {
  final BoatBookingParams? boatBookingParams;

  const BoatBookingSecondScreen2(this.boatBookingParams, {Key? key}) : super(key: key);

  @override
  State<BoatBookingSecondScreen2> createState() => _BoatBookingSecondScreen2State();
}

class _BoatBookingSecondScreen2State extends State<BoatBookingSecondScreen2> {
  bool affordable = true;

  int _selectedRadio = 0;

  double multiDayValue = 0;

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

  @override
  void initState() {
    Constant.boatRequest.hasCaptain = _selectedRadio == 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   elevation: 0,
      //   leading: IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.arrow_back),
      //       color: Colors.white),
      //   title:
      //       const Text('Boat Booking', style: TextStyle(color: Colors.white)),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.account_circle_rounded),
      //         color: Colors.white),
      //     IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.notifications),
      //         color: Colors.white)
      //   ],
      // ),
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
                padding: const EdgeInsets.only(top: 35, left: 15.0, right: 15.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: MediaQuery.of(context).size.height - 120,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text('How long do you want to be out on the water?',
                              style:
                                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(multiDayValue.toInt().toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12)),
                              const Spacer(),
                              Text('Multi-Day',
                                  style: TextStyle(
                                      color: primaryColor, fontWeight: FontWeight.bold, fontSize: 13)),
                            ],
                          ),
                          SliderTheme(
                            data: const SliderThemeData(
                                thumbColor: Colors.white,
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10)),
                            child: Slider(
                              value: multiDayValue,
                              max: 10,
                              min: 0,
                              onChanged: (val) {
                                multiDayValue = val;
                                setState(() {});
                              },
                            ),
                          ),
                          const CustomContainerLayout(),
                          const SizedBox(height: 20),
                          Text('Do you need a captain included?',
                              style:
                                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Radio<int>(
                                value: 0,
                                groupValue: _selectedRadio,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRadio = value!;
                                    Constant.boatRequest.hasCaptain = _selectedRadio == value;
                                  });
                                },
                              ),
                              const Text(
                                'Yes',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              const SizedBox(width: 20),
                              Radio<int>(
                                value: 1,
                                groupValue: _selectedRadio,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRadio = value!;
                                    Constant.boatRequest.hasCaptain = _selectedRadio == value;
                                  });
                                },
                              ),
                              const Text(
                                'No',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text('Are you more interested in affordability or luxury?',
                              style:
                                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              width: 230,
                              child: CustomElevatedButton(
                                label: 'Affordable',
                                onPressed: () {
                                  affordable = !affordable;
                                  setState(() {});
                                },
                                buttonColor: affordable ? primaryColor : Colors.white,
                                textColor: affordable ? Colors.white : primaryColor,
                                borderRadius: BorderRadius.circular(10), // Custom border radius
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              width: 230,
                              child: CustomElevatedButton(
                                label: 'Luxury',
                                onPressed: () {
                                  affordable = !affordable;
                                  setState(() {});
                                },
                                buttonColor: !affordable ? primaryColor : Colors.white,
                                textColor: !affordable ? Colors.white : primaryColor,

                                borderRadius: BorderRadius.circular(10), // Custom border radius
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              width: MediaQuery.of(context).size.width,
                              child: CustomElevatedButton(
                                label: 'Continue',
                                onPressed: () async {
                                  var c = Constant.boatRequest;
                                  String url =
                                      "https://kot-api.onrender.com/dev/app/search-boat?boatType=64a7eb2c2baa6aecfab0f8e7&pricePerDay=${c.pricePerDay}&length=${c.length}&cabins=${c.cabins}&births=${c.births}&capacity=20&kitchen=${c.kitchen}&bathroom=${c.bathroom}&shower=${c.shower}&motorPower=${c.motorPower}&hasCaptain=${c.hasCaptain}&superOwner=${c.superOwner}&fromDate=${c.fromDate}&toDate=${c.toDate}";
                                  BoatSearchResponse response = await ApiProvider().getSearchDataList(url);
                                  if (response.message == 'Boat listed successfully') {
                                    ToastHelper.showToast(response.message ?? "");
                                    if (mounted) {
                                      Navigator.pushNamed(context, MyRouters.BOAT_DETAILS,
                                          arguments: widget.boatBookingParams);
                                    }
                                  }
                                },
                                buttonColor: primaryColor,
                                // Custom button color
                                textColor: Colors.white,
                                // Custom text color
                                borderRadius: BorderRadius.circular(10), // Custom border radius
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
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

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final BorderRadiusGeometry borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Text(label),
    );
  }
}

class SelectableContainer extends StatefulWidget {
  final String title;
  final bool isSelected;
  final void Function() onTap;

  const SelectableContainer({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _SelectableContainerState createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: widget.isSelected ? primaryColor : Colors.white,
          border: Border.all(
            color: widget.isSelected ? Colors.white : primaryColor,
          ),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : primaryColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CustomContainerLayout extends StatefulWidget {
  const CustomContainerLayout({super.key});

  @override
  _CustomContainerLayoutState createState() => _CustomContainerLayoutState();
}

class _CustomContainerLayoutState extends State<CustomContainerLayout> {
  int _selectedContainerIndex = -1;

  List<String> containerTitles = [
    '1-2 Hours',
    '2-4 Hours',
    '4-8 Hours',
    '8-12 Hours',
    'Multi-Day',
    'More Filters',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 3; i++)
                SelectableContainer(
                  title: containerTitles[i],
                  isSelected: _selectedContainerIndex == i,
                  onTap: () {
                    setState(() {
                      _selectedContainerIndex = i;
                    });
                  },
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 3; i < containerTitles.length; i++)
                SelectableContainer(
                  title: containerTitles[i],
                  isSelected: _selectedContainerIndex == i,
                  onTap: () {
                    setState(() {
                      _selectedContainerIndex = i;
                    });
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
