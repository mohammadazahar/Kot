import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kot/fish_catch/page/intrest_page.dart';
import 'package:sizer/sizer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;
  final LatLng _center = const LatLng(22.3039, 70.8022);
  var controllerSearch = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: [
            Positioned.fill(
                child: GoogleMap(
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            )),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset.zero)
                      ]),
                  child: Container(
                    height: 5.h,
                    child: TextField(
                      controller: controllerSearch,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          hintText: "Enter catch name",
                          hintStyle: TextStyle(color: Colors.black87)),
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 75,
                width: 75,
                margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
                child: GestureDetector(
                  onTap: () {
                    Get.to(IntrestPage());
                  },
                  child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      color: Colors.white,
                      elevation: 4,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Image.asset('assets/icons/floting_fish.png'),
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
