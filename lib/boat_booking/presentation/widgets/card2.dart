import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom_color.dart';

class Card2 extends StatefulWidget {
  final String? image;
  final String? title;
  final bool isDynamic;
  const Card2({this.image, this.title, this.isDynamic = false});

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              if (widget.isDynamic == false)
                Expanded(
                    child: SizedBox(
                  height: 100,
                  child: Image.asset(
                    widget.image!,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 80,
                  ),
                ))
              else
                Expanded(
                    child: SizedBox(
                  height: 100,
                  child: CachedNetworkImage(
                    imageUrl: widget.image ?? "",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                )),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: CustomColor.colorPrimary,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  widget.title!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
