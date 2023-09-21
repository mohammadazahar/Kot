import 'package:flutter/material.dart';
import 'package:kot/custom_color.dart';

class BorderButton extends StatelessWidget {
  final Widget? title;
  final Function? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsets? padding;

  BorderButton({
    @required this.title,
    @required this.onPressed,
    this.backgroundColor = Colors.white54,
    this.borderColor = CustomColor.holoGrey,
    this.width,
    this.fontSize = 12,
    this.height = 30,
    this.borderRadius = 5,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(color: borderColor, width: 1),
      ),
      height: height,
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                padding ?? EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ))),
        onPressed: onPressed as void Function()?,
        child: Center(
          child: title,
        ),
      ),
    );
  }
}
