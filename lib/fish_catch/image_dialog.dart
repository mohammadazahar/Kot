import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({super.key});

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  int tab_index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 94.w,
      child: Container(
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Colors.white,
          elevation: 4,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            tab_index = 0;
                          });
                        },
                        child: Column(
                          children: [
                            const Text(
                              "Image Gallery",
                              style: TextStyle(fontSize: 16),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: tab_index == 0 ? 100 : 0,
                              height: 3,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            tab_index = 1;
                          });
                        },
                        child: Column(
                          children: [
                            const Text(
                              "Video Gallery",
                              style: TextStyle(fontSize: 16),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: tab_index == 1 ? 100 : 0,
                              height: 3,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      )),
                ],
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 3 / 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(child: Image.asset(
                            tab_index == 0 ? 'assets/icons/dummy_img.jpeg' : 'assets/icons/fish_video_dummy.jpeg',
                            fit: BoxFit.fill,
                          )
                          ),
                          Positioned(
                            child:Visibility(
                            visible: tab_index != 0,
                            child:Image.asset('assets/icons/ic_play.png',
                                 height:50,
                                width:50)
                          ))
                        ],
                      )
                    );
                  },
                ),
              )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                height: 15.w,
                  child:  Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: const Color(0xFF74B9FF),
                    elevation: 4,
                    shadowColor: Colors.white,
                    child: InkWell(
                      onTap: (){},
                      child: const Center(
                        child: Text("Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
