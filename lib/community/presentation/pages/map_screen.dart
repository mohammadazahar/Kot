import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as prefix;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapWithMarker extends StatefulWidget {
  const MapWithMarker({super.key});

  @override
  _MapWithMarkerState createState() => _MapWithMarkerState();
}

class _MapWithMarkerState extends State<MapWithMarker> {
  final Location _location = Location();
  String selectedAddress = '';
  LatLng? _currentLocation;
  prefix.Placemark? _selectedPlacemark;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _returnDataToClassA() {
    Navigator.pop(context, {
      'latitude': _currentLocation?.latitude,
      'longitude': _currentLocation?.longitude,
      'address': selectedAddress
    });
  }

  Future<void> _onMapTapped(TapPosition tapPosition, LatLng position) async {
    setState(() {
      _currentLocation = position;
    });
    setAddress(position.latitude, position.longitude);
  }

  setAddress(double latitude, double longitude) async {
    try {
      List<prefix.Placemark> placeMarks = await prefix.placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placeMarks.isNotEmpty) {
        _selectedPlacemark = placeMarks[0];
        selectedAddress = _selectedPlacemark!.street ?? "";
      } else {
        _selectedPlacemark = null;
        selectedAddress = '';
      }
    } catch (e) {
      debugPrint("Error reverse geocoding: $e");
      _selectedPlacemark = null;
      selectedAddress = '';
    }
  }

  Future<void> _getLocation() async {
    try {
      var position = await _location.getLocation();
      setState(() {
        _currentLocation = LatLng(position.latitude!, position.longitude!);
      });
      setAddress(position.latitude!, position.longitude!);
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
  }

  void _moveMarkerToPosition(LatLng newPosition) {
    setState(() {
      _currentLocation = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _currentLocation == null
              ? const Center(child: CircularProgressIndicator())
              : FlutterMap(
                  options: MapOptions(
                      center: _currentLocation,
                      zoom: 15.0,
                      onTap: _onMapTapped),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 30.0,
                          height: 30.0,
                          point: _currentLocation!,
                          builder: (ctx) => const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: () {
                _returnDataToClassA();
              },
              child: const CircleAvatar(
                child: Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getLocation();
        },
        child: Column(
          children: [
            const Icon(Icons.my_location),
          ],
        ),
      ),
    );
  }
}
