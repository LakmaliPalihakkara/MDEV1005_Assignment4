import 'dart:convert';

import 'package:assignment4/models.dart';
import 'package:http/http.dart' as http;

//Class to make API call and get weather response.
class DataService {
  Future<WeatherResponse> getWeather(String city) async {

    final queryParameters = {
      'q': city,
      'appid': 'ad2b4b94927acbaf86681cf4cc92875f',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}