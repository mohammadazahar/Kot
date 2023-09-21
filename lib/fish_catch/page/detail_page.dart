import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:kot/fish_catch/fish_catch_dialog1.dart';

import 'package:sizer/sizer.dart';

import '../blue_selector.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var controllerSearch = TextEditingController();
  var isAll = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset('assets/icons/bg_shap.png', fit: BoxFit.fill)),
          Positioned(
              top: 8.h,
              right: 2.h,
              left: 2.h,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: InkWell(
                                child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 28,
                            ))),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Fish catch",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Icon(Icons.account_circle,
                            color: Colors.white, size: 28),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.notifications,
                            color: Colors.white, size: 28),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset.zero)
                            ]),
                        child: Container(
                          height: 5.h,
                          child: TextField(
                            controller: controllerSearch,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.blue,
                                ),
                                hintText: "",
                                hintStyle: TextStyle(color: Colors.black87)),
                          ),
                        )),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        getButtons("Recent", !isAll, () {
                          isAll = false;
                          setState(() {});
                        }),
                        getButtons("All", isAll, () {
                          isAll = true;
                          setState(() {});
                        })
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Colors.white,
                      elevation: 4,
                      shadowColor: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(14),
                        width: 90.w,
                        height: 27.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Grass Crap",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: Center(
                                    child: Image.asset(
                              'assets/icons/fish_video_dummy.jpeg',
                            ))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("14/03/2023  01:30 pm",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.black26,
                            height: 3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Boat Fishing",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14)),
                              Expanded(child: SizedBox()),
                              Text("70 cm",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14)),
                              SizedBox(
                                width: 10,
                              ),
                              Text("6.4 kg",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.black26,
                            height: 3,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("17.4763961, 78.3634078",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14)),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Divider(
                            color: Colors.black26,
                            height: 3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Description",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.black26,
                            height: 3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset('assets/icons/ic_pok.png'),
                              SizedBox(
                                width: 8,
                              ),
                              Image.asset('assets/icons/ic_chat.png'),
                              const Expanded(child: SizedBox()),
                              Image.asset('assets/icons/ic_share.png'),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget getButtons(String title, bool isSelected, Function function) {
    return SizedBox(
        height: 15.w,
        width: 44.w,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14))),
          color: isSelected ? Color(0xFF74B9FF) : Colors.white,
          elevation: 4,
          shadowColor: Colors.white,
          child: InkWell(
            onTap: () {
              function();
            },
            child: Center(
              child: Text(title,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Color(0xFF74B9FF),
                      fontSize: 15)),
            ),
          ),
        ));
  }

  void showDetailDialog(BuildContext context) {
    Navigator.pop(context);
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) => const Center(
              child: FishCatchDialog(),
            ));
  }
}
