import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    this.onPressed,
    required this.child,
    this.borderRadius = 10,
    this.color = const Color(0xFF74B9FF),
    this.elevation = 2,
    super.key,
  });
  final VoidCallback? onPressed;
  final Widget child;
  final double borderRadius;
  final double elevation;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: const BorderSide(color: Colors.white, width: 1),
        ),
        elevation: elevation,
      ),
      child: child,
    );
  }
}
