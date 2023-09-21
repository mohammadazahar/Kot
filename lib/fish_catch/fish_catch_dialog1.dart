import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kot/fish_catch/fish_catch_edit_dialog.dart';
import 'package:kot/fish_catch/image_dialog.dart';
import 'package:sizer/sizer.dart';

import 'bloc/fish_catch/add_fish_catch_bloc.dart';
import 'bloc/fish_catch/add_fish_catch_event.dart';
import 'bloc/fish_catch/add_fish_catch_state.dart';
import 'page/detail_page.dart';

class FishCatchDialog extends StatefulWidget {
  const FishCatchDialog({super.key});

  @override
  State<FishCatchDialog> createState() => _FishCatchDialogState();
}

class _FishCatchDialogState extends State<FishCatchDialog> {
  int tab_index = 0;
  var controllerName = TextEditingController();
  var controllerDate = TextEditingController();
  var controllerWeight = TextEditingController();
  var controllerLength = TextEditingController();
  var controllerMethod = TextEditingController();
  var controllerDesc = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BlocConsumer<AddFishCatchBloc, AddFishCatchState>(
          listener: (context, state) {
        if (state is AddFishCatchErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.addFishCatchMsgError!),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AddFishCatchLoadedState) {
          Get.to(const DetailPage());
        }
      }, builder: (context, state) {
        return SizedBox(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New catch",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (_) => const Center(
                                      child: FishCatchEditDialog(),
                                    ));
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )
                      ],
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
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        TextField(
                          controller: controllerName,
                          decoration: const InputDecoration(
                              hintText: "Enter catch name",
                              hintStyle: TextStyle(color: Colors.black87)),
                        ),
                        const SizedBox(height: 10),
                        const Text("Catch Date & Time",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        TextField(
                          controller: controllerDate,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.black,
                              ),
                              hintText: "Date and Time",
                              hintStyle: TextStyle(color: Colors.black87)),
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
                              String formattedDate = // 2023-08-18
                                  DateFormat('yyyy-MM-dd hh:mm a')
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
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        TextField(
                          controller: controllerWeight,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "Weight",
                              hintStyle: TextStyle(color: Colors.black87)),
                        ),
                        TextField(
                          controller: controllerLength,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "Length",
                              hintStyle: TextStyle(color: Colors.black87)),
                        ),
                        TextField(
                          controller: controllerMethod,
                          decoration: const InputDecoration(
                              hintText: "Fishingmethod",
                              hintStyle: TextStyle(color: Colors.black87)),
                        ),
                        TextField(
                          controller: controllerDesc,
                          decoration: const InputDecoration(
                              hintText: "Catch Description",
                              hintStyle: TextStyle(color: Colors.black87)),
                        ),
                        const SizedBox(height: 10),
                        getButtons("Catch Position",
                            "assets/icons/ic_location.png", () {}),
                        getButtons("Browse Species", "assets/icons/ic_fish.png",
                            () {}),
                        getButtons("Browse Images", "assets/icons/ic_image.png",
                            () {
                              _pickImage();
                          // showDialog(
                          //     barrierDismissible: true,
                          //     context: context,
                          //     builder: (_) => const Center(
                          //           child: ImageDialog(),
                          //         ));
                        }),
                      ],
                    ),
                  ),
                )),
                Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    height: 15.w,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: const Color(0xFF74B9FF),
                      elevation: 4,
                      shadowColor: Colors.white,
                      child: InkWell(
                        onTap: () {
                          BlocProvider.of<AddFishCatchBloc>(context).add(
                              FetchAddFishCatchEventEvent(
                                  name: controllerName.text,
                                  dateOfCatch: "2023-08-18" ,// controllerDate.text,
                                  timeOfCatch: "12:00 PM",
                                  weight: controllerWeight.text,
                                  length: controllerLength.text,
                                  method: controllerMethod.text,
                                  description:
                                  controllerDesc.text,
                                  position: "${{
                                    "lat": 37.774929,
                                    "lng": -122.419416,
                                    "address": "10, balakrishnan street"
                                  }}",
                                  images: _imageFile!.path,
                                  // "${[
                                  //   "https://5.imimg.com/data5/RO/TR/SX/SELLER-36867365/grasscarp-2-500x500.jpeg"
                                  // ]}",
                                  videos:
                                  "${[
                                    "https://images.all-free-download.com/footage_preview/mp4/clip_of_wild_salmon_swimming_under_stream_6892274.mp4"
                                  ]}",
                                  species: "64e332d3fb5e933cb428909e",
                                  likes: "${[]}",
                                  createdBy: "64a06251ba1b942c8aeeba9e",
                                  modifiedBy: "64a06251ba1b942c8aeeba9e"));
                        },
                        child: const Center(
                          child: Text("Next",
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
        );
      }),
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
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(title,
                    style: const TextStyle(color: Colors.black, fontSize: 15)),
              ],
            ),
          ),
        ));
  }
}
