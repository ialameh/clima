import 'package:http/http.dart' as http;
import 'package:clima/screens/location.dart';

class WeatherByLocation {

Location location = Location();
String url = 'https://api.openweathermap.org/data/2.5/weather?appid=4602fc067646ed034c3f15dd642c9298';

String apiKey = '4602fc067646ed034c3f15dd642c9298';
void getURLInformation() async {
  await location.getCurrentLocation();
  url = url + '&lat=${location.latitude}' + '&lon=${location.longitude}';

  print(url);
  print (location.latitude);
  print (location.longitude);
  print ('now fetching data');
  http.Response response = await http.get(url);
  print(response.body);
  print(response.statusCode);
  print ('body me');
}

}