import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    Uri uri = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=0848b6375b0c44af951181922221108&q=$latitude,$longitude&aqi=no");
    var response = await http.get(uri);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
