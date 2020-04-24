import 'package:flutter/material.dart';
import 'package:clima/screens/location.dart';
import 'package:clima/screens/weather_by_location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location currentLocation = new Location();

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    WeatherByLocation wbl = WeatherByLocation();
    Map weatherData = await wbl.getResponse();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 160),
      ),
    );
  }
}
