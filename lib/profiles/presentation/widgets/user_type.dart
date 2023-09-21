import 'package:flutter/material.dart';

class UserType extends StatefulWidget {
  String? text;
  String? image;
  UserType({super.key, this.text, this.image});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          widget.image!,
          width: 100,
          height: 143,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(widget.text!, style: TextStyle(fontSize: 14, color: Colors.blue))
      ],
    );
  }
}
