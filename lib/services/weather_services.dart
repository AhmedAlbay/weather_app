// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;


import '../models/weather_model.dart';

class WeatherService {
  WeatherModel? weather;
 
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'ece1b696ef7640ad85942228230404';
  Future<WeatherModel?> getWeather({required String cityName}) async {
     
    var url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    weather = WeatherModel.fromJson(data);
  
 
  return weather;
  
  }
  
    
}
