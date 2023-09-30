import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:kot/custom_color.dart';
import 'package:kot/deals_new/widgets/custom_button.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/profiles/presentation/bloc/profile_bloc.dart';
import 'package:kot/profiles/presentation/bloc/profile_state.dart';
import 'package:kot/toastHelper.dart';

import '../../../boat_booking/presentation/widgets/custom_buttons.dart';
import '../../../community/presentation/widgets/customTextFormField.dart';
import '../bloc/profile_event.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _groupFirstNameController = TextEditingController();
  final _groupLastNameController = TextEditingController();
  final _groupDateOfBirthController = TextEditingController();
  final _groupEmailController = TextEditingController();
  final _groupMobileNumberController = TextEditingController();
  final _groupAddressController = TextEditingController();
  final _groupZipCodeController = TextEditingController();
  final _groupCityController = TextEditingController();
  final _groupChangePasswordController = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
          body: BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
        if (state is ProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msgError!),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is ProfileLoadedState) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => BinahSuccessView(
          //
          //     ),
          //   ),
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'successfully updated profile details',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      }, builder: (context, state) {
        return Stack(
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
              padding: const EdgeInsets.only(top: 35, left: 15.0, right: 15.0),
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
                        'My Account',
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
                    child: Center(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50, // Adjust the radius as needed
                                backgroundColor: Colors
                                    .transparent, // Add this line to make the background transparent
                                child: ClipOval(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: _imageFile != null
                                        ? Image.file(_imageFile!,
                                            fit: BoxFit.cover)
                                        : Image.asset(
                                            "assets/images/img_profile14.png",
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    _pickImage();
                                  },
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text("Pawani",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue))
                        ],
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 50.0),
                  //   child: Center(
                  //     child: Column(
                  //       children: [
                  //         Image.asset(
                  //           "assets/images/img_profile14.png",
                  //           width: 100,
                  //           height: 143,
                  //         ),
                  //         const SizedBox(
                  //           height: 2,
                  //         ),
                  //         const Text("Pawani",
                  //             style:
                  //                 TextStyle(fontSize: 14, color: Colors.blue))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFilledButton(
                          child: Column(
                            children: const [
                              Text('140'),
                              Text('Following'),
                            ],
                          ),
                          onPressed: () {}),
                      CustomFilledButton(
                          child: Column(
                            children: const [
                              Text('140'),
                              Text('Following'),
                            ],
                          ),
                          onPressed: () {}),
                      CustomFilledButton(
                          child: Column(
                            children: const [
                              Text('140'),
                              Text('Following'),
                            ],
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            textController: _groupFirstNameController,
                            //  labelText: "Group Name",
                            hintText: "Name",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            textController: _groupLastNameController,
                            //  labelText: "Group Description",
                            hintText: "Last Name",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            textController: _groupDateOfBirthController,
                            //  labelText: "Group Description",
                            hintText: "Date of Birth",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            textController: _groupEmailController,
                            //  labelText: "Group Description",
                            hintText: "Email",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            textController: _groupMobileNumberController,
                            //  labelText: "Group Description",
                            hintText: "Mobile Number",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            textController: _groupAddressController,
                            //  labelText: "Group Description",
                            hintText: "Address",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            textController: _groupZipCodeController,
                            //  labelText: "Group Description",
                            hintText: "ZipCode",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            textController: _groupCityController,
                            //  labelText: "Group Description",
                            hintText: "City",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            textController: _groupChangePasswordController,
                            //  labelText: "Group Description",
                            hintText: "Change Password",
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.only(
                                top: 10,
                                left: 10), ////You can use EdgeInsets like above
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
                          CustomTextFormField(
                            textController: _groupLastNameController,
                            //  labelText: "Group Description",
                            hintText: "Delete My Account",
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.only(
                                top: 10,
                                left: 10), ////You can use EdgeInsets like above
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
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.only(
                                top: 10,
                                left: 10), ////You can use EdgeInsets like above
                            margin: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: const Text("+ Add Language",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 20.0),
                            child: BorderButton(
                              borderColor: CustomColor.colorPrimary,
                              onPressed: () {
                                _groupFirstNameController.clear();
                                _groupLastNameController.clear();
                                _groupCityController.clear();
                                _groupZipCodeController.clear();
                                _groupAddressController.clear();
                                _groupChangePasswordController.clear();
                                _groupDateOfBirthController.clear();
                                _groupEmailController.clear();
                                _groupMobileNumberController.clear();
                                BlocProvider.of<ProfileBloc>(context)
                                    .add(FetchProfileEvent(
                                  id: "64b57a4b30eb00393e49b530",
                                  firstName: _groupFirstNameController.text,
                                  lastName: _groupLastNameController.text,
                                  address: _groupAddressController.text,
                                  zip: _groupZipCodeController.text,
                                  city: _groupCityController.text,
                                  photo: _imageFile!.path,
                                  // "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
                                  interests: "${[
                                    "64e46514f2df61197c765389",
                                    "64e464c3f78397034ee426ba",
                                    "64e497f0c5ffb8fbc19c8220"
                                  ]}",
                                  auto_play: "${true}",
                                  mobile_data: "${false}",
                                  wifi: "${true}",
                                  push: "${true}",
                                  mail: "${false}",
                                  sms: "${true}",
                                  community_notifications: "${false}",
                                  daily_briefing: "${true}",
                                  notify_nearby_hotspots: "${true}",
                                  notification_from_followers: "${true}",
                                ));

                                // ToastHelper.showToast("created group");
                              },
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
        );
      })),
    );
  }
}
