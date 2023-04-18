import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  String BaseUrl = 'http://api.weatherapi.com/v1';
  String ApiKey = ' ece1b696ef7640ad85942228230404';
  Future <WeatherModels> getWeather({required String CityName}) async {
    Uri url =
        Uri.parse('$BaseUrl/forecast.json?key=$ApiKey&q=$CityName&days=1');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModels weather = WeatherModels.fromjson(data);
    return weather;
  }
}
