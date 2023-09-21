import 'package:flutter/material.dart';

class ImageListCard extends StatefulWidget {
  final String? image;
  final String? title;
  const ImageListCard({super.key, this.image, this.title});

  @override
  State<ImageListCard> createState() => _ImageListCardState();
}

class _ImageListCardState extends State<ImageListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Image.asset(
              widget.image!,
              width: double.infinity,
              fit: BoxFit.fill,
              height: 80,
            ),
          ),
          Text(
            widget.title!,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
