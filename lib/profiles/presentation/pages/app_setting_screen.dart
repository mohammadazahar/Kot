import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/community/presentation/widgets/customTextFormField.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({super.key});

  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
              padding: const EdgeInsets.only(top: 50, left: 15.0, right: 15.0),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/img_profile14.png",
                            width: 100,
                            height: 143,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text("Test",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue))
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
                          Card(
                            elevation: 10,
                            child: ListTile(
                              onTap: () {
                                ToastHelper.showToast("Comming Soon");
                              },
                              title: const Text(
                                'Manage Profile',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 10,
                            child: ListTile(
                              onTap: () {
                                ToastHelper.showToast("Comming Soon");
                              },
                              title: const Text(
                                'Privacy',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 10,
                            child: ListTile(
                              onTap: () {
                                ToastHelper.showToast("Comming Soon");
                              },
                              title: const Text(
                                'Auto Play Videos',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 10,
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRouters.faqsScreen);
                                // ToastHelper.showToast("Comming Soon");
                              },
                              title: const Text(
                                'FAQs',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 10,
                            child: ListTile(
                              onTap: () {
                                _showLogoutDialog(context);
                              },
                              title: const Text(
                                'Log Out',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal),
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
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Card(
          child: AlertDialog(
            title: Text("Logout"),
            content: Text("Are you sure you want to log out?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("No"),
              ),
              TextButton(
                onPressed: () {
                  // Implement your logout logic here
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Yes"),
              ),
            ],
          ),
        );
      },
    );
  }
}
