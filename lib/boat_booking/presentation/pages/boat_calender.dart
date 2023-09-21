import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/boat_booking/data/model/create_boat_request.dart';
import 'package:kot/boat_booking/presentation/pages/util1.dart';
import 'package:kot/core/constants/constants.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/toastHelper.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../my_routes.dart';
import '../../data/model/boat_booking_params.dart';
import '../widgets/search_widget.dart';

class BoatCalender extends StatefulWidget {
  final BoatBookingParams boatBookingParams;

  const BoatCalender(this.boatBookingParams, {super.key});

  @override
  _BoatCalenderState createState() => _BoatCalenderState();
}

class _BoatCalenderState extends State<BoatCalender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  DateTime _focusedDay1 = DateTime.now();
  DateTime? _selectedDay1;

  @override
  void initState() {
    super.initState();
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  bottomNavigationBar: const CommonBottom(selectedIndex: 2),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/app_background.svg"), fit: BoxFit.fitWidth)),
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
                  padding: const EdgeInsets.only(top: 15, left: 15.0, right: 15.0),
                  child: Column(
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
                        //  key: ConstantsValues.searchKey,
                        margin: const EdgeInsets.only(top: 20, bottom: 10),
                        child: SearchWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 15.0, right: 15.0),
                        child: Card(
                          elevation: 10,
                          child: Expanded(
                            child: Column(
                              children: [
                                TableCalendar(
                                  firstDay: kFirstDay,
                                  lastDay: kLastDay,
                                  focusedDay: _focusedDay,
                                  calendarFormat: _calendarFormat,
                                  selectedDayPredicate: (day) {
                                    // Use `selectedDayPredicate` to determine which day is currently selected.
                                    // If this returns true, then `day` will be marked as selected.

                                    // Using `isSameDay` is recommended to disregard
                                    // the time-part of compared DateTime objects.
                                    return isSameDay(_selectedDay, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    if (!isSameDay(_selectedDay, selectedDay)) {
                                      // Call `setState()` when updating the selected day
                                      setState(() {
                                        _selectedDay = selectedDay;
                                        _focusedDay = focusedDay;
                                      });
                                    }
                                  },
                                  onFormatChanged: (format) {
                                    if (_calendarFormat != format) {
                                      // Call `setState()` when updating calendar format
                                      setState(() {
                                        _calendarFormat = format;
                                      });
                                    }
                                  },
                                  onPageChanged: (focusedDay) {
                                    // No need to call `setState()` here
                                    _focusedDay = focusedDay;
                                  },
                                ),
                                TableCalendar(
                                  firstDay: kFirstDay,
                                  lastDay: kLastDay,
                                  focusedDay: _focusedDay1,
                                  calendarFormat: _calendarFormat,
                                  selectedDayPredicate: (day) {
                                    // Use `selectedDayPredicate` to determine which day is currently selected.
                                    // If this returns true, then `day` will be marked as selected.

                                    // Using `isSameDay` is recommended to disregard
                                    // the time-part of compared DateTime objects.
                                    return isSameDay(_selectedDay1, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    if (!isSameDay(_selectedDay1, selectedDay)) {
                                      // Call `setState()` when updating the selected day
                                      setState(() {
                                        _selectedDay1 = selectedDay;
                                        _focusedDay1 = focusedDay;
                                      });
                                    }
                                  },
                                  onFormatChanged: (format) {
                                    if (_calendarFormat != format) {
                                      // Call `setState()` when updating calendar format
                                      setState(() {
                                        _calendarFormat = format;
                                      });
                                    }
                                  },
                                  onPageChanged: (focusedDay) {
                                    // No need to call `setState()` here
                                    _focusedDay1 = focusedDay;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Constant.boatRequest.fromDate = _selectedDay1;
                                        Constant.boatRequest.toDate = _selectedDay;
                                        setState(() {});

                                        Navigator.pushNamed(context, MyRouters.boatQueryScreenOne,
                                            arguments: widget.boatBookingParams);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(CustomColor.colorPrimary),
                                      ),
                                      child: const Center(
                                        child: Text("Continue"
                                            ""),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
