import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kot/boat_booking/presentation/widgets/custom_buttons.dart';
import '../core/util/utilhelper.dart';
import '../custom_color.dart';

class Card1 extends StatefulWidget {
  final String? image;
  final String? peopleImage;
  final String? fishCatch;
  final String? location;
  final String? nearLocation;
  final String? lakeType;
  final String? title;
  final String? subTitle;

  Card1(
      {this.image,
      this.peopleImage,
      this.fishCatch,
      this.lakeType,
      this.location,
      this.nearLocation,
      this.title,
      this.subTitle});

  @override
  State<Card1> createState() => _CardState();
}

class _CardState extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 250,
      width: 150,
      // decoration: BoxDecoration(
      //     border: Border.all(color: CustomColor.colorPrimaryDark, width: 1),
      //     borderRadius: BorderRadius.circular(10)
      // ),
      // margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              widget.image!,
              width: 150,
              height: 80,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 10,
                    backgroundColor: CustomColor.colorWhite,
                    child: Image.asset(
                      widget.peopleImage!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    )),
                // const Spacer(),
                const SizedBox(width: 5),
                Text(
                  widget.title ?? "",
                  maxLines: 5,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              widget.nearLocation ?? "",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 5),
            Text(
              widget.fishCatch ?? "",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            const Text(
              "Often Fishes in",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              widget.lakeType ?? "",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BorderButton(
                borderColor: CustomColor.colorPrimary,
                onPressed: () {},
                backgroundColor: CustomColor.colorPrimary,
                borderRadius: 8,
                width: MediaQuery.of(context).size.width,
                height: 40,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Follow",
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
    );
  }
}
