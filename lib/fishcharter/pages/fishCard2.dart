import 'package:flutter/material.dart';

class FishCard2 extends StatefulWidget {
  final String? image;
  final String? ppl;
  final String? feet;
  final String? personPrice;
  final String? description;
  final String? subTitle;

  FishCard2(
      {this.subTitle,
      this.image,
      this.ppl,
      this.feet,
      this.personPrice,
      this.description});

  @override
  State<FishCard2> createState() => _CardState();
}

class _CardState extends State<FishCard2> {
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
            Image.asset(
              widget.image!,
              width: double.infinity,
              height: 100,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.subTitle!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.description ?? "",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Spacer(),
                const SizedBox(width: 5),
                Text(
                  ".",
                  maxLines: 5,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  widget.feet ?? "",
                  maxLines: 5,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.ppl ?? "",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.personPrice ?? "",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
