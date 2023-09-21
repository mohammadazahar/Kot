import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? textController;
  final String? labelText;
  final String? hintText;
  const CustomTextFormField(
      {super.key, this.hintText, this.labelText, this.textController});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(
            horizontal: 10), //You can use EdgeInsets like above
        margin: EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: TextField(
          controller: widget.textController,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            // focusedBorder: InputBorder.none,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20.0),
            //   borderSide: const BorderSide(
            //     color: Colors.white,
            //   ),
            // ),
            //    labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.normal), //hint text style
            labelStyle: const TextStyle(fontSize: 13, color: Colors.blue),
          ),
          //  onChanged: _validateEmail,
        ),
      ),
    );
  }
}
