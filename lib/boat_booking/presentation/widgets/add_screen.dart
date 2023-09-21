import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              backgroundColor: Colors.transparent,
              child: new Container(
                  alignment: FractionalOffset.center,
                  height: 80.0,
                  padding: const EdgeInsets.all(20.0),
                  child: new Image.asset(
                    'assets/images/image.jpg',
                    fit: BoxFit.cover,
                  )),
            ));
  }

  bool floatExtended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Container(
      //         alignment: FractionalOffset.center,
      //         height: 80.0,
      //         padding: const EdgeInsets.all(20.0),
      //         child: new Image.asset(
      //           'assets/community_icon.png',
      //           color: Colors.blue,
      //           fit: BoxFit.cover,
      //         )),
      //     Container(
      //         alignment: FractionalOffset.center,
      //         height: 80.0,
      //         padding: const EdgeInsets.all(20.0),
      //         child: new Image.asset(
      //           color: Colors.blue,
      //           'assets/community_icon.png',
      //           fit: BoxFit.cover,
      //         ))
      //   ],
      // ),
      // appbar with title text
      // appBar: AppBar(
      //   title: Text('AppBar Popup Menu Button'),
      //   // in action widget we have PopupMenuButton
      //   actions: [
      //     PopupMenuButton<int>(
      //       itemBuilder: (context) => [
      //         // PopupMenuItem 1
      //         PopupMenuItem(
      //           value: 1,
      //           // row with 2 children
      //           child: Row(
      //             children: [
      //               Icon(Icons.star),
      //               SizedBox(
      //                 width: 10,
      //               ),
      //               Text("Get The App")
      //             ],
      //           ),
      //         ),
      //         // PopupMenuItem 2
      //         PopupMenuItem(
      //           value: 2,
      //           // row with two children
      //           child: Row(
      //             children: [
      //               Icon(Icons.chrome_reader_mode),
      //               SizedBox(
      //                 width: 10,
      //               ),
      //               Text("About")
      //             ],
      //           ),
      //         ),
      //       ],
      //       offset: Offset(0, 100),
      //       color: Colors.grey,
      //       elevation: 2,
      //       // on selected we show the dialog box
      //       onSelected: (value) {
      //         // if value 1 show dialog
      //         if (value == 1) {
      //           _showDialog(context);
      //           // if value 2 show dialog
      //         } else if (value == 2) {
      //           _showDialog(context);
      //         }
      //       },
      //     ),
      //   ],
      // ),
      // body with centered text
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              alignment: FractionalOffset.center,
              height: 80.0,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/community_icon.png',
                    color: Colors.blue,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "Fish Catch",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
              alignment: FractionalOffset.center,
              height: 80.0,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.asset(
                    color: Colors.blue,
                    'assets/community_icon.png',
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "Book a Boat",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
