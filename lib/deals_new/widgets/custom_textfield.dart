import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  const FilledTextField({required this.controller, this.hint, super.key});
  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          //  prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
