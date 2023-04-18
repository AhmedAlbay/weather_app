
// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  String? CityName;

  WeatherModels? _weatherData;
  set weatherData(WeatherModels? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModels? get weatherData => _weatherData;
}
