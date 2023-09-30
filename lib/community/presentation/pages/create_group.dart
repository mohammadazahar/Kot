import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/community/data/model/community_topic_response.dart';
import 'package:kot/community/data/model/create_group.dart';
import 'package:kot/community/data/model/user_list_response.dart';
import 'package:kot/community/presentation/pages/map_screen.dart';
import 'package:kot/community/presentation/widgets/customTextFormField.dart';
import 'package:kot/core/network/api_provider.dart';
import 'package:kot/custom_color.dart';

import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

import '../../../boat_booking/presentation/widgets/custom_buttons.dart';
import '../../../deals_new/widgets/custom_button.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final _groupNameController = TextEditingController();
  final _groupDescriptionController = TextEditingController();

  List<UserListData>? userListData;
  List<CommunityTopic>? communityTopicData;
  bool isPrivacy = true;
  List<String> selectedIds = [];

  UserListData? selectedPeopleValue;
  CommunityTopic? selectedTopicValue;

  final addressController = TextEditingController();

  var addressData = {};

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    UserListResponse response = await ApiProvider().userList();
    userListData = response.data;
    setState(() {});

    CommunityTopicsResponse communityTopicResponse =
        await ApiProvider().communityTopicList();
    communityTopicData = communityTopicResponse.data;
    setState(() {});
  }

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
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        SizedBox(
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
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                child: TextFormField(
                                  onTap: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MapWithMarker(),
                                      ),
                                    );
                                    if (result != null) {
                                      final latitude = result['latitude'];
                                      final longitude = result['longitude'];
                                      final address = result['address'];
                                      debugPrint('latitude $latitude');
                                      debugPrint('longitude $longitude');
                                      debugPrint('address $address');
                                      setState(() {
                                        addressController.text = address;
                                      });

                                      addressData = {
                                        "lat": latitude,
                                        "lng": longitude,
                                        "address": address
                                      };
                                    }
                                  },
                                  controller: addressController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Add group location (Optional)',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.normal,
                                      )),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   height: 50,
                            //   padding: const EdgeInsets.only(top: 10, left: 10),
                            //   margin: const EdgeInsets.all(5),
                            //   decoration: const BoxDecoration(
                            //       color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            //   child: const Text("Add group topic (Optional)",
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         color: Colors.blue,
                            //         fontWeight: FontWeight.normal,
                            //       )),
                            // ),

                            if (communityTopicData != null &&
                                communityTopicData!.isNotEmpty)
                              Container(
                                height: 50,
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<CommunityTopic>(
                                    value: selectedTopicValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedTopicValue = newValue;
                                      });
                                    },
                                    items: communityTopicData
                                        ?.map((item) =>
                                            DropdownMenuItem<CommunityTopic>(
                                              value: item,
                                              child: Text(item.name.toString()),
                                            ))
                                        .toList(),
                                    hint:
                                        const Text("Add group topic (Optional)",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.normal,
                                            )),
                                  ),
                                ),
                              ),

                            const SizedBox(
                              height: 10,
                            ),

                            if (userListData != null &&
                                userListData!.isNotEmpty)
                              // Container(
                              //   height: 50,
                              //   width: double.infinity,
                              //   padding: const EdgeInsets.symmetric(horizontal: 10),
                              //   decoration: const BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              //   child: DropdownButtonHideUnderline(
                              //     child: DropdownButton<UserListData>(
                              //       value: selectedPeopleValue,
                              //       onChanged: (newValue) {
                              //         setState(() {
                              //           selectedPeopleValue = newValue;
                              //         });
                              //       },
                              //       items: userListData
                              //           ?.map((item) =>
                              //           DropdownMenuItem<UserListData>(
                              //             value: item,
                              //             child: Text(item.phone.toString()),
                              //           ))
                              //           .toList(),
                              //       hint: const Text("+ Add People",
                              //           style: TextStyle(
                              //             fontSize: 16,
                              //             color: Colors.blue,
                              //             fontWeight: FontWeight.normal,
                              //           )),
                              //     ),
                              //   ),
                              // ),

                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: userListData
                                      ?.length, // Replace with your actual data length
                                  itemBuilder: (context, index) {
                                    final item = userListData![
                                        index]; // Replace with your data model
                                    return CheckboxListTile(
                                      title: Text(item.phone ?? ""),
                                      value: selectedIds.contains(item.sId),
                                      onChanged: (var selected) {
                                        setState(() {
                                          if (selected!) {
                                            selectedIds.add(item.sId!);
                                          } else {
                                            selectedIds.remove(item.sId!);
                                          }
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),

                            // Container(
                            //   width: double.infinity,
                            //   height: 50,
                            //   padding: const EdgeInsets.only(top: 10, left: 10),
                            //   //You can use EdgeInsets like above
                            //   margin: const EdgeInsets.all(5),
                            //   decoration: const BoxDecoration(
                            //       color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            //   child: const Text("+ Add People",
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         color: Colors.blue,
                            //         fontWeight: FontWeight.normal,
                            //       )),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomFilledButton(
                                    color: isPrivacy
                                        ? const Color(0xFF74B9FF)
                                        : Colors.transparent,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.public_off),
                                        Text(
                                          'Private',
                                          style: TextStyle(
                                              color: isPrivacy
                                                  ? Colors.white
                                                  : Colors.blue),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      isPrivacy = true;
                                      setState(() {});
                                    }),
                                CustomFilledButton(
                                    color: !isPrivacy
                                        ? const Color(0xFF74B9FF)
                                        : Colors.transparent,
                                    child: Row(children: [
                                      const Icon(Icons.public),
                                      Text(
                                        'Public',
                                        style: TextStyle(
                                            color: !isPrivacy
                                                ? Colors.white
                                                : Colors.blue),
                                      ),
                                    ]),
                                    onPressed: () {
                                      isPrivacy = false;
                                      setState(() {});
                                    }),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, bottom: 20.0),
                              child: BorderButton(
                                borderColor: CustomColor.colorPrimary,
                                onPressed: () async {
                                  Addcommunity response = await ApiProvider()
                                      .createCommunity(
                                          coverPhoto: '',
                                          description:
                                              _groupDescriptionController.text,
                                          privacy: isPrivacy,
                                          name: _groupNameController.text,
                                          location: addressData,
                                          people: selectedIds);

                                  if (response.message ==
                                      'Community added successfully!') {
                                    ToastHelper.showToast(
                                        response.message ?? "");
                                    if (mounted) {
                                      Navigator.pop(context);
                                    }
                                  }
                                },
                                backgroundColor: CustomColor.colorPrimary,
                                borderRadius: 8,
                                width: (MediaQuery.of(context).size.width) - 30,
                                height: 40,
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
