import 'package:flutter/material.dart';
import 'package:kot/community/data/model/community_model.dart';
import 'package:kot/community/presentation/widgets/community_card.dart';
import 'package:kot/core/network/api_provider.dart';
import 'package:kot/dashboard/card1.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<CommunityFeedItem>? feedTabData;
  List<CommunityFeedItem>? isPostData = []; // Initialize as an empty list
  List<CommunityFeedItem>? nonPostData = []; // Initialize as an empty list

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    CommunityFeedResponse response = await ApiProvider().feedList();
    print('data comes == ${response.data}');
    feedTabData = response.data;
    for (int i = 0; i < feedTabData!.length; i++) {
      if (feedTabData![i].isPost ?? false) {
        isPostData!.add(feedTabData![i]);
      } else {
        nonPostData!.add(feedTabData![i]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15.0, right: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            (isPostData == null || isPostData!.isEmpty)
                ? const SizedBox()
                : CommunityCard(
              image: isPostData!.first.community!.coverPhoto ?? "",
              title: "test1",
              nearLocation: "Delhi",
              peopleImage: "assets/imag_ppl.png",
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "What is happening near you",
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            nonPostData == null
                ? const CircularProgressIndicator()
                : nonPostData!.isEmpty
                ? const SizedBox()
                : SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: nonPostData!.length,
                  itemBuilder: (context, index) {
                    return Card1(
                      image: nonPostData![index].community!.coverPhoto,
                      title: nonPostData![index].community!.name ?? "",
                      peopleImage: "assets/imag_ppl.png",
                      subTitle: "test22",
                      fishCatch: nonPostData![index].fishCatch ?? "",
                      lakeType: "Sailboat Lake",
                      location: nonPostData![index].community!.location!.address ?? "",
                      nearLocation: nonPostData![index].community!.location!.address ?? "",
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
