// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;
  String? cityName;
  WeatherModel? get weatherModel => _weatherModel;
  set weatherModel(WeatherModel? weather) {
    _weatherModel = weather;
    notifyListeners();
  }
}
