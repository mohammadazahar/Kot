import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/toastHelper.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/images/queen.svg',
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '2',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Color(0xFF74B9FF),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '2',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/images/fish.svg',
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '5',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
