import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class CustomClipBackground extends StatelessWidget {
  final double height;
  final Color color;

  CustomClipBackground({
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      // semi red clippath with more height and with 0.5 opacity
      opacity: 0.5,
      child: ClipPath(
        clipper: WaveClipper(),
        child: Container(
          color: color,
          height: height,
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
