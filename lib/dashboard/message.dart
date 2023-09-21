import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: SvgPicture.asset(
            'assets/app_background.svg',
            fit: BoxFit.fill,
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          title: const Text(
            "Welcome",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.white,
        ),
        //  bottomNavigationBar: CommonBottom(selectedIndex: 1),
        body: const Center(
          child: Text(
            "Comming Soon....",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        )
        //
        // SingleChildScrollView(
        //   child: Stack(
        //     children: [
        //       SvgPicture.asset(
        //         'assets/app_background.svg',
        //         fit: BoxFit.fill,
        //         width: double.infinity,
        //         height: 250,
        //       ),
        //       Positioned.fill(
        //           top: 50,
        //           child: Padding(
        //             padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     Image.asset(
        //                       "assets/splash_screen_bg.png",
        //                       height: 30,
        //                       width: 30,
        //                       //  height: MediaQuery.of(context).size.height - 150,
        //                     ),
        //                     Icon(Icons.notification_add),
        //                     Icon(Icons.people),
        //                   ],
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(left: 15, right: 15),
        //                   //  key: ConstantsValues.searchKey,
        //                   margin: EdgeInsets.only(
        //                     top: 15,
        //                   ),
        //                   child: SearchWidget(),
        //                 ),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 _getSingleCard(),
        //                 // SizedBox(
        //                 //   height: 10,
        //                 // ),
        //                 // Container(
        //                 //   height: 50,
        //                 //   child: ListView.builder(
        //                 //     physics: AlwaysScrollableScrollPhysics(),
        //                 //     shrinkWrap: true,
        //                 //     itemCount: 5,
        //                 //     itemBuilder: (context, index) {
        //                 //       return Card1(
        //                 //         image: "https://picsum.photos/seed/picsum/200/300",
        //                 //         title: "test1",
        //                 //         peopleImage: "https://picsum.photos/seed/picsum/200/300",
        //                 //         subTitle: "test22",
        //                 //         fishCatch: "7.5 catches",
        //                 //         lakeType: "Sailboat Lake",
        //                 //         location: "usa",
        //                 //         nearLocation: "test111",
        //                 //       );
        //                 //     },
        //                 //   ),
        //                 // )
        //               ],
        //             ),
        //           )),
        //     ],
        //   ),
        // ),
        );
  }
}
