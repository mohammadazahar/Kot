// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// // class Weather {
// //   final String city;
// //   final String description;
// //   final double temperature;
// //   final String icon;
// //
// //   Weather({
// //     required this.city,
// //     required this.description,
// //     required this.temperature,
// //     required this.icon,
// //   });
// // }
// // class Weather {
// //   final String cityName;
// //   final List<WeatherData> nextDays;
// //
// //   Weather({required this.cityName, required this.nextDays});
// // }
// //
// // class WeatherData {
// //   final String date;
// //   final String description;
// //   final double temperature;
// //   final double humidity;
// //   final double windSpeed;
// //
// //   WeatherData({
// //     required this.date,
// //     required this.description,
// //     required this.temperature,
// //     required this.humidity,
// //     required this.windSpeed,
// //   });
// // }
// //
// // class WeatherCard extends StatefulWidget {
// //   @override
// //   _WeatherCardState createState() => _WeatherCardState();
// // }
// //
// // class _WeatherCardState extends State<WeatherCard> {
// //   // late Weather _weather;
// //   // final String apiKey = "e6541a287fac93bb2ffc11be6059a18a";
// //   //
// //   // @override
// //   // void initState() {
// //   //   super.initState();
// //   //   _weather = Weather(
// //   //     city: "Loading...",
// //   //     description: "Loading...",
// //   //     temperature: 0.0,
// //   //     icon: "01d", // You can use a default icon code.
// //   //   );
// //   //   fetchWeatherForCurrentLocation();
// //   // }
// //   //
// //   // Future<void> fetchWeatherForCurrentLocation() async {
// //   //   final status = await Permission.location.request();
// //   //
// //   //   if (status == PermissionStatus.granted) {
// //   //     // Now you can fetch the location using Geolocator
// //   //     final Position position = await Geolocator.getCurrentPosition(
// //   //       desiredAccuracy: LocationAccuracy.high,
// //   //     );
// //   //     final double latitude = position.latitude;
// //   //     final double longitude = position.longitude;
// //   //
// //   //     final apiUrl = Uri.parse(
// //   //         'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey');
// //   //
// //   //     final response = await http.get(apiUrl);
// //   //
// //   //     if (response.statusCode == 200) {
// //   //       final data = json.decode(response.body);
// //   //       final weather = Weather(
// //   //         city: data['name'],
// //   //         description: data['weather'][0]['description'],
// //   //         temperature: data['main']['temp'],
// //   //         icon: data['weather'][0]['icon'],
// //   //       );
// //   //
// //   //       setState(() {
// //   //         _weather = weather;
// //   //       });
// //   //     } else {
// //   //       throw Exception('Failed to load weather data');
// //   //     }
// //   //   } else {
// //   //     // Handle permission denied
// //   //     print('Location permission denied');
// //   //   }
// //   // }
// //   //
// //   // @override
// //   // Widget build(BuildContext context) {
// //   //   return Scaffold(
// //   //     appBar: AppBar(
// //   //       title: Text('Weather App'),
// //   //     ),
// //   //     body: Center(
// //   //       child: _weather == null
// //   //           ? CircularProgressIndicator()
// //   //           : Column(
// //   //               mainAxisAlignment: MainAxisAlignment.center,
// //   //               children: <Widget>[
// //   //                 Text(
// //   //                   _weather.city,
// //   //                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //   //                 ),
// //   //                 SizedBox(height: 10),
// //   //                 Text(
// //   //                   _weather.description,
// //   //                   style: TextStyle(fontSize: 18),
// //   //                 ),
// //   //                 SizedBox(height: 10),
// //   //                 Text(
// //   //                   '${_weather.temperature.toStringAsFixed(1)}°C',
// //   //                   style: TextStyle(fontSize: 32),
// //   //                 ),
// //   //                 SizedBox(height: 10),
// //   //                 Image.network(
// //   //                   'https://openweathermap.org/img/w/${_weather.icon}.png',
// //   //                   width: 100,
// //   //                   height: 100,
// //   //                 ),
// //   //               ],
// //   //             ),
// //   //     ),
// //   //   );
// //   // }
// //   Weather? _weather;
// //   final String apiKey = "e6541a287fac93bb2ffc11be6059a18a";
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchWeatherForCurrentLocation();
// //   }
// //
// //   Future<void> fetchWeatherForCurrentLocation() async {
// //     final Position position = await Geolocator.getCurrentPosition(
// //       desiredAccuracy: LocationAccuracy.high,
// //     );
// //     final double latitude = position.latitude;
// //     final double longitude = position.longitude;
// //
// //     final apiUrl = Uri.parse(
// //       'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey',
// //     );
// //
// //     final response = await http.get(apiUrl);
// //
// //     if (response.statusCode == 200) {
// //       final data = json.decode(response.body);
// //       final cityName = data['city']['name'];
// //       final list = data['list'] as List<dynamic>;
// //
// //       final List<WeatherData> nextDays = [];
// //
// //       for (var i = 0; i < list.length; i += 8) {
// //         final item = list[i];
// //         final date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
// //         final description = item['weather'][0]['description'];
// //         final temperature = item['main']['temp'].toDouble(); // Explicit cast
// //         final humidity = item['main']['humidity'].toDouble(); // Explicit cast
// //         final windSpeed = item['wind']['speed'].toDouble(); // Explicit cast
// //
// //         final weatherData = WeatherData(
// //           date: '${date.day}/${date.month}',
// //           description: description,
// //           temperature: temperature,
// //           humidity: humidity,
// //           windSpeed: windSpeed,
// //         );
// //
// //         nextDays.add(weatherData);
// //       }
// //
// //       setState(() {
// //         _weather = Weather(cityName: cityName, nextDays: nextDays);
// //       });
// //     } else {
// //       throw Exception('Failed to load weather data');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Weather App'),
// //       ),
// //       body: Center(
// //         child: _weather == null
// //             ? CircularProgressIndicator()
// //             : Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Column(
// //                   children: <Widget>[
// //                     Card(
// //                       elevation: 4.0,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(12.0),
// //                       ),
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(16.0),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: <Widget>[
// //                             Text(
// //                               'Today in ${_weather!.cityName}',
// //                               style: TextStyle(
// //                                 fontSize: 20.0,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             SizedBox(height: 10.0),
// //                             Column(
// //                               children: _weather!.nextDays
// //                                   .map((weatherData) => Padding(
// //                                         padding: const EdgeInsets.all(8.0),
// //                                         child: Column(
// //                                           children: <Widget>[
// //                                             Text(
// //                                               weatherData.date,
// //                                               style: TextStyle(
// //                                                 fontSize: 16.0,
// //                                                 fontWeight: FontWeight.bold,
// //                                               ),
// //                                             ),
// //                                             SizedBox(height: 5.0),
// //                                             Text(weatherData.description),
// //                                             SizedBox(height: 5.0),
// //                                             Row(
// //                                               mainAxisAlignment:
// //                                                   MainAxisAlignment
// //                                                       .spaceBetween,
// //                                               children: <Widget>[
// //                                                 Text(
// //                                                   '${weatherData.temperature.toStringAsFixed(1)}°C',
// //                                                   style: TextStyle(
// //                                                     fontWeight: FontWeight.bold,
// //                                                   ),
// //                                                 ),
// //                                                 Text(
// //                                                     'Humidity: ${weatherData.humidity}%'),
// //                                                 Text(
// //                                                     'Wind: ${weatherData.windSpeed} m/s'),
// //                                               ],
// //                                             ),
// //                                           ],
// //                                         ),
// //                                       ))
// //                                   .toList(),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';
//
// class Weather {
//   final String cityName;
//   final List<WeatherData> nextDays;
//
//   Weather({required this.cityName, required this.nextDays});
// }
//
// class WeatherData {
//   final String day;
//   final String icon;
//   final String description;
//   final double temperature;
//   final double humidity;
//   final double windSpeed;
//
//   WeatherData({
//     required this.day,
//     required this.icon,
//     required this.description,
//     required this.temperature,
//     required this.humidity,
//     required this.windSpeed,
//   });
// }
//
// class WeatherCard extends StatefulWidget {
//   @override
//   _WeatherCardState createState() => _WeatherCardState();
// }
//
// class _WeatherCardState extends State<WeatherCard> {
//   Weather? _weather;
//   final String apiKey = "e6541a287fac93bb2ffc11be6059a18a";
//
//   @override
//   void initState() {
//     super.initState();
//     fetchWeatherForCurrentLocation();
//   }
//
//   Future<void> fetchWeatherForCurrentLocation() async {
//     final Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     final double latitude = position.latitude;
//     final double longitude = position.longitude;
//
//     final apiUrl = Uri.parse(
//       'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey',
//     );
//
//     final response = await http.get(apiUrl);
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final cityName = data['city']['name'];
//       final list = data['list'] as List<dynamic>;
//
//       final List<WeatherData> nextDays = [];
//
//       for (var i = 0; i < list.length; i += 8) {
//         final item = list[i];
//         final date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
//         final day = DateFormat('EEEE').format(date); // Day of the week
//         final icon = item['weather'][0]['icon'];
//         final description = item['weather'][0]['description'];
//         final temperature = item['main']['temp'].toDouble();
//         final humidity = item['main']['humidity'].toDouble();
//         final windSpeed = item['wind']['speed'].toDouble();
//
//         final weatherData = WeatherData(
//           day: day,
//           icon: icon,
//           description: description,
//           temperature: temperature,
//           humidity: humidity,
//           windSpeed: windSpeed,
//         );
//
//         nextDays.add(weatherData);
//       }
//
//       setState(() {
//         _weather = Weather(cityName: cityName, nextDays: nextDays);
//       });
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Weather App'),
//       ),
//       body: Center(
//         child: _weather == null
//             ? CircularProgressIndicator()
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Weather in ${_weather!.cityName}',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 16),
//                   ..._weather!.nextDays.map((weatherData) {
//                     return Card(
//                       elevation: 4.0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           children: <Widget>[
//                             Text(
//                               weatherData.day,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Image.network(
//                                   'https://openweathermap.org/img/w/${weatherData.icon}.png',
//                                   width: 50,
//                                   height: 50,
//                                 ),
//                                 SizedBox(width: 16),
//                                 Text(
//                                   weatherData.description,
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: <Widget>[
//                                 Text(
//                                   '${weatherData.temperature.toStringAsFixed(1)}°C',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Text('Humidity: ${weatherData.humidity}%'),
//                                 Text('Wind: ${weatherData.windSpeed} m/s'),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ],
//               ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:kot/custom_color.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class Weather {
  final String cityName;
  final List<WeatherData> nextDays;

  Weather({required this.cityName, required this.nextDays});
}

class WeatherData {
  final String day;
  final String icon;
  final String description;
  final double temperature;
  final double humidity;
  final double windSpeed;

  WeatherData({
    required this.day,
    required this.icon,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherCard(),
    );
  }
}

class WeatherCard extends StatefulWidget {
  const WeatherCard();
  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  Weather? _weather;
  final String apiKey = "e6541a287fac93bb2ffc11be6059a18a";

  @override
  void initState() {
    super.initState();
    fetchWeatherForCurrentLocation();
  }

  Future<void> fetchWeatherForCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final double latitude = position.latitude;
    final double longitude = position.longitude;

    final apiUrl = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey',
    );

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final cityName = data['city']['name'];
      final list = data['list'] as List<dynamic>;

      final List<WeatherData> nextDays = [];

      for (var i = 0; i < list.length; i += 8) {
        final item = list[i];
        final date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
        final day = DateFormat('EEEE').format(date); // Day of the week
        final icon = item['weather'][0]['icon'];
        final description = item['weather'][0]['description'];
        final temperature = item['main']['temp'].toDouble();
        final humidity = item['main']['humidity'].toDouble();
        final windSpeed = item['wind']['speed'].toDouble();

        final weatherData = WeatherData(
          day: day,
          icon: icon,
          description: description,
          temperature: temperature,
          humidity: humidity,
          windSpeed: windSpeed,
        );

        nextDays.add(weatherData);

        if (nextDays.length >= 4) {
          break; // Limit to 3 days
        }
      }

      setState(() {
        _weather = Weather(cityName: cityName, nextDays: nextDays);
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70.h,
          width: 90.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   border: Border.all(
          //     //   color: Colors.white,
          //     //color: CustomColor.colorPrimary,
          //     style: BorderStyle.solid,
          //     width: 1.0,
          //   ),
          // ),
          child: Column(
            children: [
              if (_weather != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Weather in ${_weather!.cityName}',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: _weather == null
                        ? [CircularProgressIndicator()]
                        : _weather!.nextDays.map((weatherData) {
                            return Card(
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      weatherData.day,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Image.network(
                                      'https://openweathermap.org/img/w/${weatherData.icon}.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      weatherData.description,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '${weatherData.temperature.toStringAsFixed(1)}°C',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Humidity: ${weatherData.humidity}%'),
                                    Text('Wind: ${weatherData.windSpeed} m/s'),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
