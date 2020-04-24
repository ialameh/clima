import 'package:http/http.dart' as http;
import 'package:clima/screens/location.dart';
import 'dart:convert';
import 'package:clima/services/weather.dart';

class WeatherByLocation {
  Location location = Location();
  WeatherModel weatherModel = WeatherModel();
  
  Future<Map> getResponse() async {
    String apiKey = '4602fc067646ed034c3f15dd642c9298';
    String url =
      'https://api.openweathermap.org/data/2.5/weather?appid=$apiKey&units=metric';
    await location.getCurrentLocation();
    url = url + '&lat=${location.latitude}' + '&lon=${location.longitude}';
    http.Response data = await http.get(url);
    Map weatherData = {};
    var decodedData = jsonDecode(data.body);
    weatherData['statusCode'] = data.statusCode;
    if (weatherData['statusCode'] == 200) {
      weatherData['temp'] = decodedData['main']['temp'].round();
      weatherData['condition'] = decodedData['weather'][0]['id'].toInt();
      weatherData['city'] = decodedData['name'];
      weatherData['icon'] = weatherModel.getWeatherIcon(weatherData['condition']);
      weatherData['message'] = weatherModel.getMessage(weatherData['temp']);
      weatherData['in'] = 'in';
    }
      if (weatherData['temp'] == null) {
      weatherData = {
        'temp': '0',
        'icon': 'Error',
        'message': 'No valid data',
        'in': '',
        'city': '',
      };
    }
    return weatherData;
  }
}
