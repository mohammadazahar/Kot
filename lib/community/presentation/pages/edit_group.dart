import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/custom_color.dart';

import 'package:kot/deals_new/widgets/custom_button.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import '../../../boat_booking/presentation/widgets/custom_buttons.dart';
import '../widgets/customTextFormField.dart';

class EditGroup extends StatefulWidget {
  const EditGroup({super.key});

  @override
  State<EditGroup> createState() => _EditGroupState();
}

class _EditGroupState extends State<EditGroup> {
  final _groupNameController = TextEditingController();
  final _groupDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/app_background.svg"),
                  fit: BoxFit.fitWidth)),
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
              Padding(
                padding:
                    const EdgeInsets.only(top: 35, left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Create Group',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        //color: Colors.white,
                        width: 334,
                        height: 145,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              "assets/camer_png.png",
                              width: 58,
                              height: 53,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("Upload cover photo",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextFormField(
                              textController: _groupNameController,
                              //  labelText: "Group Name",
                              hintText: "Group Name",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              textController: _groupDescriptionController,
                              //  labelText: "Group Description",
                              hintText: "Group Description",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.only(
                                  top: 10,
                                  left:
                                      10), ////You can use EdgeInsets like above
                              margin: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              child: const Text("Add group location (Optional)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10), //You can use EdgeInsets like above
                              margin: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: const Text("Add group topic (Optional)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10), //You can use EdgeInsets like above
                              margin: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: const Text("+ Add People",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomFilledButton(
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.public_off,
                                        ),
                                        Text('Private'),
                                      ],
                                    ),
                                    onPressed: () {}),
                                CustomFilledButton(
                                    child: Row(children: const [
                                      Icon(
                                        Icons.public,
                                      ),
                                      Text('Public'),
                                    ]),
                                    onPressed: () {}),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, bottom: 20.0),
                              child: BorderButton(
                                borderColor: CustomColor.colorPrimary,
                                onPressed: () {},
                                backgroundColor: CustomColor.colorPrimary,
                                borderRadius: 8,
                                width: (MediaQuery.of(context).size.width) - 30,
                                height: 40,
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Create",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: CustomColor.colorWhite,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    )
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
