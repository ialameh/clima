import 'package:flutter/material.dart';
import 'package:clima/screens/location.dart';
import 'package:clima/screens/weather_by_location.dart';
import 'package:http/http.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location currentLocation = new Location();

  @override
  void initState() {
    super.initState();

    
  }
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    WeatherByLocation wbl = WeatherByLocation();
    wbl.getURLInformation();

  }

  //String url = ';

  @override
  Widget build(BuildContext context) {
    //getURLInformation();
    print('reloaded');
    getLocation();

    return Scaffold();
  }
}
