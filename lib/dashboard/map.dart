import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/boat_booking/presentation/widgets/common_bottom.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: SvgPicture.asset(
          'assets/app_background.svg',
          fit: BoxFit.fill,
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 200,
        title: const Text(
          "Welcome",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.white,
      ),
    //  bottomNavigationBar: CommonBottom(selectedIndex: 2),
      body: Center(
        child: Text(
          "Comming Soon",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
