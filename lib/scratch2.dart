
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  getURLInformation();
}
void getURLInformation() async {
  
  http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=439d4b804bc8187953eb36d2a8c26a02');
  var weather = jsonDecode(response.body)['weather'][0]['id'];
  print(weather);
  
  
}