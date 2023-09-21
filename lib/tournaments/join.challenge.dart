import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/deals/presentation/widgets/custom_button.dart';
import 'package:kot/deals/presentation/widgets/custom_textfield.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';
import 'package:kot/widgets/custom_dropdown.dart';

class JoinTournamentScreen extends StatefulWidget {
  const JoinTournamentScreen({super.key});

  @override
  State<JoinTournamentScreen> createState() => _JoinTournamentScreenState();
}

class _JoinTournamentScreenState extends State<JoinTournamentScreen> {
  late TextEditingController nameController,
      emailController,
      phoneController,
      locationController,
      speciesController,
      weightController,
      lengthController,
      descriptionController,
      priceController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    locationController = TextEditingController();
    speciesController = TextEditingController();
    weightController = TextEditingController();
    lengthController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shadowColor: Colors.transparent,
      //   backgroundColor: const Color(0xFF74B9FF),
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.adaptive.arrow_back,
      //       color: Colors.white,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.person_rounded,
      //         color: Colors.white,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.notifications,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      //   title: const Text(
      //     'Join Tournment',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // The containers in the background
            Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/app_background.svg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
                // Container(
                //   height: 250,
                //   color: Colors.white,
                // )
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, right: 25.0, left: 20.0, bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      //  key: ConstantsValues.searchKey,
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: SearchWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/tBanner.png',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FilledTextField(
                              controller: nameController,
                              hint: 'Name',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FilledTextField(
                              controller: emailController,
                              hint: 'Email',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FilledTextField(
                              controller: phoneController,
                              hint: 'Phone',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FilledTextField(
                              controller: locationController,
                              hint: 'Location',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomDropDown(
                              items: const [
                                'Species Name 1',
                                'Species Name 2',
                                'Species Name 3',
                                'Species Name 4',
                              ],
                              hint: 'Species',
                              onChanged: (value) {
                                setState(() {
                                  speciesController.text = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FilledTextField(
                              controller: weightController,
                              hint: 'Weight',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FilledTextField(
                              controller: lengthController,
                              hint: 'Length',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FilledTextField(
                              controller: descriptionController,
                              hint: 'Description',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomDropDown(
                              items: const [
                                '\$ 200',
                                '\$ 400',
                              ],
                              hint: 'Price',
                              onChanged: (value) {
                                setState(() {
                                  priceController.text =
                                      value.replaceAll('\$ ', '');
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            child: CustomFilledButton(
                              child: const Text('Join Tournament'),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MyRouters.thanksScreenTournament);
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
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
