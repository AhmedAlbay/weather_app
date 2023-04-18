import 'package:flutter/material.dart';

class WeatherModels {
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherstate;

  WeatherModels(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherstate});
  factory WeatherModels.fromjson(dynamic data) {
    var jsondata = data["forecast"]["forecastday"][0]["day"];
    return WeatherModels(
        date:DateTime.parse(data['location']['localtime']),
        temp: jsondata["avgtemp_c"],
        maxtemp: jsondata["maxtemp_c"],
        mintemp: jsondata["mintemp_c"],
        weatherstate: jsondata["condition"]["text"]);
  }
  String getImage() {
    if (weatherstate == 'Clear' || weatherstate == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherstate == 'Sleet' ||
        weatherstate == 'Snow' ||
        weatherstate == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherstate == 'Light Rain' ||
        weatherstate == 'Heavy Rain' ||
        weatherstate == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherstate == 'Thunderstorm' || weatherstate == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherstate == 'Moderate rain') {
      return 'assets/images/moderate.png';
    } else {
      return 'assets/images/clear.png';
    }
  } 

  MaterialColor getcolor() {
    if (weatherstate == 'Clear'||weatherstate=="Sunny" || weatherstate == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherstate == 'Sleet' ||
        weatherstate == 'Snow' ||
        weatherstate == 'Hail') {
      return Colors.blue;
    } else if (weatherstate == 'Light Rain' ||
        weatherstate == 'Heavy Rain' ||
        weatherstate == 'Showers') {
      return Colors.blueGrey;
    } else if (weatherstate == 'Thunderstorm' || weatherstate == 'Thunder') {
      return Colors.blue;
    } else if (weatherstate == 'Moderate rain') {
      return Colors.blue;
    } else {
      return Colors.blue;
    }
  }
}
