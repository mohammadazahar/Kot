import 'package:flutter/material.dart';
import 'package:kot/boat_booking/presentation/widgets/custom_buttons.dart';
import 'package:kot/boat_booking/presentation/widgets/search_widget.dart';
import 'package:kot/community/data/model/recommented_group.dart';
import 'package:kot/community/presentation/widgets/communit_banner_card/community_banner.dart';
import 'package:kot/core/network/api_provider.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  List<RecommendedCommunities>? groupData;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    RecommendedGroupResponse response = await ApiProvider().groupList();
    print('data comes == ${response.data}');
    groupData = response.data!.recommendedCommunities;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recommended groups",
                  style: TextStyle(
                      color: CustomColor.colorPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CommunityCardBanners(groupData: groupData ?? []),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Nearby groups",
                  style: TextStyle(
                      color: CustomColor.colorPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CommunityCardBanners(groupData: groupData ?? []),
                const SizedBox(
                  height: 10,
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: BorderButton(
                //         width: 80,
                //         height: 43,
                //         borderRadius: 12,
                //         backgroundColor: CustomColor.colorWhite,
                //         borderColor: CustomColor.bgEndGradient,
                //         onPressed: () {
                //           Navigator.pushNamed(context, MyRouters.creatingGroupScreen).then((value) {
                //             init();
                //           });
                //           //No action required in this scenario
                //         },
                //         title: const Text(
                //           "+ Create",
                //           style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.blue,
                //           ),
                //         ),
                //       )),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
