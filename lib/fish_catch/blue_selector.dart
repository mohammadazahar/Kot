import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BlueSelector extends StatelessWidget {

  BlueSelector({Key? key, required this.text,required this.call}) : super(key: key);
  String text;
  Function call;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 30,
      // height: 48,
      // width: 130,
      child:  InkWell(
        onTap: (){
          call();
        },
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Colors.white,
          elevation: 4,
          shadowColor: Colors.white,
          child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Color(0xFF74B9FF),
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
