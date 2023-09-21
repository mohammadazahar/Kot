import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kot/fish_catch/bloc/fish_catch/add_fish_catch_event.dart';
import 'package:kot/fish_catch/bloc/fish_catch/add_fish_catch_state.dart';
import 'package:kot/fish_catch/image_dialog.dart';

import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import 'bloc/fish_catch/add_fish_catch_bloc.dart';


class FishCatchEditDialog extends StatefulWidget {
  const FishCatchEditDialog({super.key});

  @override
  State<FishCatchEditDialog> createState() => _FishCatchEditDialogState();
}

class _FishCatchEditDialogState extends State<FishCatchEditDialog> {
  int tab_index = 0;
  var controllerName = TextEditingController();
  var controllerDate = TextEditingController();
  var controllerWeight = TextEditingController();
  var controllerLength = TextEditingController();
  var controllerMethod = TextEditingController();
  var controllerDesc = TextEditingController();

  // dateTimePickerWidget(BuildContext context) {
  //   return showDatePicker(
  //     context,
  //     dateFormat: 'dd MMMM yyyy HH:mm',
  //     initialDateTime: DateTime.now(),
  //     minDateTime: DateTime(2000),
  //     maxDateTime: DateTime(3000),
  //     onMonthChangeStartWithFirstDate: true,
  //     onConfirm: (dateTime, List<int> index) {
  //       DateTime selectdate = dateTime;
  //       final selIOS = DateFormat('dd-MMM-yyyy - HH:mm').format(selectdate);
  //       print(selIOS);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child:SizedBox(
        height: 82.h,
        width: 90.w,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 7.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFF74B9FF),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text("New catch",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text("Catch Name",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextField(
                        controller: controllerName,
                        decoration: const InputDecoration(
                            hintText: "Enter catch name",
                            hintStyle: TextStyle(color: Colors.blue)),
                      ),
                      const SizedBox(height: 10),
                      const Text("Catch Date & Time",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextField(
                        controller: controllerDate,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.blue,
                            ),
                            hintText: "Date and Time",
                            hintStyle: TextStyle(color: Colors.blue)),
                        readOnly: true,
                        onTap: () async {
                          //dateTimePickerWidget(context);

                          // showDatePicker(context: context, firstDate: DateTime.now(), lastDate:DateTime(3000));
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy hh:mm a')
                                    .format(pickedDate);
                            setState(() {
                              controllerDate.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text("Catch Details",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextField(
                        controller: controllerWeight,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "Weight",
                            hintStyle: TextStyle(color: Colors.blue)),
                      ),
                      TextField(
                        controller: controllerLength,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "Length",
                            hintStyle: TextStyle(color: Colors.blue)),
                      ),
                      TextField(
                        controller: controllerMethod,
                        decoration: const InputDecoration(
                            hintText: "Fishingmethod",
                            hintStyle: TextStyle(color: Colors.blue)),
                      ),
                      TextField(
                        controller: controllerDesc,
                        decoration: const InputDecoration(
                            hintText: "Catch Description",
                            hintStyle: TextStyle(color: Colors.blue)),
                      ),
                      const SizedBox(height: 10),
                      getButtons("Catch Position",
                          "assets/icons/ic_location.png", () {}),
                      getButtons(
                          "Browse Species", "assets/icons/ic_fish.png", () {}),
                      getButtons("Browse Images", "assets/icons/ic_image.png",
                          () {
                        showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) => const Center(
                                  child: ImageDialog(),
                                ));
                      }),
                    ],
                  ),
                ),
              )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 15.w,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: const Color(0xFF74B9FF),
                    elevation: 4,
                    shadowColor: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text("Update",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget getButtons(String title, String icon, Function function) {
    return SizedBox(
        height: 14.w,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.white,
          child: InkWell(
            onTap: () {
              function();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  height: 25,
                  width: 25,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(title,
                    style: const TextStyle(color: Colors.blue, fontSize: 15)),
              ],
            ),
          ),
        ));
  }
}
