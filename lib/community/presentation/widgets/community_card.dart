import 'package:flutter/material.dart';
import 'package:kot/custom_color.dart';
import 'package:share_plus/share_plus.dart';

import '../../../boat_booking/presentation/widgets/custom_buttons.dart';

class CommunityCard extends StatefulWidget {
  final String? image;
  final String? peopleImage;
  final double? cardWidth;
  final String? nearLocation;
  final double? cardHeight;
  final String? location;
  final String? title;

  //final String? totalMem;
  const CommunityCard({
    super.key,
    this.image,
    this.cardHeight,
    this.cardWidth,
    this.title,
    this.peopleImage,
    this.nearLocation,
    this.location,
    //this.totalMem
  });

  @override
  State<CommunityCard> createState() => _CommunityCardState();
}

class _CommunityCardState extends State<CommunityCard> {
  bool isLike = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _shareContent(BuildContext context) {
    Share.share('Hello, this is the text to share!',
        subject: 'Share Text', // Optional subject for the shared content
        sharePositionOrigin: Rect.fromCenter(
          center: const Offset(0, 0),
          width: 50,
          height: 50,
        )).then((result) {
      // // Handle the result of the share action, if needed
      // if (result == ShareResult.shared) {
      //   // Content shared successfully
      // } else if (result == ShareResult.closed) {
      //   // Dialog was closed without sharing
      // } else {
      //   // Sharing failed or was canceled
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // child: Image.network(
      //   'https://placeimg.com/640/480/any',
      //   fit: BoxFit.fill,
      // ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Column(
          //  alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //     color: CustomColor.colorPrimaryDark, width: 1.5),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: CircleAvatar(
                      radius: 10,
                      backgroundColor: CustomColor.colorWhite,
                      child: Image.asset(
                        widget.peopleImage!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      )

                      // FutureBuilder(
                      //     future: UtilHelper.getImage(),
                      //     builder: (BuildContext context,
                      //         AsyncSnapshot<String> image) {
                      //       //TODO API intergration
                      //       //   url = image.data ?? "";
                      //       return CachedNetworkImage(
                      //         imageUrl: widget.peopleImage!,
                      //         width: 50,
                      //         height: 50,
                      //         fit: BoxFit.fill,
                      //       );
                      //       //
                      //       // url != ''
                      //       //   ? ClipRRect(
                      //       //       borderRadius: BorderRadius.circular(50),
                      //       //       child: CachedNetworkImage(
                      //       //         imageUrl: "url",
                      //       //         width: MediaQuery.of(context).size.width,
                      //       //         height: MediaQuery.of(context).size.height,
                      //       //         fit: BoxFit.cover,
                      //       //       ),
                      //       //     )
                      //       //   : FutureBuilder(
                      //       //       future: UtilHelper.getInitials(),
                      //       //       builder: (BuildContext context,
                      //       //           AsyncSnapshot<String> text) {
                      //       //         return new Text(
                      //       //           text.data ?? "",
                      //       //           style: TextStyle(
                      //       //               fontWeight: FontWeight.bold,
                      //       //               fontSize: 26,
                      //       //               color: CustomColor.colorBlack),
                      //       //         );
                      //       //       });
                      //     }),
                      ),
                ),
                // const Spacer(),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.title ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.nearLocation ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      ),
                      // Text(
                      //   widget.location ?? "",
                      //   style: const TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.normal),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/images/dots_main.png",
                    fit: BoxFit.cover,
                    // height: 250,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Image.network(
              widget.image!,
              fit: BoxFit.cover,
              // height: 250,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLike = !isLike; // Toggle the value
                      });
                    },
                    child: Icon(
                      isLike ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                      color: CustomColor.colorPrimary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.chat,
                      color: CustomColor.colorPrimary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _shareContent(context);
                    },
                    child: const Icon(
                      Icons.share,
                      color: CustomColor.colorPrimary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  // Text(
                  //   widget.totalMem!,
                  //   style: TextStyle(color: Colors.white, fontSize: 15),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BorderButton(
                      borderColor: CustomColor.colorPrimary,
                      onPressed: () {},
                      backgroundColor: CustomColor.colorPrimary,
                      borderRadius: 8,
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      title: Text(
                        "catch details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColor.colorWhite,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),

            // Positioned.fill(
            //   top: 130,
            //   //  bottom: 30,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 12, bottom: 8),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           widget.title!,
            //           style: TextStyle(color: Colors.white, fontSize: 15),
            //         ),
            //         const SizedBox(
            //           height: 5,
            //         ),
            //         const Align(
            //           alignment: Alignment.topRight,
            //           child: Icon(
            //             Icons.chat,
            //             color: CustomColor.colorPrimary,
            //             size: 50,
            //           ),
            //         ),
            //         const Icon(
            //           Icons.share,
            //           color: CustomColor.colorPrimary,
            //           size: 50,
            //         ),
            //         // Text(
            //         //   widget.totalMem!,
            //         //   style: TextStyle(color: Colors.white, fontSize: 15),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
