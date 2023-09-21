import 'package:flutter/material.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key});

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  bool floatExtended = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: FloatingActionButton.extended(
          tooltip: 'Create Card',
          shape: RoundedRectangleBorder(),
          disabledElevation: 0,
          elevation: 12,
          label: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.save)),
                  Text("text"),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.save)),
                  Text("text"),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.save)),
                  Text("text"),
                ],
              ),
              //  IconButton(onPressed: () {}, icon: Icon(Icons.library_add_check)),

              // Text('1'),
              // Text('2'),
              // Text('3'),
            ],
          ),
          isExtended: floatExtended,
          // icon: Icon(
          //   Icons.add,
          //   color: floatExtended == true ? Colors.red : Colors.black,
          // ),
          onPressed: () {
            setState(() {
              floatExtended = !floatExtended;
            });
          },
          backgroundColor: Colors.transparent),
    );
  }
}
